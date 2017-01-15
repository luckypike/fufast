<?php

use Phalcon\Mvc\Model;

class IblockElementProperties extends Model {
  public function initialize() {
    $this->setSource("b_iblock_element_property");
  } 
}