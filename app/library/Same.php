<?php

use Phalcon\Mvc\User\Component;

class Same extends Component {
  public function getSections($section) {
    $sections = [
      114 => [
        [162, 165, 246, 247, 248, 708, 709, 819],
        [169, 170, 171, 172, 173, 174, 175, 176],
        [179, 208, 211, 212, 216, 217, 218, 219],
        [221, 222]
      ],
    ];

    if(isset($sections[$section])) {
      return $sections[$section];
    } else {
      return array();
    }
  }

  public function getAssoc($sections) {
    $products_ids = [];

    foreach($sections as $ids) {
      $rows = Products::query()
        ->columns('Products.ID')
        ->innerJoin('IblockSectionElements', 'IblockSectionElements.IBLOCK_ELEMENT_ID = Products.ID')
        ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
        ->inWhere('IblockSectionElements.IBLOCK_SECTION_ID', $ids)
        ->andWhere('IblockElements.ACTIVE = :active:', ['active' => 'Y'])
        ->orderBy('Products.ID DESC')
        ->execute()
        ->toArray();

        shuffle($rows);
        foreach(array_slice($rows, 0, 2) as $row) {
          $products_ids[] = $row['ID'];
        }
    }


    $products = Products::query()
      ->columns('Products.ID, IblockElements.NAME, IblockElements.DETAIL_PICTURE, ProductPrices.PRICE, ProductPrices.CURRENCY')
      ->innerJoin('IblockSectionElements', 'IblockSectionElements.IBLOCK_ELEMENT_ID = Products.ID')
      ->innerJoin('IblockElements', 'IblockElements.ID = Products.ID')
      ->innerJoin('ProductPrices', 'ProductPrices.PRODUCT_ID = Products.ID')
      ->inWhere('Products.ID', array_slice($products_ids, 0, 6))
      ->distinct(true)
      ->execute();

    return $products;
  }
}