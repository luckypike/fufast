<?php

use Phalcon\Mvc\Model;

class ProductPrices extends Model {
  public function initialize() {
    $this->setSource('b_catalog_price');
  }
}
