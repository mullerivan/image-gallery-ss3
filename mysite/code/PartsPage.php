<?php
	/**
	* Defines the ArticlePage page type
	*/
	class PartsPage extends Page {
		static $db = array(
		'ShortDescription' => 'Varchar',
		'StockNo' => 'Varchar',   
		'Size' => 'Varchar',     
		'Extras' => 'Text',   
		'Price' => 'Varchar'
		);
        public static $many_many = array(
            'Picture' => 'Image'
        );


		function getCMSFields() {
			$fields = parent::getCMSFields();

			$fields->addFieldToTab('Root.Main', new TextField('ShortDescription', 'Short description'), 'Content');
			$fields->addFieldToTab('Root.Specs', new TextField('StockNo', 'Stock No.'));
			$fields->addFieldToTab('Root.Specs', new TextField('Size', 'Size'));
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
            $uploadField->setFolderName('truckPage');

            return $fields;
        }
        public function MainImageURL(){
            $images = $this->getManyManyComponents('Picture', array('PartsPage_Picture.PartsPageID' => $this->ID));
            $imageUrl = $_SERVER['HOST'].'/assets/Uploads/mininoimage.jpg';
            foreach ($images as $image)
            {
                $imageUrl = $image->SetHeight(120)->Filename;

                break;
            }
            return $imageUrl;


		}   
	}

	class PartsPage_Controller extends Page_Controller {

		public function init() {
			parent::init();
		}


    }
