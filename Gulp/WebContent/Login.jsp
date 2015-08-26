<!DOCTYPE html>
<html lang="en">
<%@ page import ="javax.servlet.http.HttpSession" %>

<% String email= (String) session.getAttribute("user");%>
<head>
  <title>Login Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
<!--
function validateForm() {
	var email = document.forms["loginForm"]["email"].value;
	var password = document.forms["loginForm"]["password"].value;
	if (email == null || email == "" || password == null || password == "") {
  		alert("Please Fill All Required Field");
  		return false;
  	}
}
function userNotExist() {
	alert("The user is not exist!")
}
function pswIncorrect() {
	alert("The password is Incorrect.")
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
        <li><a href="Signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign-up</a></li>
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
  <h2>Login Form</h2>
   <form name="loginForm" onsubmit="return validateForm()" action="User" method="POST">
    <div class="form-group">
      <label for="email">Email address:</label>
      <input type="text" class="form-control" id="email" name="email">
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" class="form-control" id="password" name="password">
    </div>
    <div class="form-group">
 	<button type="submit" class="btn btn-primary btn-md" name="login" id="login">Submit</button>
 	<a class="btn btn-primary btn-md" href="index.jsp">Cancel</a>
	</div>
  </form>
</div> 
${content1}
</body>
</html>