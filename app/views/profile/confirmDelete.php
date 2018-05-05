<html>
<?php
		if($_SESSION['username'] == null)
			$this->view('home/index');
	?>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title><?php 
				echo $_SESSION['username'];
			?>
			User Profile
	</title>
    <!-- BOOTSTRAP STYLE SHEET -->
    <link href="/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT-AWESOME STYLE SHEET FOR BEAUTIFUL ICONS -->
    <link href="/assets/css/font-awesome.css" rel="stylesheet" />
     <!-- CUSTOM STYLE CSS -->
    <style type="text/css">
               .btn-social {
            color: white;
            opacity: 0.8;
        }

            .btn-social:hover {
                color: white;
                opacity: 1;
                text-decoration: none;
            }

        .btn-facebook {
            background-color: #3b5998;
        }

        .btn-twitter {
            background-color: #00aced;
        }

        .btn-linkedin {
            background-color: #0e76a8;
        }

        .btn-google {
            background-color: #c32f10;
        }
    </style>
</head>
<body>
    <div class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>-->
                <h1>CarTrader</h1>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav ">
                    <li><a href="/login/logout">Log Out</a></li>
                    <!--<a href="#" class="btn btn-primary">Search</a>-->
                </ul>
            </div>
        </div>
    </div>
    <!-- NAVBAR CODE END -->


    <div class="container">
        <section style="padding-bottom: 50px; padding-top: 50px;">
            <div class="row">
                <div class="col-md-4">
                </div>
                <br />
                <div class="col-md-8">
                    <div class="alert alert-info">
                        <h1>Are you sure you want to PERMAMENTLY delete your profile?</h1>
                    </div>
                </div>
                <?php
                    $user = $_SESSION['userID'];
                    echo "<a href='/profile/deleteLogin/$user'>Yes</a>";
                ?>
				<a href="/profile/redirectToProfile">No</a>
            </div>
            <!-- ROW END -->


        </section>
        <!-- SECTION END -->
    </div>
    <!-- CONATINER END -->

    <!-- REQUIRED SCRIPTS FILES -->
    <!-- CORE JQUERY FILE -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- REQUIRED BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.js"></script>
</body>

</html>
