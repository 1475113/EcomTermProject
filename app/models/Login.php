<?php

class Login extends Model
{
	public $Username;
	public $PasswordHash;
	public $Status;
	public $_PKName = "LoginId";
	public function __construct(){
		parent::__construct();
	}
}
?>