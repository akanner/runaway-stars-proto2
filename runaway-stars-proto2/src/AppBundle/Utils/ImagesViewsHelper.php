<?php

namespace AppBundle\Utils;

use Symfony\Component\Asset\Packages;
class ImagesViewsHelper{

    /**
     * @var Packages
     */
    private $assetPackage;

    public function __construct(Packages $assetPackage){
        $this->assetPackage = $assetPackage;
    }
    /**
     * transforms all Images Entities to DTO AppBundle\ViewObjects\ViewImage
     */
    public function getViewImages($image, $tooltipText = null)
    {
        //in case that $img is correct, we take the path of the "marked" version of the image
        $markedRgbImage= null;
        $markedHeatImage= null;
        $markedCoolImage= null;
        $markedHsvImage= null;
        if ($image->getIsCorrect()) {
            $markedRgbImage = $this->getTaskUrl($image->getMarkedRgbImage());
            $markedHeatImage = $this->getTaskUrl($image->getMarkedHeatImage());
            $markedCoolImage= $this->getTaskUrl($image->getMarkedCoolImage());
            $markedHsvImage= $this->getTaskUrl($image->getMarkedHsvImage());
        }
        $rgbImage = new \AppBundle\ViewObjects\ViewImage(
            $image->getId(),
            static::getTaskUrl($image->getRgbImagePath()), $image->getIsCorrect(), $tooltipText, $markedRgbImage
            );
        $coolImage = new \AppBundle\ViewObjects\ViewImage(
            $image->getId(),
            static::getTaskUrl($image->getCoolImagePath()), $image->getIsCorrect(), $tooltipText, $markedCoolImage
            );
        $heatImage = new \AppBundle\ViewObjects\ViewImage(
            $image->getId(),
            static::getTaskUrl($image->getHeatImagePath()), $image->getIsCorrect(), $tooltipText, $markedHeatImage
            );
        $hsvImage = new \AppBundle\ViewObjects\ViewImage(
            $image->getId(),
            static::getTaskUrl($image->getHsvImagePath()), $image->getIsCorrect(), $tooltipText, $markedHsvImage
            );

        return array($rgbImage,$coolImage,$heatImage,$hsvImage);
    }

        /**
     * gets gets the URL of an image
     *
     * @param string    $imageName     image's name
     *
     * @return string image's URL
     *
     */
    public function getTaskUrl($imageName)
    {
        $urlImage = $this->assetPackage->getUrl("bundles/app/images/tasks/$imageName");
        return $urlImage;
    }

    public function getImageUrl($imageName)
    {
      $urlImage = $this->assetPackage->getUrl("bundles/app/images/$imageName");
      return $urlImage;
    }

}