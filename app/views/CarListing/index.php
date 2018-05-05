<html>
<head>
	<title>Car Listings</title>
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrapz.css" />
	<script src="/js/boostrap.js"></script>
</head>
<body>
	<div class="container">
		<h1>Car Listings</h1>
		<form method="get" action="/CarListing/search" class="form-inline">
			<div class="form-group">
				<label for="q">Search by Keyword</label>
				<input type="text" class="form-control" name="search" id="search"/>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-default" name="action" value='Search'/>
			</div>
		</form>
			<form action="/CarListing/create">
				<input type="submit" name="action" value='Create'/>
			</form>
		</form><br>
		<br>

		<table class="table table-striped">
			<tr>
				<th>		</th>
				<th>Car Make</th>
				<th>Car Model</th>
				<th>Car Trim</th>
				<th>Car Year</th>
				<th>Post Date</th>
				<th>Description</th>
				<th>Username</th>
				<th>Mileage</th>
				<th>Price</th>
				<th>Image</th>
				<th>		</th>
				<th>		</th>
			</tr>
			<?php
			foreach ($data['carlistings'] as $carlisting) {
				//$user = $_SESSION['userID'];
				echo "<tr><td><a class='btn btn-default' href='/CarListing/details/$carlisting->CarListingId'>Details</a></td>";
				echo "<td>$carlisting->CarMake</td>";
				echo "<td>$carlisting->CarModel</td>";
				echo "<td>$carlisting->CarTrim</td>";
				echo "<td>$carlisting->CarYear</td>";
				echo "<td>$carlisting->PostDate</td>";
				echo "<td>$carlisting->Description</td>";
				echo "<td>$carlisting->LoginId</td>";
				//echo "<td>$user</td>";
				echo "<td>$carlisting->Mileage</td>";
				echo "<td>$carlisting->Price</td>";
				echo "<td>$carlisting->ImageId</td>";
				echo "<td><a class='btn btn-default' href='/carListing/delete/$carlisting->CarListingId'>Delete</a></td>";
				echo "<td><a class='btn btn-default' href='/carListing/redirectEdit/$carlisting->CarListingId'>Edit</a></td></tr>";
			}
			?>
		</table>
</body>
</html>