<!DOCTYPE html>
<html>
<head>
	<title>Car Listings</title>
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.css" />
	<script src="/js/boostrap.js"></script>
</head>
<body>

	<div class="container">
		<h1>Car Listings - Update</h1>
		<form method="post" action="/carListing/edit/<?php echo $data['carListingId']; ?>" class="form-horizontal">
			<div class="form-group">
			<label>Car Make</label>
			<input type="text" class="form-control" name="carMake" id="carMake" placeholder="<?php echo $data['carListing']->CarMake; ?>" />
			</div>
			<div class="form-group">
			<label>Car Model</label>
			<input type="text" class="form-control" name="carModel" id="carModel" placeholder="<?php echo $data['carListing']->CarModel; ?>" />
			</div>
			<div class="form-group">
			<label>Car Trim</label>
			<input type="text" class="form-control" name="carTrim" id="carTrim" placeholder="<?php echo $data['carListing']->CarTrim; ?>" />
			</div>
			<div class="form-group">
			<label>Car Year</label>
			<input type="text" class="form-control" name="carYear" id="carYear" placeholder="<?php echo $data['carListing']->CarYear; ?>"/>
			</div>
			<div class="form-group">
			<label>Description</label>
			<input type="text" class="form-control" name="description" id="description" placeholder="<?php echo $data['carListing']->Description; ?>"/>
			</div>
			<div class="form-group">
			<label>Mileage</label>
			<input type="text" class="form-control" name="mileage" id="mileage" placeholder="<?php echo $data['carListing']->Mileage; ?>"/>
			</div>
			<div class="form-group">
			<label>Price</label>
			<input type="text" class="form-control" name="price" id="price" placeholder="<?php echo $data['carListing']->Price; ?>"/>
			</div>
			<div class="form-group">
			<br/>
			<input type="submit" class="btn btn-default" name="action" value="Update" />
		</form>
	</div>
</body>