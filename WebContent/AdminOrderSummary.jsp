<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin Order Summary</title>

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
          <li class="nav-item">
            <a class="nav-link" href="Search.jsp">Search</a>
          </li>
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
  
  <!-- Page Content -->
  <div class="container">
    <h1 class="my-4">Ticketeer
      <small>Order Details</small>
    </h1>
    <h3 class="mt-5">Order # <small>39483</small></h3>
    <div class="row">
      <table class="table">
        <tbody>
          <tr>
            <td><b>Name</b></td>
            <td>James Alexander</td>
            <td></td>
          </tr>
          <tr>
            <td><b>Contact</b></td>
            <td>303-444-4039<br>asdf@sdf.com</td>
          </tr>
          <tr>
            <td><b>Billing Address</b></td>
            <td>2839 Peachtree St<br>Atlanta, GA 30043-4859</td>
          </tr>
          <tr>
            <td><b>Credit Card</b></td>
            <td>XXXX-XXXX-XXXX-3943</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="row">
      <table class="table">
        <thead>
          <tr>
            <th>Item</th>
            <th>Price</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <p><b>Movie Title </b>show time, auditorium, seat number, age group</p>
            </td>
            <td>$6</td>
            <td>
              <button type="button" class="btn btn-danger" onClick="refundTicket()">Refund Ticket</button>
            </td>
          </tr>
          <tr>
            <td>
              <p><b>Movie Title </b>show time, auditorium, seat number, age group</p>
            </td>
            <td>$6</td>
            <td>
              <button type="button" class="btn btn-danger" onClick="refundTicket()">Refund Ticket</button>
            </td>
          </tr>
          <tr>
            <td>
              <p><b>Movie Title </b>show time, auditorium, seat number, age group</p>
            </td>
            <td>$6</td>
            <td>
              <button type="button" class="btn btn-danger" onClick="refundTicket()">Refund Ticket</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="row">
      <table class="table">
        <tbody>
          <tr>
            <td>Ticket Total</td>
            <td></td>
            <td>$18.00</td>
          </tr>
          <tr>
            <td>Tax</td>
            <td></td>
            <td>+$1.00</td>
          </tr>
          <tr>
            <td>Promo Code:EXAMPLECODE</td>
            <td>(-10%)</td>
            <td>-$1.90</td>
          </tr>
          <tr>
            <td><b>Order Total</b></td>
            <td></td>
            <td><b>$17.10</b></td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="row">
      <a class="btn" href="#">Back to Browse</a>
      <button type="button" class="btn btn-danger" onClick="refundOrder()">Refund Order</button>
    </div>
  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
