<?php

use Phalcon\Mvc\Controller;

class SectionsController extends Controller {
  public function showAction($slug) {
    $tree = $this->di->getTree();
    $section = $tree->getBySlug($slug);

    if(!$section) {
      $this->response->setStatusCode(404, "Not Found");
      // $this->view->pick("static/route404");
      $this->response->setContent("Sorry, the page doesn't exist");
      return $this->response;
    }

    $this->tag->prependTitle($section->NAME);
    $section_childs = $tree->getChilds($section->ID);
    $void = count($section_childs) == 0;

    if(!$void) {
      foreach($section_childs as $cs) {
        $in = $tree->getAllChilds($cs->ID);
        $in[] = $cs->ID;

        $results = Products::query()
          ->columns('Products.ID, IblockElements.NAME, IblockElements.DETAIL_PICTURE, ProductPrices.PRICE, ProductPrices.CURRENCY')
          ->innerJoin('IblockSectionElements', 'IblockSectionElements.IBLOCK_ELEMENT_ID = Products.ID')
          ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
          ->innerJoin('ProductPrices', 'ProductPrices.PRODUCT_ID = Products.ID')
          ->inWhere('IblockSectionElements.IBLOCK_SECTION_ID', $in)
          ->andWhere('IblockElements.ACTIVE = :active:', ['active' => 'Y'])
          ->orderBy('Products.ID DESC')
          ->limit(9)
          ->execute();

        $cs->PRODUCTS = array();
        foreach($results as $result) {
          $cs->PRODUCTS[] = $result;
        }

        $cs->PRODUCT = count($cs->PRODUCTS) > 5 ? array_shift($cs->PRODUCTS) : false;

      }
    } else {
      $products = Products::query()
        ->columns('Products.ID, IblockElements.NAME, IblockElements.DETAIL_PICTURE, ProductPrices.PRICE, ProductPrices.CURRENCY')
        ->innerJoin('IblockSectionElements', 'IblockSectionElements.IBLOCK_ELEMENT_ID = Products.ID')
        ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
        ->innerJoin('ProductPrices', 'ProductPrices.PRODUCT_ID = Products.ID')
        ->where('IblockSectionElements.IBLOCK_SECTION_ID = :section:')
        ->bind(['section' => $section->ID])
        ->orderBy('Products.ID DESC')
        ->execute();
    }
    // die;

    // $products_all = array();




    $this->view->section = $section;
    $this->view->section_childs = $section_childs;
    $this->view->products = $products;
    $this->view->void = $void;
  }
}
