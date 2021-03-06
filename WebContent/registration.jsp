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
		
		<%
			String option = request.getParameter("Terms");
			System.out.println(option);
		%>
		</br> </br>
		<div class="row">

			<div class="col-md-3">
				
			</div>

			<div class="col-md-9">

				<div class="row carousel-holder">

					<div class="col-md-12">
						<div id="carousel-example-generic" background=""
							class="carousel slide" data-ride="carousel">

							<%@ page import="java.sql.*"%>
								<%@ page import="java.io.*"%>
								<%
									String url = "jdbc:mysql://localhost:3306/Project";
									String user = "root";
									String password = "";
									try {
										Class.forName("com.mysql.jdbc.Driver").newInstance();

										System.out.println("Connecting to database...");
										Connection connection = DriverManager.getConnection(url, user, password);

										System.out.println("Creating statement...");
										//Statement statement = connection.createStatement();
										//String sql;
										//statement.executeUpdate("insert into Student values ('shruti')");
										//statement.close();
										Statement statement = connection.createStatement();
								String degree = request.getParameter("Terms");
								System.out.println("degree"+degree);
								int courseno=0,sectionno=0;
								if(request.getParameter("coursenumber")!="")
								 courseno = Integer.parseInt(request.getParameter("coursenumber"));
								System.out.println("course no entered is"+courseno);
								if(request.getParameter("sectionnumber")!="")
								sectionno = Integer.parseInt(request.getParameter("sectionnumber"));
								ResultSet resultset1=null;
								try{
									if(sectionno==0 && degree.equals("0") )
									{
										resultset1 = statement.executeQuery("select c.course_no,c.section_no,c.prof_name,c.day,c.time,c.course_name,c.course,c.remaining_seats from course c where c.course_no="+courseno+" order by section_no");
										System.out.println("resultset="+resultset1);
									}
									else if(courseno==0 && degree.equals("0"))
									{
										resultset1 = statement.executeQuery("select c.course_no,c.section_no,c.prof_name,c.day,c.time,c.course_name,c.course,c.remaining_seats from course c where c.section_no="+sectionno+" order by section_no");
										System.out.println("resultset="+resultset1);
									}
									else if(courseno==0 && sectionno==0)
									{
										resultset1 = statement.executeQuery("select c.course_no,c.section_no,c.prof_name,c.day,c.time,c.course_name,c.course,c.remaining_seats from course c where c.course='"+degree+"' order by section_no");
										System.out.println("resultset="+resultset1);
									}
									%>
									<form name="regis" id="regis" action="Course" method="post">
								
									<table width="600px" cell-spacing:10px><caption>Searched Courses</caption>
									<tr>
										<th>Course number</th>
										<th>Section number</th>
										<th>Professor Name</th>
										<th>Day</th>
										<th>Time</th>
										<th>Course Name</th>
										<th>Major</th>
										<th>Remaining Seats</th>
									</tr>
									<tr>
										<%
											while (resultset1.next()) {
													int course_no1 = (Integer) resultset1.getObject(1);
													int section_no1 = (Integer) resultset1.getObject(2);
													String prof1 = resultset1.getString(3);
													String day1 = resultset1.getString(4);
													String time1 = resultset1.getString(5);
													String course_name1 = resultset1.getString(6);
													String course1 = resultset1.getString(7);
													int remaining_seats = (Integer) resultset1.getObject(8);
										%>
									
									<tr>
										<td><%=course_no1%></td>
										<td><%=section_no1%></td>
										<td><%=prof1%></td>
										<td><%=day1%></td>
										<td><%=time1%></td>
										<td><%=course_name1%></td>
										<td><%=course1%></td>
										<td><%=remaining_seats%></td>
										<td>
									<td>Add<input type="radio" name="radiogroup" value="<%=section_no1%>"/>
									</td>
									
									</tr>
									<%
										}
										
									%>
									
								</table>
								<div style="text-align:center">
								<input type="submit" name="submit" id="submit">
								</div>
								</form>
								<%
								}
									catch(NullPointerException e)
								{
									e.printStackTrace();
								}
							%>

							<table>
								<% 
										ResultSet resultset = null;
										resultset = statement.executeQuery(
												"select r.course_no,r.section_no,r.status,c.prof_name,c.day,c.time,c.course_name,c.course from Registration r left outer join course c on c.course_no=r.course_no and c.section_no=r.section_no where username='"
														+ username + "'");
								%>
								</br>
								</br>
								<form name="regis" id="regis" action="Registration" method="post">
								<table width="600px" cell-spacing:10px><caption>Enrolled Courses</caption>
									<tr>
										<th>Course number</th>
										<th>Section number</th>
										<th>Status</th>
										<th>Professor Name</th>
										<th>Day</th>
										<th>Time</th>
										<th>Course Name</th>
										<th>Major</th>
										<th>Action</th>
									</tr>
									<tr>
										<%
										int i=0;
										int a[]=new int[10];
											while (resultset.next()) {
													int course_no = (Integer) resultset.getObject(1);
													int section_no = (Integer) resultset.getObject(2);
													String status = resultset.getString(3);
													String prof = resultset.getString(4);
													String day = resultset.getString(5);
													String time = resultset.getString(6);
													String course_name = resultset.getString(7);
													String course = resultset.getString(8);
										%>
									
									<tr>
										<td><%=course_no%></td>
										<td><%=section_no%></td>
										<td><%=status%></td>
										<td><%=prof%></td>
										<td><%=day%></td>
										<td><%=time%></td>
										<td><%=course_name%></td>
										<td><%=course%></td>
									
									<td>
									<td>Drop<input type="checkbox" name="checkboxGroup" value="<%=section_no%>"/>
									</td>
								</tr>
									<%
										}
											%>
								</table>
								</br>
								<div style="text-align:center">
								<input type="submit" name="submit" id="submit">
								</div>
</form>
								
								<%
									statement.close();
										connection.close();
									} catch (SQLException sql) {
										sql.printStackTrace();
									} catch (ClassNotFoundException e) {
										e.printStackTrace();
									} catch (InstantiationException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									} catch (IllegalAccessException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									} catch (NullPointerException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
									catch(NumberFormatException e)
									{
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
