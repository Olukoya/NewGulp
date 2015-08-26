import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Servlet implementation class User
 */
@WebServlet("/User")
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String content1;
	private String content2;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User() {
        super();
        content1 = "";
        content2 = "";
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		content1 = "";
		content2 = "";
		String email = "", password = "", firstName = "", lastName = "", zipcode = "";
		if (req.getParameter("login") != null) {
			email = req.getParameter("email");
			password = req.getParameter("password");
			if (findUser(email, password).equals("Success.")) {
				session.setAttribute("user", email);
				getServletContext().getRequestDispatcher("/index.jsp").forward(req, res);
			} else if (findUser(email, password).equals("The password is Incorrect.")) {
				content1 += "<script type=\"text/javascript\">pswIncorrect()</script>";
				req.setAttribute("content1", content1);
				getServletContext().getRequestDispatcher("/Login.jsp").forward(req, res);
			} else if (findUser(email, password).equals("The user is not exist.")) {
				content1 += "<script type=\"text/javascript\">userNotExist()</script>";
				req.setAttribute("content1", content1);
				getServletContext().getRequestDispatcher("/Login.jsp").forward(req, res);
			}
		}
		
		if (req.getParameter("signup") != null) {
			email = req.getParameter("email");
			password = req.getParameter("password");
			if (findUser(email, password).equals("Success.") || findUser(email, password).equals("The password is Incorrect.")) {
				content2 += "<script type=\"text/javascript\">userExist()</script>";
				req.setAttribute("content2", content2);
				getServletContext().getRequestDispatcher("/Signup.jsp").forward(req, res);
			} else if (findUser(email, password).equals("The user is not exist.")) {
				firstName = req.getParameter("fn");
				lastName = req.getParameter("ln");
				zipcode = req.getParameter("zip");
				addToDB(email, password, firstName, lastName, zipcode);
				content2 += "<div class=\"container\"><div><p>" + firstName + " " + lastName + "</p><p>Email: " + email + "</p><p>ZIP Code: " + zipcode + "</p></div>";
				req.setAttribute("content2", content2);
				getServletContext().getRequestDispatcher("/Profile.jsp").forward(req, res);
			}
			
		}
	}

	private static String findUser(String email, String password) {
		String userMessage = "";
		try {
			// URL of Oracle database server
			String url = "jdbc:oracle:thin:testuser/password@localhost";

			// properties for creating connection to Oracle database
			Properties props = new Properties();
			props.setProperty("user", "testdb");
			props.setProperty("password", "password");

			Class.forName("oracle.jdbc.driver.OracleDriver");
			// creating connection to Oracle database using JDBC
			Connection conn = DriverManager.getConnection(url, props);
			
			String sql = "SELECT password FROM users WHERE email_id = '" + email + "'";
			
			PreparedStatement preStatement = conn.prepareStatement(sql);
			ResultSet result = preStatement.executeQuery();
			
			if (result.next()){
				do {
					if (result.getString(1).equals(password)) {
						userMessage = "Success.";
					} else {
						userMessage = "The password is Incorrect.";
					}
				} while (result.next());
			} else {
				userMessage = "The user is not exist.";
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return userMessage;
	}
	
	private static void addToDB(String email, String password, String firstName, String lastName, String zipcode) {
		try {
			// URL of Oracle database server
			String url = "jdbc:oracle:thin:testuser/password@localhost";

			// properties for creating connection to Oracle database
			Properties props = new Properties();
			props.setProperty("user", "testdb");
			props.setProperty("password", "password");

			Class.forName("oracle.jdbc.driver.OracleDriver");
			// creating connection to Oracle database using JDBC
			Connection conn = DriverManager.getConnection(url, props);
			
			String sql = "INSERT INTO users VALUES ('" + email + "', '" + firstName + "', '" + lastName + "', '" + password + "', " + zipcode + ")";
			
			PreparedStatement preStatement = conn.prepareStatement(sql);
			preStatement.executeQuery();
			
			conn.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
}