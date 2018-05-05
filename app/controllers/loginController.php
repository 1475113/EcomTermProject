<?php
class LoginController extends Controller
{
	/**
	 * The login Controller method
	 *
	 * @return void
	 */
	 public function baseRegister()
	 {
		$login = $this->model('Login');
		if(isset($_POST['action'])){
			$login->Username = $_POST['username'];
			$login->PasswordHash = password_hash($_POST['password'],PASSWORD_DEFAULT);
			$login->Status = 1;
			try
			{
				$login->insert();

				if($login::$_connection->lastInsertId() != null)
				{
					$PKVal = $login::$_connection->lastInsertId();

					$profile = $this->model('Profile');
					$profile->LoginId = $PKVal;
					$profile->FirstName = $_POST['firstName'];
					$profile->LastName = $_POST['lastName'];
					$profile->Email = $_POST['email'];
					$profile->Phone = $_POST['phone'];

					$profile->insert();
					$this->view('login/login');
				}
			}
			catch(PDOException $e)
			{
				echo '<script> language="javascript">';
		 		echo 'alert("Username is already taken")</script>';
		 		$this->view('login/register');
			}
		}else
			$this->view('Login/register');
	 }

	 public function busiRegister()
	 {
	 	$login = $this->model('Login');
		if(isset($_POST['action'])){
			$login->Username = $_POST['username'];
			$login->PasswordHash = password_hash($_POST['password'],PASSWORD_DEFAULT);
			$login->Status = 2;
			try
			{
				$login->insert();

				if($login::$_connection->lastInsertId() != null)
				{
					$PKVal = $login::$_connection->lastInsertId();

					$profile = $this->model('BusinessProfile');
					$profile->LoginId = $PKVal;
					$profile->Email = $_POST['email'];
					$profile->Phone = $_POST['phone'];
					$profile->BusinessName = $_POST['bName'];
					$profile->Address = $_POST['address'];
					$profile->Postal = $_POST['postal'];
					$profile->Rating = 0;
					$profile->RatingCounter = 0;

					$profile->insert();
					$this->view('login/login');
				}
			}
			catch(PDOException $e)
			{
				echo '<script> language="javascript">';
		 		echo 'alert("Username is already taken")</script>';
		 		$this->view('login/businessRegister');
			}
		}else
			$this->view('Login/register');
	 }

	 public function login()
	 {
	 	if(isset($_POST['action']))
	 	{
	 		$username = $_POST['username'];
	 		$password = $_POST['password'];
	 		$user = $this->model('Login');

	 		LoginCore::login($username, $password);
	 		if(LoginCore::isLoggedIn())
	 		{
		 		$session = $_SESSION['username'];

		 		$status = $user->where('username','=',"$session")->get();
		 		echo $_SESSION['username'];

		 		if(LoginCore::isLoggedIn())
		 		{
		 			if($status[0]->Status == 2)
		 			{
		 				header('location:/profile/bProfile');
		 			}
		 			else if ($status[0]->Status == 1) 
		 			{
		 				header('location:/profile/userProfile');

		 			}
		 			else if($status[0]->Status == 3)
		 			{
		 				$this->view('home/index');
		 				echo '<script> language="javascript">';
		 				echo 'alert("Account is Banned")</script>';
		 			}
		 			else if($status[0]->Status == 4)
		 			{
		 				header('location:/admin/adminMain');
		 			}
		 		}
		 	}else
		 	{
		 		echo '<script> language="javascript">';
		 		echo 'alert("Incorrect Username or Password")</script>';
		 		$this->view('login/login');
		 	}
	 	}else
	 		$this->view('home/index');
	 }

	 public function logout()
	 {
	 	LoginCore::logout();
	 	header('location:/home');
	 }

	 public function loginSelector()
	 {
	 	$this->view("login/login");
	 }

	 public function businessRegisterSelector()
	 {
	 	$this->view("login/businessRegister");
	 }

	 public function registerSelector()
	 {
	 	$this->view("login/register");
	 }

	 public function redirectToRegisterSelector()
	 {
	 	$this->view("home/registerSelector");
	 }
}