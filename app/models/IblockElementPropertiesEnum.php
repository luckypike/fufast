<?php

use Phalcon\Mvc\Model;

class IblockElementPropertiesEnum extends Model {
  public function initialize() {
    $this->setSource('b_iblock_property_enum');
  } 
}