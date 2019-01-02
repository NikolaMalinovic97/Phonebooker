<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <!-- session.getAttribute("username") -->
<%@ page import="beans.User , beans.Contact , java.util.ArrayList" %>
<% request.removeAttribute("name");
request.removeAttribute("surname");
request.removeAttribute("phone");
request.removeAttribute("action"); %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style-phonebooker.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="js/objects/contact.js"></script>
    <script src="js/tableManager.js"></script>
    <script src="js/addContactModalValidation.js"></script>
    <script src="js/changeContactModal.js"></script>
    <title>Phonebooker</title>
  </head>
  <body onload="getContactsAndTableBody()">
    
    <!-- Session beans -->
    <% User logedUser = (User) session.getAttribute("logedUser"); %>
    <% ArrayList<Contact> contacts = (ArrayList<Contact>) session.getAttribute("contacts"); %>
    <!-- Session beans -->
    
    <!-- Profile info variables -->
	<%
	String userName = logedUser.getName();
	String userSurname = logedUser.getSurname();
	String userDOB = logedUser.getDob();
	String userEmail = logedUser.getEmail();
	String userPhone = logedUser.getPhone();
	if(userName == null) {
		userName = "";
	}
	if(userSurname == null) {
		userSurname = "";
	}
	if(userDOB == null) {
		userDOB = "";
	}
	if(userEmail == null) {
		userEmail = "";
	}
	if(userPhone == null) {
		userPhone = "";
	}
	%>
	<!-- Beans for change info modal -->
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="#">
          <img src="img/logo.png" width="30" height="30" alt=""> Phonebooker
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link active" href="#">My phonebooker
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Log Out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Navigation -->
    
    <!-- Dashboard -->
    <div class="container-fluid">
      <div class="row">
        <!-- Contacts -->
        <div class="col-lg-9 dashboard-contacts">
          <h3>Contacts</h3>
          <hr>
          <div class="row">
            <div class="col-lg-3">
              <div class="btn-group  form-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#addContactModal"><i class="fas fa-user-plus"></i></button>
                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#changeContactModal"><i class="fas fa-user-cog"></i></button>
                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#deleteContactModal"><i class="fas fa-user-times"></i></button>
              </div>
            </div>
            <div class="col-7 col-md-7 col-lg-6">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <button class="btn btn-secondary" type="button" id="button-addon1"><i class="fas fa-search"></i></button>
                </div>
                <input type="text" id="searchInput" class="form-control" placeholder="Search" onkeyup="doSearch()">
              </div>
            </div>
            <div class="col-8 col-md-5 col-lg-3">
              <div class="input-group-prepend">
                <button class="btn btn-secondary" type="button" id="button-addon1">Search by:</button>
                <select class="form-control" id="searchCriteria" onchange="doSearch()">
                 <option>Name</option>
                 <option>Surname</option>
                 <option>Phone</option>
                </select>
              </div>
            </div>
            <div class="col-12 mt-3">
              
              <!-- Table -->
              <table class="table table-secondary table-striped table-hover table-bordered">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Surname</th>
                    <th scope="col">Phone number</th>
                  </tr>
                </thead>
                <tbody id="tableBody">
                <% for(Contact c: contacts) { %>
                  <tr>
                    <td><%= c.getContactName() %></td>
                    <td><%= c.getContactSurname() %></td>
                    <td><%= c.getContactPhone() %></td>
                  </tr>
                <% } %> 
                </tbody>
              </table>
              <!-- Table end -->
              
            </div>
          </div>
        </div>        
        
        <!-- Profile -->
        <div class="col-lg-3 dashboard-profile">
          <h3>Profile</h3>
          <hr>
          <div class="row">
            <div class="col-3">
              <h6>Name:</h6>
            </div>
            <div class="col-9">
              <p> <%= userName %> </p>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-3">
              <h6>Surname:</h6>
            </div>
            <div class="col-9">
              <p> <%= userSurname %> </p>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-3">
              <h6>DOB:</h6>
            </div>
            <div class="col-9">
              <p> <%= userDOB %> </p>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-3">
              <h6>Email:</h6>
            </div>
            <div class="col-9">
              <p> <%= userEmail %> </p>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-3">
              <h6>Phone:</h6>
            </div>
            <div class="col-9">
              <p> <%= userPhone %> </p>
            </div>
          </div>
          <hr>
          <button type="button" name="button" class="btn btn-success btn-block mb-3" data-toggle="modal" data-target="#changeProfileInfoModal">Change Profile info</button>
        </div>
      </div>
    </div>
    <!-- Dashboard -->
    
    <!-- Footer -->
    <footer>
      <div class="container-fluid">
        <div class="row footer p-md-2 justify-content-center">
          Copyright 2018: Nikola Malinovic
        </div>
      </div>
    </footer>
    <!-- Footer -->
    
    <!-- Modals -->
    
    	<!-- Add Contact Modal -->
	    <div class="modal fade" id="addContactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Add Contact</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      <div class="alert alert-danger" role="alert" id="addContactAlert">
				 All fields are required!
			  </div>
		        <form action="/Phonebooker/Controller" method="post">
		            <div class="form-goup">
		           	  <input type="hidden" name="action" value="addcontact" />
		              <!-- Contact name -->
		              <label for="InputContactName">Name</label>
		              <input type="text" name="name" class="form-control shadow-lg" id="addContactName" onkeyup="validate()">
		              <!-- Contact surname -->
		              <label for="InputContactSurname">Surname</label>
		              <input type="text" name="surname" class="form-control shadow-lg" id="addContactSurname" onkeyup="validate()">
		              <!-- Contact phone -->
		              <label for="InputContactPhone">Phone number</label>
		              <input type="text" name="phone" class="form-control shadow-lg" id="addContactPhone" onkeyup="validate()">
		            </div>
		            <br>
		            <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-success" disabled id="addContactSubmit">Save contact</button>
				    </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- Add Contact Modal -->
		
		<!-- Change Contact Modal -->
		<div class="modal fade" id="changeContactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Change Contact</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form action="/Phonebooker/Controller" method="post">
		            <div class="form-goup">
		           	  <input type="hidden" name="action" value="changecontact" />
		           	  <!-- Choose contact -->
		              <label for="InputContactName">Choose contact</label>
		              <select id="changeContactModalSelect" onchange="setContactValues()">
		              <% 
		              String contactStr;
		              for(Contact c: contacts) { 
		            	  contactStr = c.getContactName() + " " + c.getContactSurname() + " " + c.getContactPhone(); 
		              %>
		                  <option value="<%= contactStr %>" ><%= contactStr %></option>
		              <%
		              } 
		              %>
		              </select>
		              <br>
		              <!-- hidden values -->
		              <input type="hidden" name="contactOldName" id="contactOldName">
		              <input type="hidden" name="contactOldSurname" id="contactOldSurname">
		              <input type="hidden" name="contactOldPhone" id="contactOldPhone">
		              <!-- Contact name -->
		              <label for="InputContactName">Name</label>
		              <input type="text" name="name" class="form-control shadow-lg" id="changeContactNameInput">
		              <!-- Contact surname -->
		              <label for="InputContactSurname">Surname</label>
		              <input type="text" name="surname" class="form-control shadow-lg" id="changeContactSurnameInput">
		              <!-- Contact phone -->
		              <label for="InputContactPhone">Phone number</label>
		              <input type="text" name="phone" class="form-control shadow-lg" id="changeContactPhoneInput">
		            </div>
		            <br>
		            <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss changes</button>
				        <button type="submit" class="btn btn-success">Save changes</button>
				    </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- Change Contact Modal -->
		
		<!-- Delete Contact Modal -->
		<div class="modal fade" id="deleteContactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Delete Contact</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form action="/Phonebooker/Controller" method="post">
		            <div class="form-goup">
		           	  <input type="hidden" name="action" value="deletecontact" />
		           	  <!-- hidden values -->
		              <input type="hidden" name="name" id="deleteName">
		              <input type="hidden" name="surname" id="deleteSurname">
		              <input type="hidden" name="phone" id="deletePhone">
		           	  <!-- Choose contact -->
		              <label for="InputContactName">Choose contact</label>
		              <select>
		              <% for(Contact c: contacts) { %>
		                  <option><%= c.getContactName() + " " + c.getContactSurname() + " " + c.getContactPhone() %> </option>
		              <% } %>
		              </select>
		              <br>
		              <p style="color: red;">Once you delete a contact, You won't be able to recover it.</p>
		            </div>
		            <br>
		            <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-success">Delete contact</button>
				    </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- Delete Contact Modal -->
		
		<!-- Change Profile Info Modal -->
		<div class="modal fade" id="changeProfileInfoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Change Profile Info</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form action="/Phonebooker/Controller" method="post">
		            <div class="form-goup">
		           	  <input type="hidden" name="action" value="changecontactinfo" />
		           	   <!-- hidden values -->
		               <input type="hidden" name="contactOldName" id="userOldName">
		               <input type="hidden" name="contactOldSurname" id="userOldSurname">
		               <input type="hidden" name="contactOldPhone" id="userOldDob">
		               <input type="hidden" name="contactOldPhone" id="userOldEmail">
		               <input type="hidden" name="contactOldPhone" id="userOldPhone">
		           	   <!-- Name -->
		               <label for="InputName">Name</label>
		               <input type="text" name="name" class="form-control shadow-lg" value="<%= userName %>">
		               <!-- Surname -->
		               <label for="InputSurname">Surname</label>
		               <input type="text" name="surname" class="form-control shadow-lg" value="<%= userSurname %>">
		               <!-- DOB -->
		               <label for="InputDate">Birth date</label>
		               <input type="date" name="birthDate" class="form-control shadow-lg" value="<%= userDOB %>">
		               <!-- Email -->
		               <label for="InputEmail1">Email address</label>
		               <input type="email" name="email" class="form-control shadow-lg" value="<%= userEmail %>" >
		               <!-- Phone -->
		               <label for="InputPhone">Phone Number</label>
		               <input type="text" name="phone" class="form-control shadow-lg" value="<%= userPhone %>">
		            </div>
		            <br>
		            <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Discard changes</button>
				        <button type="submit" class="btn btn-success">Save changes</button>
				    </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- Change Profile Info Modal -->
		
    <!-- Modals -->
  </body>
</html>
    