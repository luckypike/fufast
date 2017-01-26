<?php

use Phalcon\Mvc\Model;

class IblockProperties extends Model {
  public function initialize() {
    $this->setSource("b_iblock_property");
  } 
}