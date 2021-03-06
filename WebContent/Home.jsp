<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, entity.Movie, orm.ManageMovie" %>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Home/Browse Movies</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/4-col-portfolio.css" rel="stylesheet">

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
<!--  End of Navigation -->


  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading -->
    <h1 class="my-4">Movies
      <h6>Find your favorite selections here!</h6>
    </h1>
    <form action="SearchMovie" method="get">
		<!--  <div class ="row "></div>-->
	      <div class="form-group">
	        <input type="text" class="form-control" id="user" name="title">
	      
		</div>
	    <!-- <div class="row"> -->
	        <div class="form-row">
	          <div class="form-group">
	            <select class="form-control" id="genre" name="genre">
	              <option value="">-</option>
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
	            <label for="genre">Genre</label>
	          </div>
	          <div class="form-group">
	            <select class="form-control" id="rating" name="rating">
	              <option value="">-</option>
	              <option value="G">G</option>
	              <option value="PG">PG</option>
	              <option value="PG-13">PG-13</option>
	              <option value="R">R</option>
	              <option value="NC-17">NC-17</option>
	            </select>
	            <label for="rating">Rating</label>
	          </div>
	          <div class="form-group">
	            <select class="form-control" id="releaseStatus" name="releaseStatus">
	              <option value="">-</option>
	              <option value="Showing">Showing</option>
	              <option value="Coming Soon">Coming Soon</option>
	            </select>
	            <label for="releaseStatus">Release status</label>
	          </div>
	          <div class="form-group">
	            <input type="date" class="form-control" id="showDate">
	            <label for="showDate">Showing date</label>
	          </div>
	          <div class="form-group">
	            <input type="time" class="form-control" id="showTime">
	            <label for="showTime">Showing time</label>
	          </div>
	          <div class="form-group">
	            <button type="submit" class="btn btn-primary" onClick="filterMovies()" id="submitFilter">Filter Movies</button>
	          </div>
	        </div>
	   <!-- </div> -->
    </form>

    <div class="row">
    <% ManageMovie mngMov = new ManageMovie(); %>
    <% List<Movie> results = (List<Movie>) request.getAttribute("movieList"); %>
    <% if(request.getAttribute("movieList") == null){ %>
    <% results = mngMov.getAllMovies(); }%>
	<% request.setAttribute("movieList", results); %>    
	<% if(results != null){ %>
	<% if(results.size() == 0){ %>
	<div class="row">
		<p>Sorry, your search did not yield any results.</p>
	</div>
	<% } else{
		for(Movie m : results){
	%>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="MovieListingPage.jsp"><img class="card-img-top" src= <%= m.getLink() %> alt="" ></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="MovieListingPage?param=<%=m.getID()%>"><%= m.getTitle() %></a>
            </h4>
            <p class="card-text"><%= m.getDescriptionStart() %></p>
          </div>
        </div>
      </div>
    <% }
	}
	} %>
    <!-- /.row -->

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
