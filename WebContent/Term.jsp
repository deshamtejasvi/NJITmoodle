<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Course Registration</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<img src="Images/njit.jpg" width="100%">
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<%
					HttpSession session1 = request.getSession();
					String n = (String) session1.getAttribute("username");
					String ucid=(String) session1.getAttribute("name");
				%>
				<%
					//System.out.println("session in jsp variable" + ucid);
				%>
				<p class="user">
					Welcome
					<%=n%></p>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="plan.jsp">Plan</a></li>
					<li><a href="course.jsp">Course Registration Search</a>
					<li><a href="LogoutServlet">Logout</a>
				</ul>
			</div>
			
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				
			</div>

			<div class="col-md-9">

				<div class="row carousel-holder">
				
					<div class="col-md-12">
					
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<form name="term" id="login_frm" action="course.jsp" method="post">
							<p>Please select term</p>
							<table>
								<tr>
									<select name="Terms">
										<option value="0" selected> </option>
										<option value="Spring 2017">Spring 2017</option>
									</select>
								</tr>
								</br>
								</br>
								<tr>
								<input type="submit" name="submit" id="submit"/>
								</tr>
							</table>
							</form>
						</div>
						</br>
						</div>

				</div>

			</div>

		</div>

	</div>

	</div>
	<!-- /.container -->

	<div class="container">

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2016</p>
				</div>
			</div>
		</footer>
	</div>
	<!-- /.container -->
	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<%@ page import="javax.servlet.http.HttpSession"%>
	<%@ page import="javax.servlet.http.HttpSession"%>

</body>
</html>
