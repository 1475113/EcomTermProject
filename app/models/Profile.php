<?php
class Profile extends Model
{
	public $LoginId;
	public $FirstName;
	public $LastName;
	public $Phone; 
	public $Email;
	public $_PKName = "ProfileId";

	public function __construct()
	{
		parent::__construct();
	}
}
?>