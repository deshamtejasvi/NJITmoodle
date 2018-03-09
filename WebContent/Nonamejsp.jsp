<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<% 
                String courseName =(String)session.getAttribute("courseName");
					System.out.println(courseName+ "courseName");
					String name = (String) session.getAttribute("userName");
					System.out.println(name+ "Name");
					String Studentname =(String)session.getAttribute("StudentName");
					System.out.println(Studentname+ "studentName");
				%>
				<%
					Statement statement1 = null;
				Statement statement2 = null;
				Statement statement3 = null;
				Statement statement4 = null;
				Statement statement5 = null;
				int TotalMark =0;
					Connection connection1 = null;
					String url = "jdbc:mysql://localhost:3306/score_card";
					String user = "root";
					String password = "";
					//int i = 0;
					
					String[] type = new String[20];
					String mark1,mark2,mark3;
					String type1,type2,type3;
					int CourseId =0;
					int count =0;
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
						//for (int j = 0; j < 3; j++) {
							mark1 = request.getParameter("mark1");
							mark2 = request.getParameter("mark2");
							mark3 = request.getParameter("mark3");
							  type1 = request.getParameter("type1");
							  type2 = request.getParameter("type2");
							  type3 = request.getParameter("type3");
							 System.out.println(type3);
							
						//}
						//String[] mark = request.getParameterValues("marks");
						//String mark = (String)session.getAttribute("marks");
						//for(int i=0;i<=mark.length;i++){
							System.out.println(mark1+ "inside noname marks");
							System.out.println(mark2+ "inside noname marks");
							System.out.println(mark3+ "inside noname marks");
						//}
						//System.out.println(rs1.getString("course_name"));
						statement1
						.executeUpdate("UPDATE Student_Mark set Marks_obtained = '"+mark1+"' WHERE (Student_id IN (select Student_id from Student where Student_name ='"+Studentname+"') and Course_id in (select Course_id from course where Instructor = '"+name+"' and Course_name = '"+courseName+"') and Type = '"+type1+"')");
						statement1.close();
						statement2 = connection1.createStatement();
						//System.out.println(rs1.getString("course_name"));
				statement2
						.executeUpdate("UPDATE Student_Mark set Marks_obtained = '"+mark2+"' WHERE (Student_id IN (select Student_id from Student where Student_name ='"+Studentname+"') and Course_id in (select Course_id from course where Instructor = '"+name+"' and Course_name = '"+courseName+"') and Type = '"+type2+"')");
				//System.out.println(rs1.getString("course_name"));
				statement2.close();
						statement3 = connection1.createStatement();
				statement3
						.executeUpdate("UPDATE Student_Mark set Marks_obtained = '"+mark3+"' WHERE (Student_id IN (select Student_id from Student where Student_name ='"+Studentname+"') and Course_id in (select Course_id from course where Instructor = '"+name+"' and Course_name = '"+courseName+"') and Type = '"+type3+"')");
				//System.out.println(rs1.getString("course_name"));
						statement3.close();
				TotalMark = Integer.parseInt(mark1)+ Integer.parseInt(mark2) +Integer.parseInt(mark3);
				statement4 = connection1.createStatement();
				statement4
						.executeUpdate("UPDATE Grade_table set Total_Marks = '"+TotalMark+"' WHERE (Student_id IN (select Student_id from Student where Student_name ='"+Studentname+"') and Course_id in (select Course_id from course where Instructor = '"+name+"' and Course_name = '"+courseName+"'))");
				//System.out.println(rs1.getString("course_name"));
				statement4.close();
				statement5 = connection1.createStatement();
				System.out.println(courseName+ "courseName");
				ResultSet rs1 = statement5
						.executeQuery("select course_id from course where Instructor = '"+name+"' and Course_name = '"+courseName+"'");
				//System.out.println(rs1.getString("course_name"));
				while (rs1.next()) {
							CourseId = rs1.getInt(1);
							//StudentId[i] = rs1.getString(2);
							System.out.println(CourseId);
							
						}
				System.out.println(TotalMark);
				ResultSet rs = statement5
						.executeQuery("Select count(Student_id) FROM Grade_table WHERE Total_Marks > ('"+TotalMark+"') and Course_id = '"+CourseId+"'");
						while (rs.next()) {
							count = rs.getInt(1);
							//StudentId[i] = rs1.getString(2);
							System.out.println(count);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					statement5.close();
					connection1.close();
					String totaltype = "null";%>
				<script>
					alert("Data updated");
				</script>
				<table border="1" class="Marks">
					<caption>DETAILS</caption>
					<tr border="1">
						<th>STUDENT NAME</th>
						<th><input type="text" value="<%=Studentname%>"
							readonly="readonly"></th>
					</tr>
					<tr border="1">
						<th>INSTRUCTOR</th>
						<th><input type="text" value="<%=name%>" readonly="readonly"></th>
					</tr>
					<tr border="1">
						<th>COURSE NAME</th>
						<th><input type="text" value="<%=courseName%>"
							readonly="readonly"></th>
					</tr>
					<tr border="1">
						<th>TOTAL MARKS</th>
						<th><input type="text" value="<%=TotalMark%>"
							readonly="readonly"></th>
					</tr>
					<tr border="1">
						<th>RANK</th>
						<th><input type="text" value="<%=count+1%>"
							readonly="readonly"></th>
					</tr>
				</table>
				<%--  <tr border = "1"><th><%=type[j]%>"</th>
                <th><input type="text" name="<%=marks[j]%>" value="<%=marks[j]%>" id="marks"></th>
             	</tr> --%>
				<%
				 	/* }
					} else {
						request.setAttribute("errorMessage", "No Students registered"); */
				%>
				<div style="color: #FF0000;">${errorMessage}</div>
				<%
					//}
				%>
				</table>

				<% request.setAttribute("type",totaltype);
				//request.setAttribute("count")
				System.out.println(totaltype);
				%>
				<!-- <div> <form  action="Nonamejsp.jsp" method="get" 
						>
						 <input type="submit"
							value="update" />
					 
					
				</form></div> -->
			</div>

		</div>

	</div>

</body>
</html>