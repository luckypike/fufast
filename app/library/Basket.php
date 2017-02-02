<?php

use Phalcon\Mvc\User\Component;

class Basket extends Component {
  public function getItems ($fuser = false) {
    // if(!$fuser) $fuser = $this->session->get('fuser');


    $count = 0;

    if ($this->session->has('fuser')) {
      $fuser = $this->session->get('fuser');

      $items = Baskets::query()
        ->columns('QUANTITY')
        ->where('FUSER_ID = :user:', ['user' => 2624])
        ->execute();

      foreach($items as $item) {
        $count += $item['QUANTITY'];
      }
    }

    return $count;
  }
}