
<!DOCTYPE html>
<html lang="en">

<head>
<body>
	<%@ page import="java.sql.*"%>
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<p class="lead">Marks List</p>
				<table border="1" class="Marks">
					<caption>MARKS</caption>
					<tr>
						<th>TYPE</th>
						<th>MARKS</th>
					</tr>
					<% 
                String courseName =request.getParameter("courseName");
					System.out.println(courseName+ "courseName");
					String Studentname = (String) session.getAttribute("userName");
					System.out.println(Studentname+ "Name");
					session.setAttribute("courseName",courseName);
				%>
					<%
					Statement statement1 = null;
					Connection connection1 = null;
					String url = "jdbc:mysql://localhost:3306/score_card";
					String user = "root";
					String password = "";
					int i = 0;
					
					String[] type = new String[20];
					int[] marks = new int[20];
					try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();

						//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

						// STEP 3: Open a connection
						System.out.println("Connecting to database... mycourse");
						connection1 = DriverManager.getConnection(url, user, password);
						System.out.println("Creating statement...");
						statement1 = connection1.createStatement();
						System.out.println("inside studentmarkslist courseName");
						System.out.println(courseName+ "courseName");
						//System.out.println(rs1.getString("course_name"));
						ResultSet rs = statement1
								.executeQuery("SELECT Type,Marks_obtained FROM `Student_Mark` WHERE Student_id IN (select Student_id from Student where Student_name ='"+Studentname+"') and Course_id in (select Course_id from course where course_name = '"+courseName+"' )");
						//System.out.println(rs1.getString("course_name"));
						while (rs.next()) {
							System.out.println(rs.getString(1));
							String tempName = rs.getString(1);
							//StudentName[i] = tempName;
							type[i] = rs.getString(1);
							marks[i] =rs.getInt(2);
							i++;
						}
						statement1.close();
						connection1.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					String totaltype = "null";
					if (i != 0) {
						for (int j = 0; j < i; j++) {
							totaltype = totaltype+type[j];
				%>
					<tr border="1">
						<th><%=type[j]%>"</th>
						<th><%=marks[j]%></th>
					</tr>
					<%
					}
					} else {
						request.setAttribute("errorMessage", "No Students registered");
				%>
					<div style="color: #FF0000;">${errorMessage}</div>
					<%
					}
				%>
				</table>

				<% request.setAttribute("type",totaltype);
				//request.setAttribute("count")
				System.out.println(totaltype);
				%>
				<div>
					<form action="StudentGrade.jsp" method="post">
						<input type="submit" value="view" />
					</form>
				</div>
			</div>

		</div>

	</div>


	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>
