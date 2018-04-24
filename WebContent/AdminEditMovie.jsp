<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, entity.Movie" %>
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
  <div class="container">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4">Ticketeer
      <small>Edit Movie Listing</small>
    </h1>

<% if(request.getAttribute("created").equals("true")){
	Movie m = (Movie) request.getAttribute("movie");
%>

    <!-- Portfolio Item Row -->
    <div class="row">
      <div class="col">
        <h3 class="mt-5">Manage Movie</h3>
        <form action="ChangeMovie" method="get">
          <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" name="title" value=<%= m.getTitle() %>>
          </div>
          <div class="form-group">
            <label for="release">Release date</label>
            <input type="date" class="form-control" name="release" value=<%= m.getReleaseDate() %>>
          </div>
          <div class="form-group">
            <label for="poster">Poster</label>
            <input type="text" class="form-control" name="poster" value=<%= m.getLink() %>>
          </div>
          <div class="form-group">
            <label for="trailor">Trailor</label>
            <input type="text" class="form-control" name="trailor" value=<%= m.getTrailor() %>>
          </div>
          <div class="form-group">
            <label for="description">Description</label>
            <input type="text" class="form-control text" name="description" value=<%= m.getDescription() %>>
          </div>
          <div class="form-group">
            <label for="rating">Rating</label>
            <select class="form-control" name="rating">
              <option value="G"<%if(m.getRating().equals("G")){%> selected<%}%>>G</option>
              <option value="PG"<%if(m.getRating().equals("PG")){%> selected<%}%>>PG</option>
              <option value="PG-13"<%if(m.getRating().equals("PG-13")){%> selected<%}%>>PG-13</option>
              <option value="R"<%if(m.getRating().equals("R")){%> selected<%}%>>R</option>
              <option value="NC-17"<%if(m.getRating().equals("NC-17")){%> selected<%}%>>NC-17</option>
            </select>
          </div>
          <div class="form-group">
            <label for="genre">Genre</label>
            <select class="form-control" name="genre">
              <option disabled selected value=""></option>
              <option value="Horror"<%if(m.getGenre().equals("Horror")){%> selected<%}%>>Horror</option>
              <option value="Comedy"<%if(m.getGenre().equals("Comedy")){%> selected<%}%>>Comedy</option>
              <option value="Drama"<%if(m.getGenre().equals("Drama")){%> selected<%}%>>Drama</option>
              <option value="Action"<%if(m.getGenre().equals("Action")){%> selected<%}%>>Action</option>
              <option value="Romance"<%if(m.getGenre().equals("Romance")){%> selected<%}%>>Romance</option>
              <option value="Sci-Fi"<%if(m.getGenre().equals("Sci-Fi")){%> selected<%}%>>Sci-Fi</option>
              <option value="Art"<%if(m.getGenre().equals("Art")){%> selected<%}%>>Art</option>
              <option value="Documentary"<%if(m.getGenre().equals("Documentary")){%> selected<%}%>>Documentary</option>
              <option value="Performance Recording"<%if(m.getGenre().equals("Performance Recording")){%> selected<%}%>>Performance Recording</option>
            </select>
          </div>
          <div class="form-group">
            <label for="director">Director</label>
            <input type="text" class="form-control" id="director" value=<%= m.getDirector() %>>
          </div>
          <div class="form-group">
            <label for="producer">Producer</label>
            <input type="text" class="form-control" id="producer" value=<%= m.getProducer() %>>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary">Submit Changes</button>
          </div>
        </form>
        <a class="btn btn-secondary" href="MovieListingPage?param=<%=m.getID()%>">View Movie Page</a>
      </div>
      <div class="col">
        <h3 class="mt-5">Manage Showings</h3>
        <table class="table table-responsive table-scrollable">
          <thead>
            <tr>
              <th>Date</th>
              <th>Time</th>
              <th>Auditorium</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td>1/1/2000</td>
              <td>3:00</td>
              <td>C</td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteShowing()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>1/1/2000</td>
              <td>3:15</td>
              <td>D</td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteShowing()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>1/1/2000</td>
              <td>5:00</td>
              <td>C</td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteShowing()">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
        <form>
          <div class="form-group">
            <label for="showDate">Date</label>
            <input type="date" class="form-control" id="showDate">
            <label for="showTime">Time</label>
            <input type="time" class="form-control" id="showTime">
            <label for="auditorium">Auditorium</label>
            <select class="form-control" id="auditorium">
              <option disabled selected value></option>
              <option>A</option>
              <option>B</option>
              <option>C</option>
              <option>D</option>
              <option>E</option>
              <option>F</option>
              <option>G</option>
              <option>H</option>
              <option>I</option>
              <option>J</option>
              <option>K</option>
              <option>L</option>
              <option>M</option>
              <option>N</option>
            </select>
            <button type="submit" class="btn btn-primary" onClick="addShowing()">Add Showing</button>
          </div>
        </form>
        <h3 class="mt-5">Manage Reviews</h3>
        <table class="table table-responsive table-scrollable">
          <thead>
            <tr>
              <th>Username</th>
              <th>Score</th>
              <th>Review</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td>Roger Ebert</td>
              <td>4/4 Stars</td>
              <td>hey there buddy</td>
              <td>
                <a class="btn" href="#">View Full</a>
              </td>
              <td>
                <button type="submit" class="btn btn-danger" onClick="deleteReview()">Remove</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="col">

      </div>
    </div>
    <!-- /.row -->
  </div>

<% } %>
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
