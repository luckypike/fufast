<?php

use Phalcon\Mvc\Model;

class ProductSections extends Model {
  public function initialize() {
    $this->setSource('b_iblock_section_element');
  } 
}