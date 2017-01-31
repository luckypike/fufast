<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\View;

class StaticController extends Controller {
  public function logoAction() {


  }

  public function indexAction() {

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