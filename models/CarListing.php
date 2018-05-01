<?php

class CarListing extends Model
{
	public $_PKName = 'CarListingId';
	public $carMake;
	public $carModel;
	public $carTrim;
	public $carYear;
	public $description;
	public $mileage;
	public $price;
	public $postDate;
	public $loginId;
	public $imageId;
	public $regionId;
	public $views;

	public function __construct(){
		parent::__construct();
	}
}