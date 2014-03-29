<?php
/**
 * Defines the NewsletterHolder page type
 */
    class NewsletterHolder extends Page {
        static $db = array(
        );
        static $has_one = array(
        );
        
        // newsletter pages are the default page to be created under a holder
        static $default_child = "NewsletterPage";
        
        // only newsletter pages are allowed under a holder section
        static $allowed_children = array('NewsletterPage','NewsletterHolder');
    }
      
    class NewsletterHolder_Controller extends Page_Controller {
        
        /* Short description/summary */
        function convertToSubstr($Content){
            return substr($Content,0,150);
        }
        
        
        /* Pagination */
        /**
         * Get the latest 5 news articles, allowing us to get more >>> Check SQL Query LIMIT
         *
         * @return DataObjectSet|false The DataObjectSet of the news articles you're looking at or boolean false if there aren't any news articles
         */
        function Newsletters() {
          if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
          $SQL_start = (int)$_GET['start'];
          $doSet = DataObject::get(
            $callerClass = "NewsletterPage",
            $filter = "`ParentID` = '".$this->ID."'",
            $sort = "NewsletterDate DESC",
            $join = "",
            $limit = "{$SQL_start},5"
          );
         
          return $doSet ? $doSet : false;
        }
                    
    }
  
?>
