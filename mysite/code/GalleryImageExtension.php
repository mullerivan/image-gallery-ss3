<?php
/**
 * Created by PhpStorm.
 * User: ivan
 * Date: 27/02/14
 * Time: 11:38 AM
 */
class GalleryImageExtension extends DataExtension {
    private static $belongs_many_many = array('Galleries' => 'GalleryPage');
}