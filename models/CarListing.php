<?php

class CarListing extends Model
{
	public $carListingId;
	public $carMake;
	public $carModel;
	public $carYear;
	public $mileage;
	public $postDate;
	public $description;
	public $loginId;
	public $price;
	public $imageId;
	public $regionId;
	public $views;

	public function __construct(){
		parent::__construct();
	}
}