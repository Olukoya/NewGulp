<!DOCTYPE html>
<html lang="en">
<%@ page import ="javax.servlet.http.HttpSession" %>

<% String email= (String) session.getAttribute("user");%>
<head>
  <title>Signup Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
<!--
function validateForm() {
	var email = document.forms["signupForm"]["email"].value;
	var password = document.forms["signupForm"]["password"].value;
	var fName = document.forms["signupForm"]["fn"].value;
	var lName = document.forms["signupForm"]["ln"].value;
	var zipcode = document.forms["signupForm"]["zip"].value;
	if (email == null || email == "" || password == null || password == "" || fName == null || fName == "" || lName == null || lName == "" || zipcode == null || zipcode == "") {
  		alert("Please Fill All Required Field");
  		return false;
  	}
}
function userExist() {
	alert("The user already exists!")
}//-->
</script>
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
  <h2>Sign-up Form</h2>
   <form name="signupForm" onsubmit="return validateForm()" action="User" method="POST">
    <div class="form-group">
      <label for="email">Email address:</label>
      <input type="text" class="form-control" id="email" name="email">
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" class="form-control" id="password" name="password">
    </div>
    <div class="form-group">
      <label for="fn">First name:</label>
      <input type="text" class="form-control" id="fn" name="fn">
    </div>
    <div class="form-group">
      <label for="ln">Last name:</label>
      <input type="text" class="form-control" id="ln" name="ln">
    </div>
    <div class="form-group">
      <label for="zip">ZIP code:</label>
      <input type="text" class="form-control" id="zip" name="zip">
    </div>
    <div class="form-group">
 	<button type="submit" class="btn btn-primary btn-md" name="signup" id="signup">Submit</button>
 	<a class="btn btn-primary btn-md" href="index.jsp">Cancel</a>
	</div>
  </form>
</div>
${content2}
</body>
</html>