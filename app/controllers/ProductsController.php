<?php

use Phalcon\Mvc\Controller;

class ProductsController extends Controller {
  public function showAction($id) {

  $product = $this->modelsManager->createBuilder()
    ->columns('Products.ID, IblockElements.NAME')
    ->from('Products')
    ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
    ->where('Products.ID = :id:')
    ->getQuery()
    ->getSingleResult(['id' => $id]);    
    // $product = Products::findFirstByID($id);
    $this->view->product = $product;
  }
}