<?php 

class ProfileController extends Controller
{

	public function userProfile()
	{
		if(LoginCore::isLoggedIn())
		{
			$user = $_SESSION['userID'];
			$profile = $this->model('Profile');


			$sessionProfile = $profile->where('LoginId','=', "$user")->get();

			$this->view('profile/profile',['profiles'=>$sessionProfile]);
		}else
		{
			$this->view('login/login');
		}
	}

	public function bProfile()
	{
		if(LoginCore::isLoggedIn()){
			$user = $_SESSION['userID'];
			$profile = $this->model('BusinessProfile');

			$sessionProfile = $profile->where('LoginId','=', "$user")->get();
			$this->view('profile/businessProfile',['profiles'=>$sessionProfile]);
		}else{
			$this->view('login/login');
		}	
	}

	public function redirectUpdate()
	{
		$user = $_SESSION['userID'];
		$profile = $this->model('Login');

		$sessionProfile = $profile->where('LoginId','=', "$user")->get()[0];

		if(LoginCore::isLoggedIn())
	 	{
	 		if($sessionProfile->Status == 2)
	 		{
	 			$profile2 = $this->model('BusinessProfile');

				$sessionProfile2 = $profile2->where('LoginId','=', "$user")->get()[0];

	 			$this->view('profile/bUpdate',['profile'=>$sessionProfile2]);
	 		}
	 		else if ($sessionProfile->Status == 1) 
	 		{
	 			$profile1 = $this->model('Profile');

				$sessionProfile1 = $profile1->where('LoginId','=', "$user")->get()[0];

	 			$this->view('profile/update',['profile'=>$sessionProfile1]);

	 		}
	 	}else
	 	$this->view('login/login');
	}

	public function update()
	{
		if(isset($_POST['action']))
		{
			$user = $_SESSION['userID'];
			$profile = $this->model('Profile');
			$session = $profile->where('LoginId','=',"$user")->get()[0];
			$session->Email = $_POST['Email'];
			$session->Phone = $_POST['Phone'];

			$session->update();

			header('location:/profile/userProfile');
		}
	}

	public function bUpdate()
	{
		if(isset($_POST['action']))
		{
			$user = $_SESSION['userID'];
			$profile = $this->model('BusinessProfile');
			$session = $profile->where('LoginId','=',"$user")->get()[0];
			$session->Email = $_POST['Email'];
			$session->Phone = $_POST['Phone'];
			$session->Address = $_POST['Address'];
			$session->Postal = $_POST['Postal'];

			$session->update();

			header('location:/profile/bProfile');
		}
	}

	public function deleteLogin($id)
	{
		$user = $id;
		$currLog = $this->model('Login');
		$session = $currLog->where('LoginId','=',"$user")->get()[0];
		$status = $session->Status;

		$currLog->LoginId = $id;
		$currLog->delete();
		$this->view('home/index');
	}

	public function confirmDelete()
	{
		$this->view('profile/confirmDelete');
	}

	public function redirectToProfile()
	{
		$user = $this->model('Login');
		$session = $_SESSION['username'];
	 	$status = $user->where('username','=',"$session")->get();

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
	 	}
	}
}