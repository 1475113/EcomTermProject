<html>
<head>
	<title>This is an example view</title>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
	<script src="/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
<h1>Signup</h1>

<form method="post" action="/login/register" class="form-horizontal">
	<div class="form-group">
		<label for="firstName">First Name</label>
		<input type="text" class="form-control" name="firstName" id="firstName" />
		</div>
		<div class="form-group">
		<label for="lastName">Last Name</label>
		<input type="text" class="form-control" name="lastName" id="lastName" />
		</div>
		<div class="form-group">
		<label for="username">Username</label>
		<input type="text" class="form-control" name="username" id="username" />
		</div>
		<div class="form-group">
		<label for="password">Password</label>
		<input type="password" class="form-control" name="password" id="password" />
		</div>
		<div class="form-group">
		<input type="submit" class="btn btn-default" name="action" value="Register" />
	</div>
</form>


<div>
</body>
</html>