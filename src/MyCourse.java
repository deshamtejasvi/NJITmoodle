import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyCourse {
	Connection connection = null;
	Statement statement = null;
	String userName;

	public MyCourse(String userid) {
		// TODO Auto-generated constructor stub
		userName=userid;
	}
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
		//String password="P3000webhost";
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("Creating statement...");
			statement = connection.createStatement();
			ResultSet rs=statement.executeQuery("SELECT DISTINCT course_name FROM `course` WHERE instructor ='"+userName+"'");
			while(rs.next()){
				String courseName = rs.getString("course_name");
				request.getSession().setAttribute("courseName", courseName);
				System.out.println("inside My course class");
				if (rs.getString("course_name") == "NULL"){
					System.out.println("course are null");
					request.getRequestDispatcher("/LoginFile.jsp").forward(request, response);
				}else{
					System.out.println("course available");
					request.setAttribute("errorMessage", "No course are Available");
				}
			}


			statement.close();
			connection.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}


