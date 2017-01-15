<?php

use Phalcon\Mvc\User\Component;

class Tree extends Component {
  private $tree;
  private $flat;

  public function __construct() {
    $rows = Sections::query()
      ->columns('IBLOCK_SECTION_ID AS PARENT_ID, ID, NAME, DEPTH_LEVEL')
      ->where('IBLOCK_ID = 20')
      ->execute()
      ->toArray();

    foreach($rows as $row) {
      $this->flat[$row['ID']] = $row;
    }
  }

  public function listSections() {

  }

  public function getName($section_id) {
    return $this->flat[$section_id]['NAME'];
  }

  public function getParents($section_id) {
    $parents = array();
    
    if($parent = $this->getParent($this->flat[$section_id]['PARENT_ID'])) {
      $parents = $this->getParents($parent['ID']);
      // $parents[] = $parent;
    } else {
    }

    $parents[] = $this->flat[$section_id];

    return $parents;
  }

  private function getParent($section_id) {
    if(isset($this->flat[$section_id])) {
      return $this->flat[$section_id];
    } else {
      return false;
    }
  }
}