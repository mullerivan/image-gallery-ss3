<?php

/**
 * Defines the ArticlePage page type
 */
class OtherMachinesPage extends Page
{
    static $db = array(
        'StockNo' => 'Varchar',
        'size' => 'Varchar',
        'Extras' => 'Text',
        'Price' => 'Varchar'
    );
    public static $many_many = array(
        'Picture' => 'Image'
    );


    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Specs', new TextField('StockNo', 'Stock No.'));
        $fields->addFieldToTab('Root.Specs', new TextField('size', 'Size'));
        $fields->addFieldToTab('Root.Specs', new TextareaField('Extras', 'Extras'));
        $fields->addFieldToTab('Root.Specs', new TextField('Price', 'Price'));

        $fields->addFieldToTab(
            'Root.Upload',
            $uploadField = new UploadField(
                $name = 'Picture',
                $title = 'Upload one or more images (max 10 in total)'
            )
        );
        $uploadField->setAllowedMaxFileNumber(25);
        $uploadField->setAllowedExtensions(array('jpg', 'jpeg', 'png', 'gif'));
        $uploadField->setFolderName('truckPage');

        return $fields;
    }
    public function MainImageURL(){
        $images = $this->getManyManyComponents('Picture', array(' OtherMachinesPage_Picture.OtherMachinesPageID' => $this->ID));
        $imageUrl = 'http://localhost/assets/Uploads/mininoimage.jpg';
        foreach ($images as $image)
        {
            $imageUrl = $image->SetHeight(120)->Filename;

            break;
        }
        return $imageUrl;

    }
}

class OtherMachinesPage_Controller extends Page_Controller
{
    public function init() {
        parent::init();
    }
}
