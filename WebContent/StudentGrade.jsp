
<!DOCTYPE html>
<html lang="en">

<head>
<body>
	<%@ page import="java.sql.*"%>
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				
					<% 
					String Studentname = (String) session.getAttribute("userName");
					System.out.println(Studentname+ "Name");
					String courseName = (String) session.getAttribute("courseName");
					System.out.println(courseName+ "courseName");
					String tempName = null;
				%>
					<%
					Statement statement1 = null;
					Connection connection1 = null;
					String url = "jdbc:mysql://localhost:3306/score_card";
					String user = "root";
					String password = "";
					int TotalMarks = 0;
					
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
								.executeQuery("SELECT DISTINCT Instructor from course where (course_id in (select course_id FROM `Student` WHERE Student_name ='" + Studentname + "') and course_name = '" + courseName + "')");
						while (rs.next()) {
							System.out.println(rs.getString(1));
							tempName = rs.getString(1);
							
						}
						ResultSet rs1 = statement1
								.executeQuery("SELECT Total_Marks from Grade_table where (Student_id in (select Student_id FROM `Student` WHERE Student_name ='" + Studentname + "') and course_id in (select course_id FROM `course` WHERE Instructor ='" + tempName + "' and course_name = '" + courseName + "'))");
						while (rs1.next()) {
							System.out.println(rs1.getString(1));
							TotalMarks = rs1.getInt(1);
							
						}
						statement1.close();
						connection1.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				
				%>
					<table border="1" class="Marks"> <caption>DETAILS</caption> 
                <tr border = "1"><th>STUDENT NAME</th>	
                <th><input type="text" value="<%=Studentname%>" readonly="readonly"></th>	</tr>
                <tr border = "1"><th>INSTRUCTOR</th>	
                <th><input type="text" value="<%=tempName%>" readonly="readonly"></th>	</tr>
                <tr border = "1"><th>COURSE NAME</th>	
                <th><input type="text" value="<%=courseName%>" readonly="readonly"></th>	</tr>
                <tr border = "1"><th>TOTAL MARKS</th>	
                <th><input type="text" value="<%=TotalMarks%>" readonly="readonly"></th>	</tr>
             	</table>
			
			</div>

		</div>

	</div>


	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>
