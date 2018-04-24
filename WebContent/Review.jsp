<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Movie Review</title>

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
      <small>drJamieBoy's Review of Black Panther</small>
    </h1>
    <h3 class="mt-5">Full Review</h3>
    <p> A spectre is haunting Europe â the spectre of communism. All the powers of old Europe have entered into a holy alliance to exorcise this spectre: Pope and Tsar, Metternich and Guizot, French Radicals and German police-spies. Where is the party in opposition that has not been decried as communistic by its opponents in power? Where is the opposition that has not hurled back the branding reproach of communism, against the more advanced opposition parties, as well as against its reactionary adversaries? Two things result from this fact: I. Communism is already acknowledged by all European powers to be itself a power. II. It is high time that Communists should openly, in the face of the whole world, publish their views, their aims, their tendencies, and meet this nursery tale of the Spectre of Communism with a manifesto of the party itself. To this end, Communists of various nationalities have assembled in London and sketched the following manifesto, to be published in the English, French, German, Italian, Flemish and Danish languages. </p>
  <h3 class="mt-5">Rating <small>2/4 Stars</small></h3>
    <div class="row">
      <a class="btn" href="#">Back to Movie</a>
    </div>
  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
