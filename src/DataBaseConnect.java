import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@SuppressWarnings("unused")
public class DataBaseConnect {


	Connection connection = null;
	Statement statement = null;

	public static void main(String[] args) throws InstantiationException, IllegalAccessException
	{
		System.out.println("hi");
		DataBaseConnect dataBaseConnect = new DataBaseConnect();
		dataBaseConnect.connectToDataBase();
		// dataBaseConnect.insertIntoDatabase("dfdf");
		System.out.println("end");

	}


	public void connectToDataBase() throws InstantiationException, IllegalAccessException
	{     
		String url = "jdbc:mysql://Mysql@localhost:3306/IIT Blackboard";
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
		String password = "Java";
		//String password="P3000webhost";
		try {

			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			Connection connection = DriverManager.getConnection(url, user, password);

			System.out.println("Creating statement...");
			statement = connection.createStatement();
			String sql;
			//statement.execute("USE a5137510_andrd2");
			//   statement.execute("USE demo");
			//statement.executeUpdate("insert into demo2 (GUID) values ('"
			//  + "ajsdfh" + "')");
			/*ResultSet rs=statement.executeQuery("SELECT DISTINCT course_name FROM `course` WHERE instructor ='GeorgeBlank'");
			while(rs.next()){
				String courseName = rs.getString("course_name");
				System.out.println("inside My course class");
				if (rs.getString("course_name") == "NULL"){
					System.out.println("course are null");
					//request.getRequestDispatcher("/LoginFile.jsp").forward(request, response);
				}else{
					System.out.println("course available");
					//request.setAttribute("errorMessage", "No course are Available");
				}
			}
*/
			statement.close();
			connection.close();

			// conn = DriverManager.getConnection(DB_URL,USER,PASS);
			//connection = DriverManager.getConnection("jdbc:sqlserver://mysql.hostinger.in;user=u989946554_kumar;password=P3@hostinger;database=u989946554_andrd");
		} catch (SQLException sql) {
			sql.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}


	/*public boolean insertIntoDatabase(String GUID_generated)
	{
		try {
			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			statement = connection.createStatement();
			String sql;
			statement.executeUpdate("insert into demo1 (GUID) values ('"
					+ GUID_generated + "')");

			statement.close();
			connection.close();
			System.out.println("inserted");
			return true;

		} catch (SQLException se) {
			// Handle errors for JDBC
			return false;
			//se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			return false;
			//e.printStackTrace();
		}

		finally {
			// finally block used to close resources
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException se2) {
			}// nothing we can do
			try {
				if (connection != null)
					connection.close();
			} catch (SQLException se) {
				return false;
				//se.printStackTrace();
			}// end finally try
		}// end try
		// System.out.println("Goodbye!");
		//return false;

	}
}*/