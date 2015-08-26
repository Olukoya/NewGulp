<!DOCTYPE html>
<html lang="en">
<%@ page import ="javax.servlet.http.HttpSession" %>

<% String email= (String) session.getAttribute("user");%>
<head>
  <title>Index Page</title>
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
	<form action="SearchDatabase" method="POST">
	<div class="row">
		<h2>Search Restaurants</h2>
           <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" class="  search-query form-control" placeholder="Search Restaurants" name="rsearch"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="submit" name="rsubmit">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
	</div>
	</form>
</div>
<div class="container">
	<form action="SearchDatabase" method="POST">
	<div class="row">
		<h2>Search Users</h2>
           <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" class="  search-query form-control" placeholder="Search Users" name="usearch"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="submit" name="usubmit">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
	</div>
	</form>
</div>
<br />
<% if (session.getAttribute("user") != null) {%>
<div class="container">
 	<form id="chUNameF" name="chRNameF" action="SearchDatabase" method="post">
 	<div class="form-group">
      <label for="newEmail">New Email:</label>
      <input type="text" class="form-control" id="newEmail" name="newEmail">
    </div>
    <div class="form-group">
    <button type="submit" class="btn btn-primary btn-md" name="changeEmail" id="changeEmail" >Edit User Info</button>

 	</div>
 	</form>
	</div>
<% } %>
</body>
</html>
