<?php

$target_dir = "uploads/";	//the folder where files will be saved
$allowedTypes = array("jpg", "png", "jpeg", "gif", "bmp");// Allow certain file formats
$max_upload_bytes = 5000000;

foreach($_FILES as $key=>$theFile){
	$uploadOk = 1;
	if(isset($theFile)) {
		//Check if image file is a actual image or fake image
		//this is not a guarantee that malicious code may be passed in disguise
		$check = getimagesize($theFile["tmp_name"]);
		if($check !== false) {
			echo "File is an image - " . $check["mime"] . ".";
			$uploadOk = 1;
		} else {
			echo "File is not an image.";
			$uploadOk = 0;
		}
		$extension = strtolower(pathinfo(basename($theFile["name"]),PATHINFO_EXTENSION));
		//give a name to the file such that it should never collide with an existing file name.
		$target_file_name = uniqid().'.'.$extension;	
		$target_path = $target_dir . $target_file_name;
		//NOTE: that this file path probably should be saved to the database for later retrieval

		//It is very unlikely given the naming scheme that another file of the same name will exist... 
		// Check if file already exists
		/*if (file_exists($target_path)) {
			echo "Sorry, file already exists.";
			$uploadOk = 0;
		}*/

		//You may limit the size of the incoming file... Check file size
		if ($theFile["size"] > $max_upload_bytes) {
			echo "Sorry, your file is too large.";
			$uploadOk = 0;
		}

		// Allow certain file formats
		if(!in_array($extension, $allowedTypes)) {
			echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
			$uploadOk = 0;
		}

		// Check if $uploadOk is set to 0 by an error
		if ($uploadOk == 0) {
			echo "Sorry, your file was not uploaded.";
		} else {// if everything is ok, try to upload file - to move it from the temp folder to a permanent folder
			if (move_uploaded_file($theFile["tmp_name"], $target_path)) {
				echo "The file ". basename( $theFile["name"]). " has been uploaded as <a href='$target_path'>$target_path</a>.";
			} else {
				echo "Sorry, there was an error uploading your file.";
			}
		}
	}
}

?>

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
			<form action="" method="post" enctype="multipart/form-data">
				<input type="file" name="fileToUpload" id="fileToUpload"/>
				<p></p>
				<input type="submit" name="Upload Image" id="submit"/>
			</form>
			<br/>
			<input type="submit" class="btn btn-default" name="action" value="Update" />
		</form>
	</div>
</body>