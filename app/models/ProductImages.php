<?php

use Phalcon\Mvc\Model;

class ProductImages extends Model {
  public function initialize() {
    $this->setSource("b_file");
  } 
}