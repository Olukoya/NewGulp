import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SearchDatabase")
public class SearchDatabase extends HttpServlet {
	static String restaurant, user;
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/index.jsp")
				.forward(req, res);
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("user");
		HttpSession session2 = req.getSession(true);
		

		if (req.getParameter("rsubmit") != null) {
			String rsearch = req.getParameter("rsearch");
			session2.setAttribute("redit", rsearch);
			
			try {
				restaurant = "";
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection(
						"jdbc:oracle:thin:testuser/password@localhost",
						"testdb", "password");
				Statement st = con.createStatement();
				System.out.println("connection established successfully...!!");
				ResultSet rs = st
						.executeQuery("SELECT * FROM restaurants WHERE name = '"
								+ rsearch + "'");

				restaurant += "<div class=\"container\">";
				while (rs.next()) {
					restaurant += "<div><p>" + rs.getString("name") + "</p><p>"
							+ rs.getString("streetaddress") + "</p><p>"
							+ rs.getString("city") + ", "
							+ rs.getString("state") + " "
							+ rs.getString("zipcode").substring(0, 5)
							+ "</p></div>";
				}
				String rAverage = "", rCount = "";
				ResultSet avg = st.executeQuery("SELECT restaurants.id, restaurants.name, \"rRate\" FROM restaurants, (SELECT restaurant_id AS \"rId\", AVG(rating) AS \"rRate\" FROM reviews GROUP BY restaurant_id) WHERE \"rId\" = restaurants.id AND restaurants.name = '"
								+ rsearch + "'");
				while (avg.next()) {
					rAverage = avg.getString("rRate");
				}
				ResultSet count = st.executeQuery("SELECT COUNT(*) FROM reviews WHERE reviews.restaurant_id = (SELECT restaurants.id FROM restaurants WHERE restaurants.name = '"
								+ rsearch + "')");
				while (count.next()) {
					rCount = count.getString(1);
				}
				restaurant += "<div><table class=\"table\"><tr><td width=\"50%\">Average rating: "
						+ rAverage
						+ "</td><td width=\"50%\">"
						+ rCount
						+ " reviews</td></tr></table></div><br />";
				ResultSet reviews = st.executeQuery("SELECT * FROM reviews WHERE reviews.restaurant_id = (SELECT id FROM restaurants WHERE name = '"
								+ rsearch + "')");
				while (reviews.next()) {
					restaurant += "<div><table class=\"table table-striped\"><tr><td width=\"60%\">"
							+ reviews.getString("user_id")
							+ "</td><td width=\"20%\">"
							+ reviews.getString("rating")
							+ "</td><td width=\"20%\">"
							+ reviews.getString("review_date").substring(0, 10)
							+ "</td></tr><tr><td></td><td colspan=\"2\">"
							+ reviews.getString("content") + "</td></tr></table></div></div>";
					if (reviews.getString("user_id").equals(session.getAttribute("user"))) {
							restaurant += "<div class=\"container\"><form action=\"SearchDatabase\" method=\"post\">"
								+ "<div class=\"form-group\">"
							    + "<label for=\"newRating\">Rerate the restaurant (Min:1 - Max:5):</label>"
							    + "<select class=\"form-control\" id=\"newRating\" name= \"newRating\">"
							    + "<option>1</option>"
							    + "<option>2</option>"
							    + "<option>3</option>"
							    + "<option>4</option>"
							    + "<option>5</option>"
							    + "</select>"
							    + "<br>"
								+ "</div>"
								+ "</div>"
								+ "<div class=\"form-group\">"
								+ "<label for=\"newContent\">New Comment:</label>"
								+ "<input type=\"text\" class=\"form-control\" id=\"newContent\" name=\"newContent\">"
								+ "</div>"
								+ "<div class=\"form-group\">"
								+ "<button type=\"submit\" class=\"btn btn-primary btn-md\" name=\"changeReview\" id=\"changeReview\">Edit Review</button>"
	 							+ "</div>"
	 							+ "</form>";
					}
				}

				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			req.setAttribute("message", restaurant);
			getServletContext().getRequestDispatcher("/Restaurant.jsp")
					.forward(req, res);
			
			
		}

		if (req.getParameter("changeReview") != null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection(
						"jdbc:oracle:thin:testuser/password@localhost",
						"testdb", "password");
				Statement st = con.createStatement();
				System.out.println("connection established successfully...!!");
				Format formatter = new SimpleDateFormat("dd-MMM-yy");
			    String s = formatter.format(new Date());
				ResultSet cre = st.executeQuery("UPDATE reviews SET user_id = '" + session.getAttribute("user") + "', rating = " + req.getParameter("newRating") + ", content = '" + req.getParameter("newContent") + "', review_date = TO_DATE('dd-MON-rr', '" + s + "') WHERE restaurant_id = '" + session2.getAttribute("redit") + "'");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (req.getParameter("usubmit") != null) {
			String usearch = req.getParameter("usearch");

			try {
				user = "";
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection(
						"jdbc:oracle:thin:testuser/password@localhost",
						"testdb", "password");
				Statement st = con.createStatement();
				System.out.println("connection established successfully...!!");
				ResultSet us = st
						.executeQuery("SELECT * FROM users WHERE email_id = '"
								+ usearch + "'");

				user += "<div class=\"container\">";
				while (us.next()) {
					user += "<div><p>" + us.getString("firstname") + " "
							+ us.getString("lastname") + "</p><p>Email: "
							+ us.getString("email_id") + "</p><p>ZIP Code: "
							+ us.getString("zipcode") + "</p></div>";
				}
				user += "<br />";
				ResultSet reviews = st.executeQuery("SELECT restaurants.name, reviews.user_id, reviews.rating, reviews.review_date, reviews.content FROM restaurants INNER JOIN reviews ON reviews.restaurant_id = restaurants.id WHERE reviews.user_id = '"
								+ usearch + "'");
				while (reviews.next()) {
					user += "<div class=\"container\"><table class=\"table table-striped\"><tr><td width=\"60%\">"
							+ reviews.getString("name")
							+ "</td><td width=\"20%\">"
							+ reviews.getString("rating")
							+ "</td><td width=\"20%\">"
							+ reviews.getString("review_date").substring(0, 10)
							+ "</td></tr><tr><td></td><td>"
							+ reviews.getString("content") + "</td></tr>";
				}

				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			req.setAttribute("message2", user);
			getServletContext().getRequestDispatcher("/Profile.jsp").forward(
					req, res);
		}
		
		if (req.getParameter("changeRName") != null) {
			try {
				String redit = (String) session2.getAttribute("redit");
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection(
						"jdbc:oracle:thin:testuser/password@localhost",
						"testdb", "password");
				Statement st = con.createStatement();
				ResultSet cr= st.executeQuery("UPDATE restaurants SET NAME = '" + req.getParameter("newName") + "',STREETADDRESS= '" + req.getParameter("newAddress") + "' WHERE NAME= '" + redit + "'");
			
				con.close();
			} catch (Exception e){
				e.printStackTrace();
			}
			getServletContext().getRequestDispatcher("/index.jsp").forward(req, res);
		}
		
		if (req.getParameter("changeEmail") != null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection(
						"jdbc:oracle:thin:testuser/password@localhost",
						"testdb", "password");
				Statement st = con.createStatement();
				System.out.println("connection established successfully...!!");
				String newEmail = req.getParameter("newEmail");
				ResultSet cu= st.executeQuery("UPDATE users SET email_id = '" + newEmail + "' WHERE email_id= '" + email + "'");
				ResultSet cur= st.executeQuery("UPDATE reviews SET user_id = '" + newEmail + "' WHERE user_id= '" + email + "'");
				session.setAttribute("user", newEmail);
				con.close();
			} catch (Exception e){
				e.printStackTrace();
			}
			getServletContext().getRequestDispatcher("/index.jsp").forward(req, res);
		}
	}
}