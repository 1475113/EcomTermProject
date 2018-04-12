<?php
class LoginController extends Controller
{
	/**
	 * The login Controller method
	 *
	 * @return void
	 */
	 
	 public function index($name = '')
	 {/*
		 $user = $this->model('User');
		if(isset($_POST['action']) && $_POST['action'] == 'Login'){
			$username = $_POST['username'];
			$password = $_POST['password'];
			LoginCore::login($username, $password);
			header('location:/Home/');
		}else
			$this->view('Login/index');*/
	 }
	 /*
	 public function index($name = 'jethro', $mood = 'happy')
	 {
		 $user = $this->model('user');
		 $user->name = $name;
		 
		 $this->view('home/index', [
			'name' => $user->name,
			'mood' => $mood
		 ]);
	 }
	 */
	 public function register()
	 {
		$user = $this->model('User');
		if(isset($_POST['action'])){
			$user->firstName = $_POST['firstName'];
			$user->lastName = $_POST['lastName'];
			$user->username = $_POST['username'];
			$user->password = password_hash($_POST['password'],PASSWORD_DEFAULT);
			$user->insert();

			
			header('location:/Home');
		}else
			$this->view('Login/register');
	 }

	 public function businessLoginSelector()
	 {
	 	$this->view("login/businessLogin");
	 }

	 public function loginSelector()
	 {
	 	$this->view("login/login");
	 }
}