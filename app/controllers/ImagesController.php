<?php

use Phalcon\Mvc\Controller;

//TODO: DRY this

class ImagesController extends Controller {


  public function fileAction($id, $size) {
    if(!is_dir('../upload/cover/images/' . $id)) {
      mkdir('../upload/cover/images/' . $id, 0755, true);
    }

    if(!in_array($size, array('ph', 'list', 'small', 'large'))) die;

    $d = array(
      'ph' => array(20, 25),
      'list' => array(800, 1000),
      'small' => array(400, 500),
      'large' => array(1200, 1500),
    );

    $path = '../upload/cover/images/' . $id . '/' . $size . '.jpg';

    if(!file_exists($path)) {
      $images = ProductImages::query()
        ->columns('ID, SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
        ->where('ID = :id:', ['id' => $id])
        ->execute()
        ->toArray();

      if(count($images) > 0) {
        $current = $images[0];

        $image = new \Imagick(realpath('../upload/' . $current['SUBDIR'] . '/' . $current['FILE_NAME']));

        if($image->getImageColorspace() == \Imagick::COLORSPACE_CMYK) {
          $image->transformimagecolorspace(\Imagick::COLORSPACE_SRGB);
        }

        if($image->getImageWidth() / $image->getImageHeight() < 4 / 5) {
          if($image->getImageHeight() < $d[$size][1]) {
            $d[$size][1] = $image->getImageHeight();
            $d[$size][0] = $d[$size][1] / 5 * 4;
          }
        } else {
          if($image->getImageWidth() < $d[$size][0]) {
            $d[$size][0] = $image->getImageWidth();
            $d[$size][1] = $d[$size][0] / 4 * 5;
          }
        }

        $k = 0.8;

        $image->thumbnailImage($d[$size][0] * $k, $d[$size][1] * $k, true, true);

        $canvas = new \Imagick();
        $canvas->newImage($d[$size][0], $d[$size][1], new ImagickPixel('white'));

        if($size == 'ph') $image->blurImage(2, 1);

        $canvas->compositeimage($image, \Imagick::COMPOSITE_OVER, $d[$size][0] * (1 - $k) / 2, $d[$size][1] * (1 - $k) / 2);

        $canvas->setImageCompressionQuality(70);
        $canvas->setImageFormat('jpeg');
        $canvas->writeImage($path);

        // header("Content-Type: image/jpeg");
        // echo $canvas->getImageBlob();

      }
    }

    $this->response->setContentType('image/jpeg');
    $this->response->setContent(file_get_contents($path));
    return $this->response;
  }

  public function coverAction($id, $size) {
    if(!is_dir('../upload/cover/title/' . $id)) {
      mkdir('../upload/cover/title/' . $id, 0755, true);
    }

    if(!in_array($size, array('ph', 'list', 'small', 'large'))) die;

    $d = array(
      'ph' => array(20, 25),
      'list' => array(800, 1000),
      'small' => array(400, 500),
      'large' => array(1200, 1500),
    );

    $path = '../upload/cover/title/' . $id . '/' . $size . '.jpg';

    if(!file_exists($path)) {
      $images = ProductImages::query()
        ->columns('ProductImages.ID, SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
        ->innerJoin('IblockElements', 'IblockElements.DETAIL_PICTURE = ProductImages.ID')
        ->where('IblockElements.ID = :id:')
        ->bind([
          'id' => $id
        ])
        ->execute()
        ->toArray();

      //

      $images_more = ProductImages::query()
        ->columns('ProductImages.ID, SUBDIR, MODULE_ID, FILE_NAME, ORIGINAL_NAME')
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

      // TODO: Arghh! Do something!
      if(count($images) > 0) {
        $current = $images[0];

        $image = new \Imagick(realpath('../upload/' . $current['SUBDIR'] . '/' . $current['FILE_NAME']));

        if($image->getImageColorspace() == \Imagick::COLORSPACE_CMYK) {
          $image->transformimagecolorspace(\Imagick::COLORSPACE_SRGB);
        }

        if($image->getImageWidth() / $image->getImageHeight() < 4 / 5) {
          if($image->getImageHeight() < $d[$size][1]) {
            $d[$size][1] = $image->getImageHeight();
            $d[$size][0] = $d[$size][1] / 5 * 4;
          }
          // $height = $image->getImageHeight();
          // $width = $height;
        } else {
          if($image->getImageWidth() < $d[$size][0]) {
            $d[$size][0] = $image->getImageWidth();
            $d[$size][1] = $d[$size][0] / 4 * 5;
          }
        }

        $k = 0.8;

        $image->thumbnailImage($d[$size][0] * $k, $d[$size][1] * $k, true, true);

        $canvas = new \Imagick();
        $canvas->newImage($d[$size][0], $d[$size][1], new ImagickPixel('white'));

        if($size == 'ph') $image->blurImage(2, 1);

        $canvas->compositeimage($image, \Imagick::COMPOSITE_OVER, $d[$size][0] * (1 - $k) / 2, $d[$size][1] * (1 - $k) / 2);

        $canvas->setImageFormat('jpeg');
        $canvas->setImageCompressionQuality(70);
        $canvas->writeImage($path);
        // header("Content-Type: image/jpeg");
        // echo $canvas->getImageBlob();

      } else {

      }
    }

    $this->response->setContentType('image/jpeg');
    $this->response->setContent(file_get_contents($path));
    return $this->response;
  }
}