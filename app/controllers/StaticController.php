<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\View;

class StaticController extends Controller {
  public function logoAction() {


  }

  public function indexAction() {

    $sections = [
      [
        'section' => 'qwe',
        'goods' => [2577, 2030, 2646, 2499, 1677, 2639, 1682, 1513]
      ]
    ];

    foreach($sections as $k => $v) {
      $sections[$k]['goods'] = Products::query()
        ->columns('Products.ID, IblockElements.NAME, IblockElements.DETAIL_PICTURE, ProductPrices.PRICE, ProductPrices.CURRENCY')
        ->innerJoin('IblockSectionElements', 'IblockSectionElements.IBLOCK_ELEMENT_ID = Products.ID')
        ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
        ->innerJoin('ProductPrices', 'ProductPrices.PRODUCT_ID = Products.ID')
        ->inWhere('Products.ID', $v['goods'])
        ->execute()
        ->toArray();

      $sections[$k]['goods'] = array_chunk($sections[$k]['goods'], 2);
    }


    $this->view->sections = $sections;

  }

  public function catalogAction() {
    $this->response->redirect('/');
  }

  public function aboutAction() {
    $this->tag->prependTitle('О компании «Поволжье-спецодежда»');
  }

  public function contactsAction() {
    $this->tag->prependTitle('Контакты');
  }

  public function route404Action() {
    // $this->view->pick("error/index");
    // $this->tag->prependTitle('Ошибка 404');

    // $this->view->disableLevel(View::LEVEL_MAIN_LAYOUT);
    // $this->response->setStatusCode(404, "Not Found");
    // return $this->response;
  }
}