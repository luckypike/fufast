<?php

use Phalcon\Mvc\Controller;

class IndexController extends Controller {
  public function indexAction() {

  }

  public function catalogAction() {
    $this->response->redirect('/');
  }  
}