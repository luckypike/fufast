<?php

use Phalcon\Mvc\User\Component;

class Tree extends Component {
  private $tree;
  private $flat;

  public function __construct() {
    $sections = Sections::query()
      ->columns('IBLOCK_SECTION_ID AS PARENT_ID, ID, NAME, CODE, DEPTH_LEVEL')
      ->where('IBLOCK_ID = 20')
      ->orderBy('DEPTH_LEVEL ASC')
      ->execute();

    foreach($sections as $section) {
      if(!isset($section->CHILDS)) $section->CHILDS = array();
      $this->flat[$section->ID] = $section;
      if(isset($this->flat[$section->PARENT_ID])) $this->flat[$section->PARENT_ID]->CHILDS[] = $section->ID;
    }

    // TODO: Create class for tree element, like TreeElement
    // foreach($rows as $row) {
    //   if(!isset($row['CHILDS'])) $row['CHILDS'] = array();
    //   $this->flat[$row['ID']] = $row;
    //   // $this->flat[$pid]['CHILDS']
    //   if(isset($this->flat[$row['PARENT_ID']])) $this->flat[$row['PARENT_ID']]['CHILDS'][] = $row['ID'];
    // }
  }

  public function listSections() {

  }

  public function getBySlug($slug) {
    foreach($this->flat as $s) {
      if(strtolower($s->CODE) == strtolower($slug)) {
        return $s;
      }
    }
  }

  public function getName($section_id) {
    return $this->flat[$section_id]->NAME;
  }

  public function getChilds($section_id) {
    $items = array();

    foreach($this->flat[$section_id]->CHILDS as $c) {
      $items[] = $this->flat[$c];
    }

    return $items;
  }

  public function getSiblings($section_id) {
    $parent = $this->getParent($section_id);
    if(count($parent->CHILDS) > 0) {
      $childs = array();
      foreach($parent->CHILDS as $id) {
        $childs[] = $this->flat[$id];
      }
      return $childs;
    } else {
      return false;
    }
  }

  public function getRoots() {
    $items = array();

    foreach($this->flat as $item) {
      if($item->PARENT_ID == false) $items[] = $item;
    }

    return $items;
  }

  public function getMenu() {
    return array(
      $this->flat[114],
      $this->flat[159],
      $this->flat[168],
      $this->flat[177]
    );
  }

  public function getParents($section_id) {
    $parents = array();
    
    if($parent = $this->getParent($section_id)) {
      $parents = $this->getParents($parent->ID);
    } else {
    }

    $parents[] = $this->flat[$section_id];

    return $parents;
  }

  private function getParent($section_id) {
    $parent_id = $this->flat[$section_id]->PARENT_ID;
    if(isset($this->flat[$parent_id])) {
      return $this->flat[$parent_id];
    } else {
      return false;
    }
  }
}