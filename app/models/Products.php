<?php

use Phalcon\Mvc\Model;

class Products extends Model {
  public function initialize() {
    $this->setSource("b_catalog_product");

    $this->hasOne('ID', 'IblockElemets', 'ID');  
  }
}