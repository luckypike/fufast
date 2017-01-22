<?php

use Phalcon\Mvc\Controller;

class SectionsController extends Controller {
  public function showAction($slug) {
    $tree = $this->di->getTree();
    $section = $tree->getBySlug($slug);


    $products = Products::query()
      ->columns('Products.ID, IblockElements.NAME')
      ->innerJoin('IblockSectionElements', 'IblockSectionElements.IBLOCK_ELEMENT_ID = Products.ID')
      ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
      ->where('IblockSectionElements.IBLOCK_SECTION_ID = :section:')
      ->bind(['section' => $section->ID])
      ->orderBy('Products.ID DESC')
      ->execute();

    $this->view->section = $section;
    $this->view->products = $products;
  }
}
