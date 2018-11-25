<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style-register.css">
    <title>Phonebooker - Register</title>
  </head>
  <body>
  
    <!-- Navigation -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">
          <img src="img/logo.png" width="30" height="30" alt=""> Phonebooker
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Home</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#">Register
                <span class="sr-only">(current)</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Navigation -->
    
    <!--  Message -->
    <% String message = (String) request.getAttribute("message"); %>
    <% if(message != null) { %>	
    	<div class="container mt-3">
	   		<div class="offset-md-3 col-md-6 offset-sm-2 col-sm-8 offset-xs-1 col-xs-10">
			  <div class="alert alert-danger" role="alert" align="center">
				 <%= message %>
			  </div>
			</div>
		</div>
    <% } %>
    <!--  Message -->
    
    <!-- Form -->
    <div class="container-fluid">
      <div class="row">
        <div class="offset-md-3 col-md-6 offset-sm-2 col-sm-8 offset-xs-1 col-xs-10 mt-3">
          <form action="/Phonebooker/Controller" method="post">
            <div class="form-goup">
           	  <input type="hidden" name="action" value="doregister" />
              <!-- Username -->
              <label for="InputUsername">Username</label>
              <input type="text" name="username" class="form-control shadow-lg" placeholder="*required">
              <!-- Password -->
              <label for="InputPassword">Password</label>
              <input type="password" name="password" class="form-control shadow-lg" placeholder="*required">
              <!-- Repeat Password-->
              <label for="InputRepeatPassword">Repeat Password</label>
              <input type="password" name="repeatPassword" class="form-control shadow-lg" placeholder="*required">
              <!-- Name -->
              <label for="InputName">Name</label>
              <input type="text" name="name" class="form-control shadow-lg">
              <!-- Surname -->
              <label for="InputSurname">Surname</label>
              <input type="text" name="surname" class="form-control shadow-lg">
              <!-- DOB -->
              <label for="InputDate">Birth date</label>
              <input type="date" name="birthDate" class="form-control shadow-lg">
              <!-- Email -->
              <label for="InputEmail1">Email address</label>
              <input type="email" name="email" class="form-control shadow-lg" id="exampleInputEmail1" aria-describedby="emailHelp" >
              <!-- Phone -->
              <label for="InputPhone">Phone Number</label>
              <input type="text" name="phone" class="form-control shadow-lg">
            </div>
            <br>
            <button type="submit" class="btn btn-success shadow-lg">Submit</button>
          </form>
        </div>
      </div>
    </div>
    <!-- Form -->
    
    <!-- Footer -->
    <footer>
      <div class="container-fluid">
        <div class="row footer p-md-2 justify-content-center">
          Copyright 2018: Nikola Malinovic
        </div>
      </div>
    </footer>
    <!-- Footer -->
    
  </body>
</html>
