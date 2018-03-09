
<!DOCTYPE html>
<html lang="en">

<body>
	<%@ page import="java.sql.*"%>
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<p class="lead">MY COURSES</p>
				<%
					String name = (String) session.getAttribute("userName");
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
								.executeQuery("SELECT DISTINCT course_name from course where course_id in (select course_id FROM `Student` WHERE Student_name ='" + name + "')");
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
				<form name="<%=courseName%>" action="StudentMark.jsp" method="post" target="right">
					 <input type="submit"
						value="<%=courseName[j]%>" name="courseName">
						</br>
				</form>
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
			</div>
			</div>
			<!-- <div class="container">
	<div>
			<form name="coursework" action="CourseWork.jsp" method="post" >
					 <input type="submit"
						value="Create coursework">
						</br>
				</form></div>
				
				</div> -->


	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>
