<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, entity.Movie" %>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Search Movies</title>

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
if((session.getAttribute("connected") == null) || !((String) session.getAttribute("connected")).equals("true")){
//String redirectURL = "/path/ToYour/login.jsp;
//response.sendRedirect("Login-CreateNewAccount.jsp");
%>

            <h3 class="nav-link" href="Login-CreateNewAccount.html">Login/Create an account
              <span class="sr-only">(current)</span>
            </h3> 

<% } else{ %>

            <a class="nav-item" href="Settings.jsp">Hello, <%= session.getAttribute("user") %>!
              <span class="sr-only">(current)</span>
            </a>

<% } %>

          </li>
          <li class="nav-item active">
            <a class="nav-link" href="Settings.jsp">Notes</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Cart.jsp">Change</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Search.jsp">Me</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LogoutConfirmation.jsp">Later</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<!-- end of nav (This one needs to be changed (add -->


<% List<Movie> results = (List<Movie>) request.getAttribute("movieList"); %>
<% String s = (String) request.getAttribute("searchTerm"); %>
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading -->
    <h1 class="my-4">Search Movies
      <small><%= s %></small>
    </h1>
    <form action="SearchMovie" method="get">
      <div class="form-group">
        <input type="text" class="form-control" id="user" name="title">
      </div>
    </form>
    
<%
if(results != null){
if(results.size() == 0){ %>
<div class="row">
	<p>Sorry, your search did not yield any results. Please try different search terms or try browsing with the filters on the home page.</p>
</div>
<% } else{
	for(Movie m : results){
%>
    <div class="row">
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://t1.gstatic.com/images?q=tbn:ANd9GcQPpcKQ9eWZGxJe6eXyCW91eayLVm4KqruvJz3GP0F2T2w46yKZ" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#"><%= m.getTitle() %></a>
            </h4>
            <p class="card-text">
            <b>Rating: </b><%= m.getRating() %>
            <br>
            <b>Genre: </b><%= m.getDirector() %>
            <br>
            <b>Director: </b><%= m.getGenre() %></p>
            <form action="MoviePage" method="get">
				<div class="form-group">
					<input type="submit" class="form-control" id="movie" name="id" value=<%= m.getID() %>>
				</div>
    		</form>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->
<% } //For
	} //If
} //Results != null%>
    <!-- Pagination -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>

      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>

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
