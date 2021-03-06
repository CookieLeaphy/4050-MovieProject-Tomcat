<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, entity.Movie, orm.ManageMovie" %>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Edit Movie Listing</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!--script src="//code.jquery.com/jquery-1.11.1.min.js"></script-->
  <!-- Custom styles for this template -->
  <link href="css/portfolio-item.css" rel="stylesheet">

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

<!-- Page Content -->
<% 
String stringMID = request.getParameter("param");
int mid = Integer.parseInt(stringMID);
ManageMovie mngMovie = new ManageMovie();
Movie movie = mngMovie.getMovie(mid);
session.setAttribute("movie", movie);
%>

<div class="container">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4">Ticketeer
      <small>Edit Movie Listing</small>
    </h1>

    <!-- Portfolio Item Row -->
    <div class="row">
      <form action="ChangeMovie" method="get">
      <% if(request.getAttribute("error")!= null && request.getAttribute("error").equals("FailedMovieChange")) { %>
        <h6 class = "text-danger">Invalid Fields</h6>
      <% } %>
        <div class="form-group">
          <label for="title">Title</label>
          <input type="text" class="form-control" name="title" value="<%= movie.getTitle() %>">
        </div>
        <div class="form-group">
          <label for="release">Release date</label>
          <input type="datetime-local" class="form-control" name="release" value="<%= movie.getReleaseDate() %>">
        </div>
        <div class="form-group">
          <label for="poster">Poster</label>
          <input type="text" class="form-control" name="link" value="<%= movie.getLink() %>">
        </div>
        <div class="form-group">
          <label for="trailor">Trailer</label>
          <input type="text" class="form-control" name="trailor" value="<%= movie.getTrailor() %>">
        </div>
        <div class="form-group">
          <label for="summary">Summary</label>
          <textarea class="form-control" rows="5" id="description" name = "description"><%= movie.getDescription() %></textarea>
        </div>
        <div class="form-group">
          <label for="rating">Rating</label>
          <select class="form-control" id="rating">
            <option disabled selected value=""></option>
            <option value="G">G</option>
            <option value="PG">PG</option>
            <option value="PG">PG-13</option>
            <option value="R">R</option>
            <option value="NC-17">NC-17</option>
          </select>
        </div>
        <div class="form-group">
          <label for="genre">Genre</label>
          <select class="form-control" name="genre">
            <option disabled selected value=""></option>
            <option value="Horror">Horror</option>
            <option value="Comedy">Comedy</option>
            <option value="Drama">Drama</option>
            <option value="Action">Action</option>
            <option value="Romance">Romance</option>
            <option value="Sci-Fi">Sci-Fi</option>
            <option value="Art">Art</option>
            <option value="Documentary">Documentary</option>
            <option value="Performance Recording">Performance Recording</option>
          </select>
        </div>
        <div class="form-group">
          <label for="director">Director</label>
          <input type="text" class="form-control" name="director" value="<%= movie.getDirector() %>">
        </div>
        <div class="form-group">
          <label for="producer">Producer</label>
          <input type="text" class="form-control" name="producer" value="<%= movie.getProducer() %>">
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary">Update Movie</button>
        </div>
      </form>
      <!-- Related Projects Row -->
      <h3 class="my-4"> </h3> <!--padding not necessary -->

      <!-- /.row -->

    </div>
    </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->

  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
