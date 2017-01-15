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

    $sections = ProductSections::query()
      ->columns('IBLOCK_SECTION_ID AS ID')
      ->where('IBLOCK_ELEMENT_ID = :id:')
      ->bind([
        'id' => $product->ID
      ])
      ->execute()     
      ->toArray();

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

    $this->view->product = $product;
    $this->view->images = $images;
    $this->view->sections = $sections;
    $this->view->section = $sections[0];
  }
}