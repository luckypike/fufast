<?php

use Phalcon\Mvc\User\Component;

class Tree extends Component {
  private $tree;
  private $flat;

  public function __construct() {
    $sections = Sections::query()
      ->columns('IBLOCK_SECTION_ID AS PARENT_ID, ID, NAME, DESCRIPTION, CODE, DEPTH_LEVEL, SORT')
      ->where('IBLOCK_ID = 20')
      ->orderBy('DEPTH_LEVEL ASC, SORT ASC')
      ->execute();

    foreach($sections as $section) {
      if(!isset($section->CHILDS)) $section->CHILDS = array();
      $section->NAME_SHORT = $section->NAME;
      if($section->PARENT_ID && $section->PARENT_ID == 114) {
        $section->NAME_SHORT = $this->mb_ucfirst(trim(preg_replace('/(одежда|спецодежда)/iu', '', $section->NAME_SHORT)));
      }

      if($section->PARENT_ID && $section->PARENT_ID == 159) {
        $section->NAME_SHORT = $this->mb_ucfirst(trim(preg_replace('/(обувь|спецобувь)/iu', '', $section->NAME_SHORT)));
      }

      if($section->PARENT_ID && $section->PARENT_ID == 168) {
        $section->NAME_SHORT = $this->mb_ucfirst(trim(preg_replace('/(перчатки)/iu', '', $section->NAME_SHORT)));
      }

      if($section->PARENT_ID && $section->PARENT_ID == 177) {
        $section->NAME_SHORT = $this->mb_ucfirst(trim(preg_replace('/(средства защиты)/iu', '', $section->NAME_SHORT)));
      }

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

  public function isRoot($section_id) {
    $roots = array(114, 159, 168, 177);
    return in_array($section_id, $roots);
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

  public function getAllChilds($section_id) {
    $items = array();

    foreach($this->flat[$section_id]->CHILDS as $id) {
      $items[] = $id;
      $items = array_merge($items, $this->getAllChilds($id));
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

  public function getAll() {
    return $this->flat;
  }

  public function getMenu() {
    $items = array();

    $controllerName = $this->view->getControllerName();

    $section = false;

    if($controllerName == 'sections') {
      $section = $this->view->section;
    }

    if($controllerName == 'products') {
      $section = $this->view->section;
    }

    if($section) {
      $section = $this->getParents($section->ID)[0];
    }

    foreach($this->flat as $item) {
      $item->active = $section && $section->ID == $item->ID;
      if($this->isRoot($item->ID)) $items[] = $item;
    }

    return $items;
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

  public function mb_ucfirst($string) {
    $strlen = mb_strlen($string);
    $firstChar = mb_substr($string, 0, 1);
    $then = mb_substr($string, 1, $strlen - 1);
    return mb_strtoupper($firstChar) . $then;
}
}