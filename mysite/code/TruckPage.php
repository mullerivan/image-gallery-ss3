<?php

/**
 * Defines the ArticlePage page type
 */
class TruckPage extends Page
{
    static $db = array(
        'ShortDescription' => 'Varchar',
        'Year' => 'Varchar',
        'StockNo' => 'Varchar',
        'RegExp' => 'Varchar',
        'Engine' => 'Varchar',
        'Trans' => 'Varchar',
        'RAxle' => 'Varchar',
        'TGear' => 'Varchar',
        'Speedo' => 'Varchar',
        'GVM' => 'Varchar',
        'GCM' => 'Varchar',
        'Tare' => 'Varchar',
        'Payload' => 'Varchar',
        'COFExp' => 'Varchar',
        'Radio' => 'Varchar',
        'Extras' => 'Text',
        'Price' => 'Varchar'
    );
    public static $many_many = array(
        'Picture' => 'Image'
    );


    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new TextField('ShortDescription', 'Short description'), 'Content');
        $fields->addFieldToTab('Root.Specs', new TextField('Year', 'Year'));
        $fields->addFieldToTab('Root.Specs', new TextField('StockNo', 'Stock No.'));
        $fields->addFieldToTab('Root.Specs', new TextField('RegExp', 'Reg Exp'));
        $fields->addFieldToTab('Root.Specs', new TextField('Engine', 'Engine'));
        $fields->addFieldToTab('Root.Specs', new TextField('Trans', 'Trans'));
        $fields->addFieldToTab('Root.Specs', new TextField('RAxle', 'R/Axle'));
        $fields->addFieldToTab('Root.Specs', new TextField('TGear', 'T/Gear'));
        $fields->addFieldToTab('Root.Specs', new TextField('Speedo', 'Speedo'));
        $fields->addFieldToTab('Root.Specs', new TextField('GVM', 'GVM'));
        $fields->addFieldToTab('Root.Specs', new TextField('GCM', 'GCM'));
        $fields->addFieldToTab('Root.Specs', new TextField('Tare', 'Tare'));
        $fields->addFieldToTab('Root.Specs', new TextField('Payload', 'Payload'));
        $fields->addFieldToTab('Root.Specs', new TextField('COFExp', 'COF-Exp'));
        $fields->addFieldToTab('Root.Specs', new TextField('Radio', 'Radio'));
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
        $images = $this->getManyManyComponents('Picture', array('TruckPage_Picture.TruckPageID' => $this->ID));
        $imageUrl = $_SERVER['HOST'].'/assets/Uploads/mininoimage.jpg';
        foreach ($images as $image)
        {
            $imageUrl = $image->SetHeight(120)->Filename;

            break;
        }
        return $imageUrl;

    }
}

class TruckPage_Controller extends Page_Controller
{
    public function init() {
        parent::init();
    }
}
