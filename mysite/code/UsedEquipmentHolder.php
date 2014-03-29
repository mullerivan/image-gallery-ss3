<?php
	/**
	* Defines the ArticleHolder page type
	*/
	class UsedEquipmentHolder extends Page {
		static $db = array(
		);
		static $has_one = array(
		);

		static $allowed_children = array('OtherMachinesPage','TruckPage','ExcavatorPage','PartsPage');

	}

	class UsedEquipmentHolder_Controller extends Page_Controller {

        public function init() {
            parent::init();
        }
		function convertToSubstr($Content){
			return substr($Content,0,150);
		}

		public function SortedChildren(){
			// $children will be a DataObjectSet
			$children = $this->Children();

			if( !$children )
				return null; // no children, nothing to work with

			// sort the DataObjectSet
			// see http://doc.silverstripe.com/doku.php?id=dataobjectset#sorting
			$children->sort('Date', 'DESC');

			// return sorted set
			return $children;
		}		
	}
