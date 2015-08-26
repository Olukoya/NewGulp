import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.Format;

 
@WebServlet("/InputReview")
public class InputReview extends HttpServlet  
{
	static String comment, stringRate="";
	static int rate = 0;
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		getServletContext().getRequestDispatcher("/Review.jsp").forward(req, res);
		
		}
	
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
    	HttpSession session = req.getSession();
		String email = (String) session.getAttribute("user");
		
    String resid = req.getParameter("resid");
    String comment = req.getParameter("comment");
    
    int  rate = Integer.parseInt(req.getParameter("rating"));
    
    Format formatter = new SimpleDateFormat("dd-MMM-yy");
    String s = formatter.format(new Date());
    	 
    	 try
         {
              Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection con=DriverManager.getConnection("jdbc:oracle:thin:testuser/password@localhost","testdb","password");
              Statement st=con.createStatement();
              System.out.println("connection established successfully...!!");
              System.out.println(s);
              st.executeQuery ("Insert into REVIEWS (RESTAURANT_ID, USER_ID, RATING, CONTENT,REVIEW_DATE) values ('"+resid+"','"+email+"',"+rate+",'"+comment+"', TO_DATE('"+s+"', 'dd-MON-rr'))");
          
                  con.close();
                  getServletContext().getRequestDispatcher("/Restaurant.jsp").forward(req, res);
         }
         catch (Exception e){
             e.printStackTrace();
         }
    }
}