<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style-home.css">
    <title>Phonebooker - Home</title>
  </head>
  <body>
  
    <!-- Navigation -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="index.html">
          <img src="img/logo.png" width="30" height="30" alt="" style="background-color: green"> Phonebooker
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.html">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="register.html">Register</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Navigation -->
    
    <!-- jumbotron -->
    <div class="row-fluid justify-content-center">
      <div class="offset-md-2 col-md-8 col-xs-12 offset-sm-1 col-sm-10">
        <div class="jumbotron mt-5">
          <div class="container">
            <h1 class="display-4">Welcome!</h1>
            <p class="lead">This is a free phonebook web app. Register for free and use your own, web based phonebook, stored on our server.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- jumbotron -->
    
    <!--  fail message -->
    <% String message = (String) request.getAttribute("failmessage"); %>
    <% if(message != null) { %>	
    	<div class="container">
	   		<div class="offset-md-3 col-md-6 offset-sm-1 col-sm-10 col-xs-12">
			  <div class="alert alert-danger" role="alert" align="center">
				 <%= message %>
			  </div>
			</div>
		</div>
    <% } %>
    <!--  fail message -->
    
    <!-- Login Container -->
    <div class="container mt-5">
      <div class="row-fluid">
        <div class="offset-md-3 col-md-6 offset-sm-1 col-sm-10 col-xs-12 form-background">
          <form action="/Phonebooker/Controller" method="post">
            <div class="form-group">
           	  <input type="hidden" name="action" value="dologin" />
              <label for="Username">Username</label>
              <input type="text" class="form-control" name="username" placeholder="Enter username">
              <br>
              <label for="Password">Password</label>
              <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
            <input type="submit" class="form-control btn btn-success btn-block" value="Login">
          </form>
        </div>
      </div>
    </div>
    <!-- Login Container -->
    
    <!-- Footer -->
    <footer>
      <div class="container-fluid mt-5">
        <div class="row upper-footer pt-4 pr-4 pl-4 justify-content-center">
          <h2>Tired of keeping your contacts on paper?</h2>
          <h3>You don't have to do it anymore. Get started for free!</h3><br>
        </div>
        <div class="row upper-footer pt-2 pb-4 justify-content-center">
          <a href="register.html"><button type="button" name="register" class="btn btn-lg btn-success">Register</button></a>
        </div>
        <div class="row footer p-md-2 justify-content-center">
          Copyright 2018: Nikola Malinovic
        </div>
      </div>
    </footer>
    <!-- Footer -->
    
  </body>
</html>
