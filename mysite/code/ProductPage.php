<?php
	/**
	* Defines the ArticlePage page type
	*/
	class ProductPage extends Page {
		static $db = array(
		'ShortDescription' => 'Varchar',
		'Year' => 'Int',   
		'StockNo' => 'Varchar',   
		'Size' => 'Varchar',   
		'Hours' => 'Varchar',   
		'Buckets' => 'Varchar',   
		'Tracks' => 'Varchar',   
		'AuxPiping' => 'Varchar',   
		'Extras' => 'Text',   
		'Price' => 'Varchar'
		);
		static $has_one = array(
		'MainImage' => 'ProductImage',
		'SubImage1' => 'ProductImage',
		'SubImage2' => 'ProductImage',
		'SubImage3' => 'ProductImage',
		'SubImage4' => 'ProductImage'
		);

		function getCMSFields() {
			$fields = parent::getCMSFields();

			$fields->addFieldToTab('Root.Content.Main', new TextField('ShortDescription', 'Short description'), 'Content');
			$fields->addFieldToTab('Root.Content.Specs', new TextField('Year', 'Year'));
			$fields->addFieldToTab('Root.Content.Specs', new TextField('StockNo', 'Stock No.'));
			$fields->addFieldToTab('Root.Content.Specs', new TextField('Size', 'Size'));
			$fields->addFieldToTab('Root.Content.Specs', new TextField('Hours', 'Hours'));
			$fields->addFieldToTab('Root.Content.Specs', new TextField('Buckets', 'Buckets'));
			$fields->addFieldToTab('Root.Content.Specs', new TextField('Tracks', 'Tracks'));
			$fields->addFieldToTab('Root.Content.Specs', new TextField('AuxPiping', 'AuxPiping'));
			$fields->addFieldToTab('Root.Content.Specs', new TextareaField('Extras', 'Extras'));
			$fields->addFieldToTab('Root.Content.Specs', new TextField('Price', 'Price'));

			$fields->addFieldToTab('Root.Content.Images', new ImageField('MainImage', 'Main image'));
			$fields->addFieldToTab('Root.Content.Images', new ImageField('SubImage1', 'Sub image 1'));
			$fields->addFieldToTab('Root.Content.Images', new ImageField('SubImage2', 'Sub image 2'));
			$fields->addFieldToTab('Root.Content.Images', new ImageField('SubImage3', 'Sub image 3'));
			$fields->addFieldToTab('Root.Content.Images', new ImageField('SubImage4', 'Sub image 4'));

			return $fields;
		}   
	}

	class ProductPage_Controller extends Page_Controller {
		function ProductInquireForm() {
			// Create fields
			$fields = new FieldSet(
			new TextField('Name'),
			new EmailField('Email'),
			new TextField('Phone'),
			new TextareaField('Questions'),
			new HiddenField('machine',null, $this->dataRecord->Title.' - '.$this->dataRecord->ShortDescription)
			);

			// Create actions
			$actions = new FieldSet(
				new FormAction('doProductInquiry', 'Submit')
			);
			
			$validator = new RequiredFields('Name', 'Email', 'Phone');

			return new Form($this, 'ProductInquireForm', $fields, $actions, $validator);
		}
		
		function doProductInquiry($data, $form) {
			$results = $form->getData();
			
			$from = 'inquiry@mainlinecommercials.co.nz';
			$to = 'wesley@mainlinecom.co.nz';
			$subject = 'inquiry about '.$results['machine'];
			
			$body = 'Name: '.$results['Name']."\r\n";
			$body .= 'Email: '.$results['Email']."\r\n";
			$body .= 'Phone: '.$results['Phone']."\r\n"."\r\n";
			$body .= 'Questions: '."\r\n".$results['Questions']."\r\n";
			
			$email = new Email($from, $to, $subject, $body);
			$email->sendPlain();
			Director::redirect('thanks-for-your-enquiry/');
		}
		

	}

?>