<?php

use Phalcon\Mvc\Model;

class Sections extends Model {
  public $CHILDS;

  public function initialize() {
    $this->setSource('b_iblock_section');
  }

  public function beforeCreate() {
    if (!isset($this->CHILDS)) {
      $this->CHILDS = array();
    }
  }  
}