<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Ticket, orm.ManageTicket" %>
<%@ page import="entity.Movie, orm.ManageMovie" %>
<%@ page import="entity.User, orm.ManageUser" %>
<%@ page import="entity.Promo, orm.ManagePromo" %>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin Control Hub</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/logo-nav.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="Home.jsp">Movies</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">

<%
//******LOGIN/CREATE ACCOUNT
//Check if "Hello 'User'!" is necessary
if((session.getAttribute("connected") == null) || !((String) session.getAttribute("connected")).equals("true")){
	//String redirectURL = "/path/ToYour/login.jsp;
    //response.sendRedirect("Login-CreateNewAccount.jsp");
%>

            <a class="nav-link" href="Login-CreateNewAccount.jsp">Login/Create an account 
              <span class="sr-only">(current)</span>
            </a> 

<% } else if((int)session.getAttribute("userType")==1){ //Check if the user is an admin %>

            <a class="nav-item" href="AdminSettings.jsp">Hello, <%= session.getAttribute("user") %>!
              <span class="sr-only">(current)</span>
            </a>

<% } else { %>

            <a class="nav-item" href="Settings.jsp">Hello, <%= session.getAttribute("user") %>!
              <span class="sr-only">(current)</span>
            </a>
            
<% } %>
          </li>
<%
//*****USER SETTING
//If user settings should be redirected or exist
if((session.getAttribute("connected") == null) || !((String) session.getAttribute("connected")).equals("true")){
	//Prevent from posting anything
%>

<% } else if((int)session.getAttribute("userType")==0){ //if user is a customer%>

          <li class="nav-item active">
            <a class="nav-link" href="Settings.jsp">Settings</a>
          </li>
          
<% } else if((int) session.getAttribute("userType")==1) { //Check if admin {%>
	<li class="nav-item active">
            <a class="nav-link" href="AdminSettings.jsp">Settings</a>
          </li>
<% } %>

<%
//******LOG OUT
//Display Log out 
if((session.getAttribute("connected") == null) || !((String) session.getAttribute("connected")).equals("true"))
	{
	//Do nothing here
	}
else{   //Display Log Out
%>
          <li class="nav-item">
            <a class="nav-link" href="LogOut">Logout</a>
          </li>
<%} %>
        </ul>
      </div>
    </div>
  </nav>

<%
ManageUser mngUser = new ManageUser();
ManageTicket mngTicket = new ManageTicket();
ManageMovie mngMovie = new ManageMovie(); 
ManagePromo mngPromo = new ManagePromo();
List<User> userResults = mngUser.getAllUsers();
List<Movie> movieResults = mngMovie.getAllMovies();
List<Ticket> ticketResults = mngTicket.getAllTickets();
List<Promo> promoResults = mngPromo.getAllPromos(); 
%>
  <!-- Page Content -->
  <div class="container-fluid">
    <div class="row">
      <h1 class="my-4">Ticketeer
        <small>Control Hub</small>
      </h1>
    </div>
    <div class="row row-eq-height">
      <div class="col">
        <h2 class="mt-4">Promotions</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead> <!-- style="display:block;"-->
            <tr>
              <th>Promo Code</th>
              <th>Type</th>
              <th>Amount</th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
          <% for(Promo p : promoResults) { %>
            <tr>
              <td><b><%= p.getCode() %></b></td>
              <td><%= p.getType() %></td>
              <td><%= p.getAmount() %></td>
              <td>
         	    <a class="btn" href="DeletePromo?param=<%=p.getId()%>">Delete</a>
              </td>
            </tr>
            <% } %>
          </tbody>
        </table>
        <h5>Create New Promotion</h5>
        <form action="AddPromoCode" method = "get">
          <div class="form-group">
            <label for="promoCode">Promo Code</label>
            <input type="input" class="form-control" id="promoCode" name = "promoCode">
            <label for="promoType">Type</label>
            <select class="form-control" id="promoType" name = "promoType">
              <option value = "$">$</option>
              <option value = "%">%</option>
            </select>
            <label for="promoAmount">Amount</label>
            <input type="input" class="form-control" id="promoAmount" name = "promoAmount">
            <button type="submit" class="btn btn-primary" onClick="addPromo()">Create</button>
          </div>
        </form>
      </div>
      <div class="col"> <!--style:"resize:both;"-->
        <h2 class="mt-4">Users</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead>
            <tr>
              <th>#</th>
              <th>Username</th>
              <th>Email</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
          <% for(User u : userResults) {
          		if(u.getUser_type()!=1) {%>
            <tr>
              <td><b><%= u.getId() %></b></td>
              <td><%= u.getUserName() %></td>
              <td><%= u.getEmail() %></td>
              <td>
          	    <a class="btn" href="DeleteUser?param=<%=u.getId()%>">Delete</a>
              </td>
            </tr>
            <% }} %>
          </tbody>
        </table>
        <a class="btn btn-success" href="AdminCreateAccount.jsp">Create New User</a>
      </div>
    </div>
    <div class="row row-eq-height">
      <div class="col">
        <h2 class="mt-4">Movies</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead>
            <tr>
              <th>Movie</th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
          <% for(Movie m : movieResults) { %>
            <tr>
              <td><b><%= m.getTitle() %></b></td>
             <td>
                <a class="btn" href="AdminEditMovie.jsp?param=<%=m.getID()%>">Edit</a>
              </td>
              <td>
          	    <a class="btn" href="DeleteMovie?param=<%=m.getID()%>">Delete</a>
              </td>
            </tr>
            <% } %>
          </tbody>
        </table>
        <a class="btn btn-success" href="AdminCreateMovie.jsp">Create New Movie</a>
      </div>

      <div class="col">
        <h2 class="mt-4">Orders</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead>
            <tr>
              <th>Order #</th>
              <th>Date</th>
              <th>User</th>
              <th>Total</th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
          <% for(Ticket t : ticketResults) { %>
            <tr>
              <td><b><%= t.getID() %></b></td>
              <td>1/1/2000</td>
              <td><%= t.getPurchaserName() %></td>
              <td>$<%=t.getPrice() %></td>
              <td>
          	    <a class="btn" href="DeleteTicket?param=<%=t.getID()%>">Delete</a>
              </td>
            </tr>
		<% } %>
          </tbody>
        </table>
      </div>
    </div>
    <div class="row row-eq-height">
      <div class="col">
        <h2 class="mt-4">Emails</h2>
        <form action = "SendNewsPromos" method ="get">
          <div class="form-group">
            <label for="subject">Subject</label>
            <input type="text" class="form-control" id="subject" name = "subject">
          </div>
          <div class="form-group">
            <label for="text">Text</label>
            <textarea class="form-control" rows="5" id="text" name = "text"></textarea>
          </div>
          <div class="form-group">
            <label for="type">Type</label>
            <select class="form-control" id="type" name = "type">
              <option value = "N&P">News & Promotion</option>
              <option value = "N">News</option>
              <option value = "P">Promotion</option>
            </select>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary" onClick=createPreview()>Send</button>
          </div>
        </form>
      </div>
      <div class="col">
        <h2 class="mt-4">Sales</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead>
            <tr>
              <th>Movie</th>
              <th>Tickets Sold</th>
              <th>Proportion of Total Sales</th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td>Black Panther</td>
              <td>9,384</td>
              <td>5%</td>
            </tr>
            <tr>
              <td>Ladybird</td>
              <td>2,394</td>
              <td>1%</td>
            </tr>
            <tr>
              <td>Saw XVI</td>
              <td>3,293</td>
              <td>3%</td>
            </tr>
            <tr>
              <td>Mars Attacks</td>
              <td>20,000</td>
              <td>20%</td>
            </tr>
            <tr>
              <td>Spider-Man vs. X-Men</td>
              <td>50,034</td>
              <td>47%</td>
            </tr>
          </tbody>
        </table>
        <a class="btn btn-primary">Go to Sales Page</a>
      </div>
    </div>
  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
