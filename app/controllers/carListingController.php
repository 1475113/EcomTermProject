<?php

class carListingController extends Controller
{
	public function index()
	{
		$aCarListing = $this->model('CarListing');
		$myCarListings = $aCarListing->get();

		$this->view('CarListing/index',['carlistings'=>$myCarListings]);

/*		$aUsername = $this->model('Login');
		$myUsernames = $aUsername->get();*/
	}

	public function search(){
		$searchTerm = $_GET['search'];
		$aCarListing = $this->model('CarListing');
		$myCarListings = $aCarListing->where('carModel','LIKE',"%$searchTerm%")->ORwhere('carMake','LIKE',"%$searchTerm%")->ORwhere('carTrim','LIKE',"%$searchTerm%")->
		ORwhere('carYear','LIKE',"%$searchTerm%")->ORwhere('description','LIKE',"%$searchTerm%")->ORwhere('mileage','LIKE',"$searchTerm")->ORwhere('price','LIKE',"$searchTerm")->get();
		$this->view('CarListing/index',['carlistings'=>$myCarListings]);
	}


	public function create()
	{
		//$user = $_SESSION['userID'];

		if(LoginCore::isLoggedIn()){
			if(isset($_POST['action'])){
				$newCarListing = $this->model('CarListing');
				$newCarListing->carMake = $_POST['carMake'];
				$newCarListing->carModel = $_POST['carModel'];
				$newCarListing->carTrim = $_POST['carTrim'];
				$newCarListing->carYear = $_POST['carYear'];
				$newCarListing->description = $_POST['description'];
				$newCarListing->mileage = $_POST['mileage'];
				$newCarListing->price = $_POST['price'];
				$newCarListing->postDate = $_POST['postDate'];
				$newCarListing->loginId = '1';
				$newCarListing->regionId = $_POST['RegionId'];
				$newCarListing->views = '0';

				$newCarListing->insert();
				header('location:/CarListing/index');

			}else{
				$regions = $this->model('Region')->get();
				$this->view('CarListing/create', ['regions'=>$regions]);
			}
		}else{
			echo '<script> language="javascript">';
			echo 'alert("You must be logged in to use this feature")</script>';
			$this->view('login/login');
		}
	}
	
	function delete($carListingId)
	{
		if(LoginCore::isLoggedIn()){
			$aCarListing = $this->model('CarListing');
			$aCarListing->CarListingId = $carListingId;
			$aCarListing->delete();
			header("location:/CarListing/index");
		}else{
			echo '<script> language="javascript">';
			echo 'alert("You must be logged in to use this feature")</script>';
			$this->view('login/login');
		}
	}

	function details($carListingId)
	{
		$aCarListing = $this->model('CarListing');
		$
		$this->view('CarListing/details',['carListingId'=>$carListingId, 'carListing' =>$CarListing]);
		$aCarListing->CarListingId = $carListingId;
	}

	public function edit($carListingId)
	{
		if(isset($_POST['action']))
		{
			$listing = $this->model('CarListing');
			$session = $listing->where("CarListingId",'=', $carListingId)->get()[0];
			$session->CarListingId = $carListingId;
			$session->carMake = $_POST['carMake'];
			$session->carModel = $_POST['carModel'];
			$session->carTrim = $_POST['carTrim'];
			$session->carYear = $_POST['carYear'];
			$session->description = $_POST['description'];
			$session->mileage = $_POST['mileage'];
			$session->price = $_POST['price'];

			$session->update();

			header('location:/carListing/index');
		}
	}

	public function redirectEdit($carListingId)
	{
		if(LoginCore::isLoggedIn()){
			$user = $_SESSION['userID'];
			$carListing = $this->model('CarListing')->where("CarListingId",'=',$carListingId)->get()[0];
			$this->view('CarListing/edit',['carListingId'=>$carListingId, 'carListing'=>$carListing]);
		}else{
			echo '<script> language="javascript">';
			echo 'alert("You must be logged in to use this feature")</script>';
			$this->view('login/login');
		}
	}
}