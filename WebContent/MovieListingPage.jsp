<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, entity.Movie" %>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Black Panther</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!--script src="//code.jquery.com/jquery-1.11.1.min.js"></script-->
  <!-- Custom styles for this template -->
  <link href="css/portfolio-item.css" rel="stylesheet">

</head>

<body>
<% Movie m = (Movie) request.getAttribute("movie"); %>
<%  %>
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
    <h1 class="my-4">Ticketeer <small>Black Panther</small>
    </h1>

    <!-- Portfolio Item Row -->
    <div class="row">
      <div class="col-md-3">
        <img class="img-fluid" src=<%= m.getLink() %> alt="">
        <h3 class="my-3">Buy Tickets</h3>
        <form action = "PurchaseTicket" method ="get">
          <div class="form-group">
            <label for="screeningDate">Please select a date.</label>
            <input type="date" type="form-control" name="screeningDate">
          </div>
          <div class="form-group">
          <!-- TODO - get list of showing and open seats from Movie m -->
            <label for="screeningTime">Screening</label>
            <select id="screeningTime" class="form-control" name = "screeningTime">
              <option disabled selected value></option>
<!--              <option>5:30</option>-->
<!--              <option>6:00</option>-->
<!--              <option>6:30</option>-->
<!--              <option>7:00</option>-->
<!--              <option>7:30</option>-->
<!--              <option>8:00</option>-->
<!--              <option>8:30</option>-->
              <option value = "9:00">9:00</option>
              <option value = "9:30">9:30</option>
              <option value = "10:00">10:00</option>
              <option value = "10:30">10:30</option>
            </select>
          </div>
          <div class="form-group">
            <p>Auditorium C</p>
            <table>
              <tr>
                <th></th>
                <th>0</th>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
                <th>5</th>
                <th>6</th>
                <th>7</th>
                <th>8</th>
                <th>9</th>
              </tr>
              <tr>
                <th>F</th>
                <td><input type="checkbox" name="seatSelect" value="F0"></td>
                <td><input type="checkbox" name="seatSelect" value="F1"></td>
                <td><input type="checkbox" name="seatSelect" value="F2"></td>
                <td><input type="checkbox" name="seatSelect" value="F3"></td>
                <td><input type="checkbox" name="seatSelect" value="F4"></td>
                <td><input type="checkbox" name="seatSelect" value="F5"></td>
                <td><input type="checkbox" name="seatSelect" value="F6"></td>
                <td><input type="checkbox" name="seatSelect" value="F7"></td>
                <td><input type="checkbox" name="seatSelect" value="F8"></td>
                <td><input type="checkbox" name="seatSelect" value="F9"></td>
              </tr>
              <tr>
                <th>E</th>
                <td><input type="checkbox" name="seatSelect" value="E0"></td>
                <td><input type="checkbox" name="seatSelect" value="E1"></td>
                <td><input type="checkbox" name="seatSelect" value="E2"></td>
                <td><input type="checkbox" name="seatSelect" value="E3"></td>
                <td><input type="checkbox" name="seatSelect" value="E4"></td>
                <td><input type="checkbox" name="seatSelect" value="E5"></td>
                <td><input type="checkbox" name="seatSelect" value="E6"></td>
                <td><input type="checkbox" name="seatSelect" value="E7"></td>
                <td><input type="checkbox" name="seatSelect" value="E8"></td>
                <td><input type="checkbox" name="seatSelect" value="E9"></td>
              </tr>
              <tr>
                <th>D</th>
                <td><input type="checkbox" name="seatSelect" value="D0"></td>
                <td><input type="checkbox" name="seatSelect" value="D1"></td>
                <td><input type="checkbox" name="seatSelect" value="D2"></td>
                <td><input type="checkbox" name="seatSelect" value="D3"></td>
                <td><input type="checkbox" name="seatSelect" value="D4"></td>
                <td><input type="checkbox" name="seatSelect" value="D5"></td>
                <td><input type="checkbox" name="seatSelect" value="D6"></td>
                <td><input type="checkbox" name="seatSelect" value="D7"></td>
                <td><input type="checkbox" name="seatSelect" value="D8"></td>
                <td><input type="checkbox" name="seatSelect" value="D9"></td>
              </tr>
              <tr>
                <th>C</th>
                <td><input type="checkbox" name="seatSelect" value="C0"></td>
                <td><input type="checkbox" name="seatSelect" value="C1"></td>
                <td><input type="checkbox" name="seatSelect" value="C2"></td>
                <td><input type="checkbox" name="seatSelect" value="C3"></td>
                <td><input type="checkbox" name="seatSelect" value="C4"></td>
                <td><input type="checkbox" name="seatSelect" value="C5"></td>
                <td><input type="checkbox" name="seatSelect" value="C6"></td>
                <td><input type="checkbox" name="seatSelect" value="C7"></td>
                <td><input type="checkbox" name="seatSelect" value="C8"></td>
                <td><input type="checkbox" name="seatSelect" value="C9"></td>
              </tr>
              <tr>
                <th>B</th>
                <td><input type="checkbox" name="seatSelect" value="B0"></td>
                <td><input type="checkbox" name="seatSelect" value="B1"></td>
                <td><input type="checkbox" name="seatSelect" value="B2"></td>
                <td><input type="checkbox" name="seatSelect" value="B3"></td>
                <td><input type="checkbox" name="seatSelect" value="B4"></td>
                <td><input type="checkbox" name="seatSelect" value="B5"></td>
                <td><input type="checkbox" name="seatSelect" value="B6"></td>
                <td><input type="checkbox" name="seatSelect" value="B7"></td>
                <td><input type="checkbox" name="seatSelect" value="B8"></td>
                <td><input type="checkbox" name="seatSelect" value="B9"></td>
              </tr>
              <tr>
                <th>A</th>
                <td><input type="checkbox" name="seatSelect" value="A0"></td>
                <td><input type="checkbox" name="seatSelect" value="A1"></td>
                <td><input type="checkbox" name="seatSelect" value="A2"></td>
                <td><input type="checkbox" name="seatSelect" value="A3"></td>
                <td><input type="checkbox" name="seatSelect" value="A4"></td>
                <td><input type="checkbox" name="seatSelect" value="A5"></td>
                <td><input type="checkbox" name="seatSelect" value="A6"></td>
                <td><input type="checkbox" name="seatSelect" value="A7"></td>
                <td><input type="checkbox" name="seatSelect" value="A8"></td>
                <td><input type="checkbox" name="seatSelect" value="A9"></td>
              </tr>
            </table>
          </div>
          <div class="form-group">
            <label for="ticketType">Ticket type</label>
            <select id="ticketType" class="form-control" name = "ticketType">
              <option disabled selected value></option>
              <option value = "6">Child - $6</option>
              <option value = "9">Adult - $9</option>
              <option value = "7">Senior - $7</option>
            </select>
          </div>

<%

//If user settings should be redirected or exist
if((session.getAttribute("connected") == null) || !((String) session.getAttribute("connected")).equals("true")){
  //Prevent from posting anything
%>

          <!-- session is NOT connected -->
          <div class="form-group">
                <label for="email">Email address</label>
                <input type="text" class="form-control" id="forms" name = "email">
              </div>
          <div class="form-group">
                <label for="ccno">Credit card number </label>
                <input type="text" class="form-control" id="forms" name = "ccno">
              </div>
              <div class="form-group">
                <label for="ccType">Credit card type </label>
                <select id="ccType" class="form-control" id ="forms" name = "ccType">
                  <option>American Express</option>
                  <option>Visa</option>
                  <option>Mastercard</option>
                  <option>Discover Card</option>
                </select>
              </div>
              <div class="form-group">
                <label for="expMonth">Exp. month</label>
                <select id="expMonth" class="form-control" id = "forms" name = "expMonth">
                  <option disabled selected value></option>
                  <%for (int i = 1; i < 13; i++){%>
                  <option><%=i%></option>
                  <%}%> 
                </select>
                <label for="expYear">Exp. year</label>
                <select id="expYear" class="form-control" id = "forms" name = "expYear">
                  <option disabled selected value></option>
                  <%for (int i = 2018; i < 2035; i++){%>
                  <option><%=i%></option>
                  <%}%> 
                  
                </select>
              </div>
            <!-- Display these fields-->
<% }%>

          <div class="form-group">
            <button type="submit" class="btn btn-primary">Purchase Tickets</button>
          </div>
        </form>
      </div>

      <div class="col-md-8">
        <h3 class="my-3">Summary</h3>
        <!-- TODO - get summary from Movie m -->
        <p>After the death of his father, T'Challa returns home to the African nation of Wakanda to take his rightful place as king. When a powerful enemy suddenly reappears, T'Challa's mettle as king -- and as Black Panther -- gets tested when he's drawn into a conflict that puts the fate of Wakanda and the entire world at risk. Faced with treachery and danger, the young king must rally his allies and release the full power of Black Panther to defeat his foes and secure the safety of his people.</p>
        <h3 class="my-3">Details</h3>
        <ul>
          <li><b>Release date: </b>3/9/2017</li> <!-- TODO - get release date from Movie m -->
          <li><b>Rating: </b><%= m.getRating() %></li>
          <li><b>Genre: </b><%= m.getGenre() %></li>
          <li><b>Director: </b><%= m.getDirector() %></li>
          <li><b>Producer: </b><%= m.getProducer() %></li>
          <!--<li><b>Cast: </b>James Earwig, Frederick Langley, James Mao, Ubuntu Gnarls</li>-->
           <!-- TODO - get cast list from Movie m -->
        </ul>
        <h3 class="my-3">Trailer</h3>
        <div class="embed-responsive embed-responsive-16by9">
          <iframe class="embed-responsive-item" src=<%= m.getTrailor() %> allowfullscreen></iframe>
        </div>
      </div>
    </div>
    <div class="row">
      <!--<div class="col">
      <!-- TODO - get reviews from Movie m -->
        <!--<h3 class="md-8">Reviews</h3>
        <table class="table table-responsive table-scrollable">
          <thead>
            <tr>
              <th>Username</th>
              <th>Score</th>
              <th>Review</th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td>Roger Ebert</td>
              <td>1/4 Stars</td>
              <td>This movie not a good movie. No, I do not like...</td>
              <td>
                <a class="btn" href="#">View Full</a>
              </td>
            </tr>
            <tr>
              <td>sampleboi</td>
              <td>3/4 Stars</td>
              <td>I will say this movie was a decent movie. I...</td>
              <td>
                <a class="btn" href="#">View Full</a>
              </td>
            </tr>
            <tr>
              <td>big_jimbo</td>
              <td>4/4 Stars</td>
              <td>good movie yes i like this movie oh yeah the black...</td>
              <td>
                <a class="btn" href="#">View Full</a>
              </td>
            </tr>
          </tbody>
        </table>
        <form>
          <div class="form-group">
            <label for="newReview">Write a review</label>
            <textarea class="form-control" rows="5" id="newReview"></textarea>
            <label for="rating">Rating</label>
            <select id="rating" class="form-control">
              <option disabled selected value></option>
              <option>1 Stars</option>
              <option>2 Stars</option>
              <option>3 Stars</option>
              <option>4 Stars</option>
              <option>5 Stars</option>
            </select>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary" onClick="submitMovieReview">Submit Review</button>
          </div>
        </form>
      </div>    -->
    </div>

    <!-- /.row -->

    <!-- Related Projects Row -->
    <h3 class="my-4"></h3>
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
