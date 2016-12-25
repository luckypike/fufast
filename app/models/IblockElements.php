<?php

use Phalcon\Mvc\Model;

class IblockElements extends Model {
  public function initialize() {
    $this->setSource("b_iblock_element");

    $this->hasOne('ID', 'Products', 'ID');    
  } 
}