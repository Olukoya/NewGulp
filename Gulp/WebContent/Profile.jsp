<!DOCTYPE html>
<html lang="en">
<%@ page import ="javax.servlet.http.HttpSession" %>

<% String email= (String) session.getAttribute("user");%>
<head>
  <title>Profile Page</title>
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
<h2>Profile</h2>
${content2}
${message2}
</div>
</body>
</html>