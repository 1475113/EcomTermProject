<?php
class AdminController extends Controller
{
	public function adminMain()
	{
		if($_SESSION['userStatus'] != 4)
		{
			$this->view('home/index');
		}
		$users = $this->model('Login');
		$list = $users->where('Status','!=', 4)->get();

		$this->view('admin/adminMain', ['list'=> $list]);
	}

	public function createAdmin()
	{
		$login = $this->model('Login');
		if(isset($_POST['action']))
		{
			if($_POST['code'] == 911){
				$login->Username = $_POST['username'];
				$login->PasswordHash = password_hash($_POST['password'],PASSWORD_DEFAULT);
				$login->Status = 4;

				try
				{
					$login->insert();
					header('location:/admin/adminMain');
				}
				catch(PDOException $e)
				{
					echo '<script> language="javascript">';
			 		echo 'alert("Username is already taken")</script>';
			 		$this->view('admin/adminRegister');
				}
			}else
			{
				echo '<script> language="javascript">';
			 	echo 'alert("Admin Code is Invalid")</script>';
			 	$this->view('admin/adminRegister');
			}
		}else
			$this->view('admin/adminRegister');
	}
	public function adminDelete($id)
	{
		$profile = $this->model('Login');
		$profile->LoginId = $id;
		$profile->delete();
		header('location:/admin/adminMain');
	}
}
