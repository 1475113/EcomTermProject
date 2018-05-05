<?php
class BusinessProfile extends Model
{
	public $_PKName = "BusinessProfileId";
	public $LoginId;
	public $BusinessName;
	public $Rating;
	public $RatingCounter;
	public $Phone;
	public $Email;
	public $Address;
	public $Postal;

	public function __construct(){
		parent::__construct();
	}

}