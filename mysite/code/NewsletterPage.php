<?php
    class NewsletterPage extends Page {
        
        // Additional db fields
        static $db = array(
            'NewsletterDate' => 'Date',
            'NewsletterAuthor' => 'Text'
        );
        
        static $defaults = array('ShowInMenus' => false);
             
        // Add fields to backend when editing Newsletter Page

        public function getCMSFields() {
            $fields = parent::getCMSFields();
            //$fields->addFieldToTab('Root.Main', $dateField = new  CalendarDateField('NewsletterDate','Date (e.g.: 24/12/2013)'), 'Content');    // CalendarDateField = SS 2.3x
            //$fields->addFieldToTab('Root.Content.Main', $dateField = new DateField('NewsletterDate','NewsletterDate (for example: 24/12/2013)'), 'Content');
            //$dateField->setConfig('showcalendar', true); // Only 2.4+
            //$dateField->setConfig('dateformat', 'dd/MM/YYYY');
            $fields->addFieldToTab('Root.Main', new TextField('NewsletterAuthor', 'Author Name'), 'Content');
            
            return $fields;          
        }
    }
    
    class NewsletterPage_Controller extends Page_Controller {
    }
?>