import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Students extends HttpServlet{
	Connection connection = null;
	Statement statement = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("hi");
		DataBaseConnect dataBaseConnect = new DataBaseConnect();   
		String url = "jdbc:mysql://localhost:3306/score_card";
		//String url = "jdbc:mysql://sql9.000webhost.com/";
		/**
		 * The MySQL user.
		 */
		String user = "root";
		//String user="a5137510_andrdu2";

		/**
		 * Password for the above MySQL user. If no password has been 
		 * set (as is the default for the root user in XAMPP's MySQL),
		 * an empty string can be used.
		 */
		String password = "";
		int[] mark = new int[20];
		int i=0;
		//String password="P3000webhost";
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("Creating statement...");
			statement = connection.createStatement();
			ResultSet rs=statement.executeQuery("Select marks from Student_Mark where Instructor= 'GeorgeBlank' and course_id=602 and Student_id=1001");
			//System.out.println("login check");
			while(rs.next()){
				//String tempName = rs.getString(1);
				mark[i] = rs.getInt(1);
				//courseName[i] = tempName;
				i++;
				/*if (rs.getInt("count") == 0){
					request.setAttribute("errorMessage", "Invalid username and password");
					request.getRequestDispatcher("/testFile.jsp").forward(request, response);
				}else{
				
					String designation = rs.getString("designation");
					System.out.println(designation);
					if(designation.equals("student")){
						System.out.println("student profile");
						request.getRequestDispatcher("/marks.jsp").forward(request, response);
					}
					else{
						//System.out.println("proceed to login");
						//System.out.println(userid);
						//MyCourse course = new MyCourse(userid);
						request.getRequestDispatcher("/frame.jsp").forward(request, response);
						//String courseName=MyCourse(userid);
					}
				}*/
			}
			statement.close();
			connection.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

