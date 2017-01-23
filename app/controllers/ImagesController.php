<?php

use Phalcon\Mvc\Controller;

class ImagesController extends Controller {
  public function coverAction($id) {
    $path = '../upload/last/' . $id . '.jpg';

    if(!file_exists($path)) {
      $images = ProductImages::query()
        ->columns('SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
        ->innerJoin('IblockElements', 'IblockElements.DETAIL_PICTURE = ProductImages.ID')
        ->where('IblockElements.ID = :id:')
        ->bind([
          'id' => $id
        ])
        ->execute()     
        ->toArray();

      // 

      $images_more = ProductImages::query()
        ->columns('SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
        ->where('IBLOCK_PROPERTY_ID = :property_id: AND IBLOCK_ELEMENT_ID = :element_id:')
        ->innerJoin('IblockElementProperties', 'IblockElementProperties.VALUE = ProductImages.ID')
        ->orderBy('IblockElementProperties.ID ASC')
        ->bind([
          'property_id' => 111,
          'element_id' => $id
        ])
        ->execute()
        ->toArray();

      if($images_more) {
        $images = array_merge($images, $images_more);
      }

      if(count($images) > 0) {
        $image = new Phalcon\Image\Adapter\Imagick('../upload/' . $images[0]['SUBDIR'] . '/' . $images[0]['FILE_NAME']);   
        $height = $image->getHeight();
        $width = $image->getWidth();
        $image->resize(1200, null, \Phalcon\Image::WIDTH)->resize(null, 1500, \Phalcon\Image::HEIGHT)->background('#ffffff')->crop(1200, 1500);
        $image->save($path, 80);
      } else {

      }
    }

    $this->response->setContentType('image/jpeg');
    $this->response->setContent(file_get_contents($path));
    return $this->response;    
  }
}