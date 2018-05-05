<html>
<head>
	<title>Car Listings</title>
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrapz.css" />
	<script src="/js/boostrap.js"></script>
</head>
<body>
	<div class="container">
		<h1>Car Listings</h1>
		<form method="post" action="/CarListing/create" class="form-horizontal">
			<div class="form-group">
			<label for="carMake">Car Make</label>
			<input type="text" class="form-control" name="carMake" id="carMake" />
			</div>
			<div class="form-group">
			<label for="carModel">Car Model</label>
			<input type="text" class="form-control" name="carModel" id="carModel" />
			</div>
			<div class="form-group">
			<label for="carTrim">Car Trim</label>
			<input type="text" class="form-control" name="carTrim" id="carTrim" />
			</div>
			<div class="form-group">
			<label for="carYear">Car Year</label>
			<input type="text" class="form-control" name="carYear" id="carYear" />
			</div>
			<div class="form-group">
			<label for="description">Description</label>
			<input type="text" class="form-control" name="description" id="description" />
			</div>
			<div class="form-group">
			<label for="mileage">Mileage</label>
			<input type="text" class="form-control" name="mileage" id="mileage" />
			</div>
			<div class="form-group">
			<label for="price">Price</label>
			<input type="text" class="form-control" name="price" id="price" />
			</div>
			<div class="form-group">
			<label for="postDate">Date</label>
			<input type="Date" class="form-control" name="postDate" id="postDate" />
			</div>
			<div class="form-group">
			<label for="region">Region</label>
			<select name="RegionId">
<?php 
foreach($data['regions'] as $region){
			echo "<option value='$region->RegionId'>$region->RegionName</option>";
}
?>

			</select>
			</div>
			<div class="form-group">
			<input type="submit" class="btn btn-default" name="action" value="Publish Car Listing" />
			</div>
		</form>
	</div>
</body>