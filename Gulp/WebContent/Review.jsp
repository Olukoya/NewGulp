<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*" %>

<% Class.forName("oracle.jdbc.driver.OracleDriver"); %>

<%@ page import ="javax.servlet.http.HttpSession" %>

<% String email= (String) session.getAttribute("user");%>
<head>
  <title>Review</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="jquery.rateyo.css"/>
  
</head>
<body>
<% if (email == null || email.equals("")) { %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Welcome to Gulp!</a>
    </div>
    <div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign-up</a></li>
        <li><a href="Login.jsp"><span class="glyphicon glyphicon-user"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<% } else { %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Welcome to Gulp!</a>
    </div>
    <div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Login.jsp"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<% } %>
<div class="container">
<H1>List of Restaurants to rate</H1>

        <% 
        Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:testuser/password@localhost",
				"testdb", "password");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT ID,NAME FROM restaurants") ; 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>ID</TH>
                <TH>Name</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
            </TR>
            <% } %>
        </TABLE>
</div>
<div class="container">
<form action= "InputReview" method= "POST">

	<div class="form-group">
	  <label for="resid">Restaurant ID:</label>
	  <input type="number" class="form-control" id="resname" name= "resid">
	</div>
    <div class="form-group">
      <label for="rating">Rate the restaurant (Min:1 - Max:5):</label>
      <select class="form-control" id="rating" name= "rating">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
      <br>
	</div>
	<div class="form-group">
      <label for="comment">Comment:</label>
      <textarea class="form-control" rows="5" id="comment" name="comment"> </textarea>
    </div>  
 	<div class="form-group">
 	<button type="submit" class="btn btn-primary btn-md" name="inputreview" id="inputreview">Submit</button>
 	<a class="btn btn-primary btn-md" href="index.jsp">Cancel</a>
	</div> 
   </form>
</div>
</body>
</html>
