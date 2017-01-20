<?php

use Phalcon\Mvc\User\Component;

class Tree extends Component {
  private $tree;
  private $flat;

  public function __construct() {
    $rows = Sections::query()
      ->columns('IBLOCK_SECTION_ID AS PARENT_ID, ID, NAME, DEPTH_LEVEL')
      ->where('IBLOCK_ID = 20')
      ->orderBy('DEPTH_LEVEL ASC')
      ->execute()
      ->toArray();

    // TODO: Create class for tree element, like TreeElement
    foreach($rows as $row) {
      if(!isset($row['CHILDS'])) $row['CHILDS'] = array();
      $this->flat[$row['ID']] = $row;
      // $this->flat[$pid]['CHILDS']
      if(isset($this->flat[$row['PARENT_ID']])) $this->flat[$row['PARENT_ID']]['CHILDS'][] = $row['ID'];
    }
  }

  public function listSections() {

  }

  public function getName($section_id) {
    return $this->flat[$section_id]['NAME'];
  }

  public function getSiblings($section_id) {
    $parent = $this->getParent($section_id);
    if(count($parent['CHILDS']) > 0) {
      $childs = array();
      foreach($parent['CHILDS'] as $id) {
        $childs[] = $this->flat[$id];
      }
      return $childs;
    } else {
      echo 'QQ';
      return false;
    }
    // return $this->flat[]['CHILDS'];
  }

  public function getParents($section_id) {
    $parents = array();
    
    if($parent = $this->getParent($section_id)) {
      $parents = $this->getParents($parent['ID']);
      // $parents[] = $parent;
    } else {
    }

    $parents[] = $this->flat[$section_id];

    return $parents;
  }

  private function getParent($section_id) {
    $parent_id = $this->flat[$section_id]['PARENT_ID'];
    if(isset($this->flat[$parent_id])) {
      return $this->flat[$parent_id];
    } else {
      return false;
    }
  }
}