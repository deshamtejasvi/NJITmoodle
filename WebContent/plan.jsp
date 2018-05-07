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
					String username = (String) session1.getAttribute("name");
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
		</br> </br>
		<div class="row">

			<div class="col-md-3">
				
			</div>

			<div class="col-md-9">

				<div class="row carousel-holder">

					<div class="col-md-12">
						<div id="carousel-example-generic" background=""
							class="carousel slide" data-ride="carousel">
							<table>
								<%@ page import="java.sql.*"%>
								<%@ page import="java.io.*"%>
								<%
							String url = "jdbc:mysql://localhost:3306/Project";
							String user = "root";
							String password = "";
							try{
								Class.forName("com.mysql.jdbc.Driver").newInstance();

								System.out.println("Connecting to database...");
								Connection connection = DriverManager.getConnection(url, user, password);

								System.out.println("Creating statement...");
								//Statement statement = connection.createStatement();
								//String sql;
								//statement.executeUpdate("insert into Student values ('shruti')");
								//statement.close();
								Statement statement = connection.createStatement();
								ResultSet resultset=null,resultset1=null;
								resultset=statement.executeQuery("select r.course_no,r.section_no,r.status,c.prof_name,c.day,c.time,c.course_name,c.course from Registration r left outer join course c on c.course_no=r.course_no and c.section_no=r.section_no where username='"+username+"'");
								%>
								</br>
								</br>
								<form name="regis" id="regis" action="Registration" method="post">
								<table width="600px" cell-spacing:10px>
									<tr>
										<th>Course number</th>
										<th>Section number</th>
										<th>Status</th>
										<th>Professor Name</th>
										<th>Day</th>
										<th>Time</th>
										<th>Course Name</th>
										<th>Major</th>
									</tr>
									<tr>
										<% 
								while(resultset.next())
								{
									int course_no=(Integer)resultset.getObject(1);
									int section_no=(Integer)resultset.getObject(2);
									String status=resultset.getString(3);
									String prof=resultset.getString(4);
									String day=resultset.getString(5);
									String time=resultset.getString(6);
									String course_name=resultset.getString(7);
									String course=resultset.getString(8);
									%>
									
									<tr>
										<td><%= course_no %></td>
										<td><%= section_no %></td>
										<td><%= status %></td>
										<td><%= prof %></td>
										<td><%= day %></td>
										<td><%= time %></td>
										<td><%= course_name %></td>
										<td><%= course %></td>
										</tr>
									<% 
								}
								
								%>
								</table>
								</br>
								</form>
								<% 
								statement.close();
								connection.close();
							}
							catch(SQLException sql) {
								sql.printStackTrace();
							} catch (ClassNotFoundException e) {
								e.printStackTrace();
							} catch (InstantiationException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IllegalAccessException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							catch (NullPointerException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							%>
							</table>
							</div>
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
					<p>Copyright &copy; Website 2016</p>
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
