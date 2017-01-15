<?php

use Phalcon\Mvc\Controller;

class IndexController extends Controller {
  public function indexAction() {
    $products = Products::query()
      ->columns('Products.ID, IblockElements.NAME')
      ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
      ->orderBy('Products.ID DESC')
      // ->limit(10)
      ->execute();

    // die(print_r($products));
    $this->view->products = $products;
  }
}