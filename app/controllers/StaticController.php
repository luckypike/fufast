<?php

use Phalcon\Mvc\Controller;

class StaticController extends Controller {
  public function logoAction() {


  }

  public function aboutAction() {
    $this->tag->prependTitle('О компании «Поволжье-спецодежда»');
  }

  public function contactsAction() {
    $this->tag->prependTitle('Контакты');
  }
}