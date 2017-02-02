<?php

use Phalcon\Mvc\Model;

class Baskets extends Model {
  public function initialize() {
    $this->setSource('b_sale_basket');
  }
}