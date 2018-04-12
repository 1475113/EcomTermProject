<?php

class Login extends Model
{
	public $username;
	public $password;
	public $status = 1;
	
	public function __construct(){
		parent::__construct();
	}
}
?>