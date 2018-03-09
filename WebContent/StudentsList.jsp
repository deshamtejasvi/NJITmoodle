
<!DOCTYPE html>
<html lang="en">

<head>


<body>
<%@ page import="java.sql.*"%>
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Student List</p>
                <% String courseName =request.getParameter("courseName");
					System.out.println(courseName+ "courseName");
					String name = (String) session.getAttribute("userName");
					System.out.println(name+ "Name");
				%>	
				<%
					Statement statement1 = null;
					Connection connection1 = null;
					String url = "jdbc:mysql://localhost:3306/score_card";
					String user = "root";
					String password = "";
					int i = 0;
					String[] StudentName = new String[20];
					int[] StudentId = new int[20];
					try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();

						//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

						// STEP 3: Open a connection
						System.out.println("Connecting to database... mycourse");
						connection1 = DriverManager.getConnection(url, user, password);
						System.out.println("Creating statement...");
						statement1 = connection1.createStatement();
						System.out.println(courseName+ "courseName");
						ResultSet rs1 = statement1
								.executeQuery("SELECT Student_name,Student_id FROM Student WHERE course_id IN (select course_id from course where Course_name = '"+courseName+"' and Instructor ='"+name+"')");
						//System.out.println(rs1.getString("course_name"));
						while (rs1.next()) {
							String tempName = rs1.getString(1);
							StudentName[i] = tempName;
							//StudentId[i] = rs1.getString(2);
							i++;
						}
						session.setAttribute("courseName", courseName);
						//request.setParameter("courseName",courseName);
						statement1.close();
						connection1.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (i != 0) {
						for (int j = 0; j < i; j++) {
				%>
				<form name="<%=StudentName%>"  action="MarksList.jsp" method="post"  id="student" target="third">
					 <input type="submit"
						value="<%=StudentName[j]%>" name = "StudentName">
						</br>
				</form>
				<%-- <a href="MarksList.jsp"?StudentName=<%=(StudentName[j])%>" value="<%=StudentName[j]%> name= "<%=StudentName[j]%>"></a> --%>
					<%
					System.out.println(StudentName[j]);
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
  

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
               