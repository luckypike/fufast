<?php

use Phalcon\Mvc\Controller;

class ProductsController extends Controller {
  public function showAction($id) {

    // $product = $this->modelsManager->createBuilder()
    //   ->columns('Products.ID, IblockElements.NAME')
    //   ->from('Products')
    //   ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
    //   ->where('Products.ID = :id:')
    //   ->getQuery()
    //   ->getSingleResult(['id' => $id]);
    $product = Products::query()
      ->columns('Products.ID, IblockElements.NAME, IblockElements.DETAIL_TEXT, IblockElements.DETAIL_PICTURE, ProductPrices.PRICE, ProductPrices.CURRENCY')
      ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
      ->innerJoin('ProductPrices', 'ProductPrices.PRODUCT_ID = Products.ID')
      ->where('Products.ID = :id: AND IblockElements.ACTIVE = :active:')
      ->bind(['id' => $id, 'active' => 'Y'])
      ->execute()
      ->getFirst();

    if(!$product) {
      $this->response->setStatusCode(404, "Not Found");
      // $this->view->pick("static/route404");
      $this->response->setContent("Sorry, the page doesn't exist");
      return $this->response;
    }

    $Parsedown = new Parsedown();
    $product->DETAIL_TEXT_HTML = $Parsedown->text($product->DETAIL_TEXT);

    $this->tag->prependTitle($product->NAME);
    $this->metatag->setByLink('canonical', ['href' => $this->url->get('catalog/' . mb_strtolower($product->ID))]);
    $this->metatag->setByName('keywords', mb_substr(htmlspecialchars(strip_tags($product->NAME)), 0, 140));
    $this->metatag->setByName('description', mb_substr(str_replace("\n", '', htmlspecialchars(strip_tags($product->DETAIL_TEXT))), 0, 200));

    $sections = ProductSections::query()
      ->columns('IBLOCK_SECTION_ID AS ID')
      ->where('IBLOCK_ELEMENT_ID = :id:')
      ->bind([
        'id' => $product->ID
      ])
      ->execute();

    $images = ProductImages::query()
      ->columns('ProductImages.ID, SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
      ->where('ID = :id:')
      ->bind([
        'id' => $product->DETAIL_PICTURE
      ])
      ->execute()
      ->toArray();

    $images_more = ProductImages::query()
      ->columns('ProductImages.ID, SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
      ->where('IBLOCK_PROPERTY_ID = :property_id: AND IBLOCK_ELEMENT_ID = :element_id:')
      ->innerJoin('IblockElementProperties', 'IblockElementProperties.VALUE = ProductImages.ID')
      ->orderBy('IblockElementProperties.ID ASC')
      ->bind([
        'property_id' => 111,
        'element_id' => $product->ID
      ])
      ->execute()
      ->toArray();

    if($images_more) {
      $images = array_merge($images, $images_more);
    }

    // TODO: Rewrite. Create class for properties.
    $props = $props_elem = $props_elem_enum = [];

    $results = IblockElementProperties::query()
      ->columns('VALUE, IBLOCK_PROPERTY_ID')
      ->where('IblockElementProperties.IBLOCK_ELEMENT_ID = :id:')
      ->bind(['id' => $id])
      ->execute()
      ->toArray();

    foreach($results as $i => $v) {
      if(!array_key_exists($v['IBLOCK_PROPERTY_ID'], $props_elem)) $props_elem[$v['IBLOCK_PROPERTY_ID']] = [];
      $props_elem[$v['IBLOCK_PROPERTY_ID']][] = $v['VALUE'];
    }

    $results = IblockProperties::query()
      ->columns('ID, NAME, SORT, PROPERTY_TYPE')
      ->orderBy('SORT ASC')
      ->inWhere('PROPERTY_TYPE', ['S', 'L'])
      ->where('ACTIVE = :active:')
      ->bind(['active' => 'Y'])
      ->execute()
      ->toArray();

    foreach($results as $i => $v) {
      if(array_key_exists($v['ID'], $props_elem)) {
        switch($v['ID']) {
          case 139:
          case 140:
            $v['SUFFIX'] = 'г/м<sup>2</sup>';
            break;

          case 142:
            $v['SUFFIX'] = 'кг';
            break;

          case 145:
          case 147:
            $v['SUFFIX'] = 'м<sup>3</sup>';
            break;

          case 146:
            $v['SUFFIX'] = 'шт.';
            break;
        }

        $props[$v['ID']] = $v;
      }
    }

    $results = IblockElementPropertiesEnum::query()
      ->columns('ID, PROPERTY_ID, VALUE, SORT')
      ->orderBy('SORT ASC')
      ->execute()
      ->toArray();

    foreach($results as $i => $v) {
      if(!isset($props_elem_enum[$v['PROPERTY_ID']])) $props_elem_enum[$v['PROPERTY_ID']] = [];
      $props_elem_enum[$v['PROPERTY_ID']][$v['ID']] = $v['VALUE'];
    }

    // print_r($props_elem);
    // print_r($props_elem_enum);
    // die;

    $size = false;

    foreach([98, 102, 103, 104, 105, 106] as $i) {
      if(isset($props[$i])) {
        // $size = $props_elem_enum[$i];
        unset($props[$i]);
        $size = $i;
      }
    }

    $height = false;
    if(isset($props[107])) {
      // $height = $props_elem_enum[107];
      unset($props[107]);
      $height = 107;
    }

    $order = array();

    if($size) {
      if($height) {
        foreach($props_elem_enum[$size] as $is => $vs) {
          if(!in_array($is, $props_elem[$size])) continue;
          foreach($props_elem_enum[$height] as $ih => $vh) {
            if(!in_array($ih, $props_elem[$height])) continue;
            $order[] = array(
              array($size => $is, $height => $ih, 'size' => $vs, 'height' => $vh),
              "{$vs} / {$vh}"
            );
          }
        }
      } else {
        foreach($props_elem_enum[$size] as $i => $v) {
          if(!in_array($i, $props_elem[$size])) continue;
          $order[] = array(
            array($size => $i, 'size' => $size),
            $v
          );
        }
      }
    }


    $orders = count($order);
    if($orders > 3) {
      $order = array(array_slice($order, 0, ceil($orders / 2)), array_slice($order, ceil($orders / 2)));
    } else {
      $order = array($order, array());
    }



    // print_r($props_elem_enum);
    // print_r($props_elem);
    // print_r($order);
    // die;


    $this->view->product = $product;
    $this->view->images = $images;
    $this->view->props = $props;
    $this->view->props_elem = $props_elem;
    $this->view->props_elem_enum = $props_elem_enum;

    $this->view->size = $size;
    $this->view->height = $height;
    $this->view->order = $order;

    $this->view->sections = $sections;
    $this->view->section = $sections[0];
  }

  public function basketAction () {
    $this->session->set('fuser', $this->request->get('user'));
  }

  public function searchAction () {
    $query = $this->request->get('q', 'string', false);

    $this->tag->prependTitle('Поиск');
    $this->metatag->setByLink('canonical', ['href' => $this->url->get('search')]);

    $products = [];
    if($query) {
      $products = Products::query()
        ->columns('Products.ID, IblockElements.NAME, IblockElements.DETAIL_PICTURE, ProductPrices.PRICE, ProductPrices.CURRENCY')
        ->innerJoin('IblockSectionElements', 'IblockSectionElements.IBLOCK_ELEMENT_ID = Products.ID')
        ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
        ->innerJoin('ProductPrices', 'ProductPrices.PRODUCT_ID = Products.ID')
        ->where('IblockElements.SEARCHABLE_CONTENT LIKE :query:', ['query' => '%' . $query . '%'])
        ->andWhere('IblockElements.ACTIVE = :active:', ['active' => 'Y'])
        ->orderBy('IblockElements.SORT ASC, ProductPrices.PRICE ASC')
        ->execute();
    }

    $this->view->products = $products;
    $this->view->query = $query;
  }
}