import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import java.io.*;
public class update extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Connection connection = null;
	Statement statement = null;
	Statement statement1 = null;
	Connection connection1 = null;
	String[] courseName = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("hi");
		//DataBaseConnect dataBaseConnect = new DataBaseConnect();   
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
			String userid=request.getParameter("type");
			System.out.println(userid);
			String password1=request.getParameter("password1");
			
			//System.out.println(userid);
			//HttpSession session1=request.getSession(); 
			//request.getSession().setAttribute("userName", userid);
			//System.out.println(password1);
			ResultSet rs=statement.executeQuery("Select count(user_id) as count,designation from user_login where user_name='"+userid+"' and password='"+password1+"'");
			//System.out.println("login check");
			while(rs.next()){
				if (rs.getInt("count") == 0){
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
				}
			}
			statement.close();
			connection.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}