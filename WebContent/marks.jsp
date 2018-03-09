
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Item - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-item.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<%@ page import="java.sql.*"%>

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
					String name = (String) session.getAttribute("userName");
				%>
				<a class="navbar-brand" href="#">Welcome <%=name%></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="LoginFile.jsp">Home</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Contact</a></li>
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
				<p class="lead">MY COURSES</p>
				<%
					Statement statement1 = null;
					Connection connection1 = null;
					String url = "jdbc:mysql://localhost:3306/score_card";
					String user = "root";
					String password = "";
					int i = 0;
					String[] courseName = new String[20];
					try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();

						//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

						// STEP 3: Open a connection
						System.out.println("Connecting to database... mycourse");
						connection1 = DriverManager.getConnection(url, user, password);
						System.out.println("Creating statement...");
						statement1 = connection1.createStatement();
						System.out.println(name);
						ResultSet rs1 = statement1
								.executeQuery("SELECT DISTINCT course_name FROM `course` WHERE instructor ='" + name + "'");
						//System.out.println(rs1.getString("course_name"));

						while (rs1.next()) {
							String tempName = rs1.getString(1);
							courseName[i] = tempName;
							i++;
						}
						statement1.close();
						connection1.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (i != 0) {
						for (int j = 0; j < i; j++) {
				%>
				<a href="#" class="list-group-item active">
				<%=courseName[j] %> </a>
					<%
					}
					} else {
						request.setAttribute("errorMessage", "No course are Available");
				%>
				<div style="color: #FF0000;">${errorMessage}</div>
				<%
					}
				%>
			</div>
			<div class="col-md-9">
			<p class="lead">Student List</p>
                <% String courseName1 =request.getParameter("courseName");
					System.out.println(courseName+ "courseName");
					String name1 = (String) session.getAttribute("userName");
					System.out.println(name+ "Name");
				%>	
				<%
					Statement statement = null;
					Connection connection = null;
					String url1 = "jdbc:mysql://localhost:3306/score_card";
					String user1 = "root";
					String password1 = "";
					i = 0;
					String[] StudentName = new String[20];
					try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();

						//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

						// STEP 3: Open a connection
						System.out.println("Connecting to database... mycourse");
						connection = DriverManager.getConnection(url1, user1, password1);
						System.out.println("Creating statement...");
						statement = connection.createStatement();
						System.out.println(courseName1+ "courseName");
						ResultSet rs1 = statement
								.executeQuery("SELECT Student_name FROM Student WHERE course_id IN (select course_id from course where Course_name = '"+courseName1+"' and Instructor ='"+name1+"')");
						//System.out.println(rs1.getString("course_name"));
						while (rs1.next()) {
							String tempName = rs1.getString(1);
							StudentName[i] = tempName;
							i++;
						}
						statement.close();
						connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (i != 0) {
						for (int j = 0; j < i; j++) {
				%>
				<form name="<%=StudentName%>" action="marks.jsp" method="post">
					 <input type="submit"
						value="<%=StudentName[j]%>" name="StudentName">
						</br>
				</form>
					<%
					}
					} else {
						request.setAttribute("errorMessage", "No Students registered");
				%>
				<div style="color: #FF0000;">${errorMessage}</div>
				<%
					}
				%>
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
					<p>Copyright &copy; Your Website 2014</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>
				