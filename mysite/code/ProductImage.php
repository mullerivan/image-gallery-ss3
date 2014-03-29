<?php
  	class ProductImage extends Image {

		function generateProductImage($gd) {
			$gd->setQuality(80);
			return $gd->paddedResize(95,71);
		}

		function generateMainImage($gd) {
			$gd->setQuality(80);
			return $gd->paddedResize(600,450);
		}
	}	
?>