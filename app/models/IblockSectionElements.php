<?php

use Phalcon\Mvc\Model;

class IblockSectionElements extends Model {
  public function initialize() {
    $this->setSource('b_iblock_section_element');
  } 
}