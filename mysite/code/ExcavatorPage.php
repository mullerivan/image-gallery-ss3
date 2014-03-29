<?php
	/**
	* Defines the ArticlePage page type
	*/
	class ExcavatorPage extends Page {
		static $db = array(
		'ShortDescription' => 'Varchar',
		'Year' => 'Int',   
		'StockNo' => 'Varchar',   
		'Engine' => 'Varchar',   
		'Trans' => 'Varchar',   
		'Hours' => 'Varchar',   
		'Weight' => 'Varchar',   
		'Buckets' => 'Varchar',   
		'Tracks' => 'Varchar',   
		'Sprockets' => 'Varchar',   
		'Rollers' => 'Varchar',   
		'QuickHitch' => 'Varchar',   
		'AuxPiping' => 'Varchar',   
		'ExtraPlumbing' => 'Varchar',   
		'CabGuard' => 'Varchar',    
		'Extras' => 'Text',   
		'Price' => 'Varchar'
		);

        public static $many_many = array(
            'Picture' => 'Image'
        );

		function getCMSFields() {
			$fields = parent::getCMSFields();

			$fields->addFieldToTab('Root.Main', new TextField('ShortDescription', 'Short description'), 'Content');
			$fields->addFieldToTab('Root.Specs', new TextField('Year', 'Year'));
			$fields->addFieldToTab('Root.Specs', new TextField('StockNo', 'Stock No.'));
			$fields->addFieldToTab('Root.Specs', new TextField('Engine', 'Engine'));			
			$fields->addFieldToTab('Root.Specs', new TextField('Trans', 'Trans'));			
			$fields->addFieldToTab('Root.Specs', new TextField('Hours', 'Hours'));
			$fields->addFieldToTab('Root.Specs', new TextField('Weight', 'Weight'));
			$fields->addFieldToTab('Root.Specs', new TextField('Buckets', 'Buckets'));
			$fields->addFieldToTab('Root.Specs', new TextField('Tracks', 'Tracks'));
			$fields->addFieldToTab('Root.Specs', new TextField('Sprockets', 'Sprockets'));
			$fields->addFieldToTab('Root.Specs', new TextField('Rollers', 'Rollers'));
			$fields->addFieldToTab('Root.Specs', new TextField('QuickHitch', 'Quick Hitch'));
			$fields->addFieldToTab('Root.Specs', new TextField('ExtraPlumbing', 'Extra Plumbing'));
			$fields->addFieldToTab('Root.Specs', new TextField('CabGuard', 'Cab Guard'));
			$fields->addFieldToTab('Root.Specs', new TextareaField('Extras', 'Extras'));
			$fields->addFieldToTab('Root.Specs', new TextField('Price', 'Price'));

            $fields->addFieldToTab(
                'Root.Upload',
                $uploadField = new UploadField(
                    $name = 'Picture',
                    $title = 'Upload one or more images (max 25 in total)'
                )
            );
            $uploadField->setAllowedMaxFileNumber(25);
            $uploadField->setAllowedExtensions(array('jpg', 'jpeg', 'png', 'gif'));
            $uploadField->setFolderName('excavatorPage');

            return $fields;
		}

        public function MainImageURL(){
            $images = $this->getManyManyComponents('Picture', array('ExcavatorPage_Picture.ExcavatorPageID' => $this->ID));
            $imageUrl = 'http://localhost/assets/Uploads/mininoimage.jpg';

            foreach ($images as $image)
            {
		$imageUrl = $image->SetHeight(120)->Filename;

                break;
            }

            return $imageUrl;

        }

	}

	class ExcavatorPage_Controller extends Page_Controller
    {
        public function init() {
            parent::init();
        }
    }
