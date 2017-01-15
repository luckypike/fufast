<?php

use Phalcon\Mvc\Model;

class Sections extends Model {
  public function initialize() {
    $this->setSource('b_iblock_section');
  }
}