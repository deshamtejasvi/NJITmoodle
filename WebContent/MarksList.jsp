
<!DOCTYPE html>
<html lang="en">

<head>


<body>
<%@ page import="java.sql.*"%>
    <div class="container">

        <div class="row">
		
            <div class="col-md-3">
             <form  action="Nonamejsp.jsp" method="POST">
                <p class="lead">Marks List</p>
                	<table border="1" class="Marks"> <caption>MARKS</caption> 
                <tr> <th>TYPE</th> <th>MARKS</th> </tr>
               
                <% 
                String courseName =(String)session.getAttribute("courseName");
					System.out.println(courseName+ "courseName");
					String name = (String) session.getAttribute("userName");
					System.out.println(name+ "Name");
					String Studentname =request.getParameter("StudentName");
					System.out.println(Studentname+ "studentName");
					
				%>	
				<%
					Statement statement1 = null;
					Connection connection1 = null;
					String url = "jdbc:mysql://localhost:3306/score_card";
					String user = "root";
					String password = "";
					int i = 0;
					
					String[] type = new String[20];
					String[] marks = new String[20];
					try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();

						//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

						// STEP 3: Open a connection
						System.out.println("Connecting to database... mycourse");
						connection1 = DriverManager.getConnection(url, user, password);
						System.out.println("Creating statement...");
						statement1 = connection1.createStatement();
						System.out.println("inside markslist courseName");
						System.out.println(courseName+ "courseName");
						session.setAttribute("StudentName", Studentname);
						//System.out.println(rs1.getString("course_name"));
						ResultSet rs = statement1
								.executeQuery("SELECT Type,Marks_obtained FROM `Student_Mark` WHERE Student_id IN (select Student_id from Student where Student_name ='"+Studentname+"') and Course_id in (select Course_id from course where Instructor = '"+name+"' and Course_name = '"+courseName+"')");
						//System.out.println(rs1.getString("course_name"));
						while (rs.next()) {
							System.out.println(rs.getString(1));
							String tempName = rs.getString(2);
							//StudentName[i] = tempName;
							type[i] = rs.getString(1);
							marks[i] =rs.getString(2);
							i++;
						}
						statement1.close();
						connection1.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					String totaltype = "null";
					/* if (i != 0) {
						for (int j = 0; j < i; j++) {
							totaltype = totaltype+type[j];  */
				%>
                <tr border = "1"><th><input type="text" name="type1" value="<%=type[0]%>" id="type1"></th>	
                <th><input type="text" name="mark1" value="<%=marks[0]%>" id="mark1"></th>	</tr>
                <tr border = "1"><th><input type="text" name="type2" value="<%=type[1]%>" id="type2"></th>	
                <th><input type="text" name="mark2" value="<%=marks[1]%>" id="mark2"></th>	</tr>
                <tr border = "1"><th><input type="text" name="type3" value="<%=type[2]%>" id="type3"></th>	
                <th><input type="text" name="mark3" value="<%=marks[2]%>" id="mark3"></th>
             	</tr>
             	
					<% 
					
					//session.setAttribute("marks",tempmark);
					/* }
					} else {
						request.setAttribute("errorMessage", "No Students registered");  */
				%>
				<div style="color: #FF0000;">${errorMessage}</div>
				<%
					//}
				%>
				</table>
				 <input type="submit"
							value="update" />
							</form></div>
				
				<% request.setAttribute("type",totaltype);
				//request.setAttribute("count")
				System.out.println(totaltype);
				%>
						
				<%/* try{
						connection1 = DriverManager.getConnection(url, user, password);
				System.out.println("Creating statement...");
				statement1 = connection1.createStatement();
				
				for(int j = 0; j < i; j++){
					int tempMarks=Integer.parseInt(request.getParameter("marks[j]"));
					System.out.println(marks[j]);
				 statement1
						.executeUpdate("UPDATE 'Student_Mark` set Marks_obtained = '"+tempMarks+"' WHERE (Student_id IN (select Student_id from Student where Student_name ='"+Studentname+"') and Course_id in (select Course_id from course where Instructor = '"+name+"' and Course_name = '"+courseName+"') and Type ='"+type[j]+"')");
				//System.out.println(rs1.getString("course_name"));
				}
					statement1.close();
					connection1.close();
				} catch (Exception e) {
					e.printStackTrace();
				} */
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
               