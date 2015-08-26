<!DOCTYPE html>
<html lang="en">
<%@ page import ="javax.servlet.http.HttpSession" %>

<% String email= (String) session.getAttribute("user");%>
<head>
  <title>Restaurant Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
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
<h2>Restaurant</h2>
${message}
</div>
<div class="container">
 	<a class="btn btn-primary btn-md" href="Review.jsp">Write Review</a>
</div>
<br />
<div class="container">
 	<form id="chRNameF" name="chRNameF" action="SearchDatabase" method="post">
 	<div class="form-group">
      <label for="newName">New Name:</label>
      <input type="text" class="form-control" id="newName" name="newName">
    </div>
    <div class="form-group">
      <label for="newAddress">New Address:</label>
      <input type="text" class="form-control" id="newAddress" name="newAddress">
    </div>
    <div class="form-group">
    <button type="submit" class="btn btn-primary btn-md" name="changeRName" id="changeRName" >Edit Restaurant Info</button>

 	</div>
 	</form>
	</div>
</body>
</html>
