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
      ->columns('Products.ID, IblockElements.NAME, IblockElements.DETAIL_TEXT, IblockElements.DETAIL_PICTURE')
      ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
      ->where('Products.ID = :id:')
      ->bind(['id' => $id])
      ->execute()
      ->getFirst();

    $this->tag->prependTitle($product->NAME);

    $sections = ProductSections::query()
      ->columns('IBLOCK_SECTION_ID AS ID')
      ->where('IBLOCK_ELEMENT_ID = :id:')
      ->bind([
        'id' => $product->ID
      ])
      ->execute();     

    $images = ProductImages::query()
      ->columns('SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
      ->where('ID = :id:')
      ->bind([
        'id' => $product->DETAIL_PICTURE
      ])
      ->execute()     
      ->toArray();

    $images_more = ProductImages::query()
      ->columns('SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
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
      ->execute()
      ->toArray();

    foreach($results as $i => $v) {
      if(array_key_exists($v['ID'], $props_elem)) {
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
          foreach($props_elem_enum[$height] as $ih => $vh) {
            $order[] = array(
              array($size => $is, $height => $ih),
              "{$vs} / {$vh}"
            );            
          }
        }
      } else {
        foreach($props_elem_enum[$size] as $i => $v) {
          $order[] = array(
            array($size => $i),
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
}