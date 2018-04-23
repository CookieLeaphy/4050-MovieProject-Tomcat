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
if((session.getAttribute("connected") == null) || !((String) session.getAttribute("connected")).equals("true")){
//String redirectURL = "/path/ToYour/login.jsp;
    response.sendRedirect("Login-CreateNewAccount.jsp");
%>

            <h3 class="nav-link" href="Login-CreateNewAccount.html">Login/Create an account
              <span class="sr-only">(current)</span>
            <h3/> 

<% } else{ %>

            <a class="nav-item" href="Settings.jsp">Hello, <%= session.getAttribute("user") %>!
              <span class="sr-only">(current)</span>
            </a>

<% } %>

          </li>
          <li class="nav-item active">
            <a class="nav-link" href="Settings.jsp">Settings</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Cart.jsp">Cart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Search.jsp">Search</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LogoutConfirmation.jsp">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <!-- Portfolio Item Heading -->
    <h1 class="my-4">Ticketeer <small><%= m.getTitle() %></small>
    </h1>

    <!-- Portfolio Item Row -->
    <div class="row">
      <div class="col-md-3">
        <img class="img-fluid" src="http://t1.gstatic.com/images?q=tbn:ANd9GcQPpcKQ9eWZGxJe6eXyCW91eayLVm4KqruvJz3GP0F2T2w46yKZ" alt="">
        <h3 class="my-3">Buy Tickets</h3>
        <form>
          <div class="form-group">
            <label for="screeningDate">Please select a date.</label>
            <input type="date" type="form-control" name="screeningDate">
          </div>
          <div class="form-group">
          <!-- TODO - get list of showing and open seats from Movie m -->
            <label for="screeningTime">Screening</label>
            <select id="screeningTime" class="form-control">
              <option disabled selected value></option>
              <option>5:30</option>
              <option>6:00</option>
              <option>6:30</option>
              <option>7:00</option>
              <option>7:30</option>
              <option>8:00</option>
              <option>8:30</option>
              <option>9:00</option>
              <option>9:30</option>
              <option>10:00</option>
              <option>10:30</option>
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
                <td><input type="radio" name="seatSelect" value="F0"></td>
                <td><input type="radio" name="seatSelect" value="F1"></td>
                <td><input type="radio" name="seatSelect" value="F2"></td>
                <td><input type="radio" name="seatSelect" value="F3"></td>
                <td><input type="radio" name="seatSelect" value="F4"></td>
                <td><input type="radio" name="seatSelect" value="F5"></td>
                <td><input type="radio" name="seatSelect" value="F6"></td>
                <td><input type="radio" name="seatSelect" value="F7"></td>
                <td><input type="radio" name="seatSelect" value="F8"></td>
                <td><input type="radio" name="seatSelect" value="F9"></td>
              </tr>
              <tr>
                <th>E</th>
                <td><input type="radio" name="seatSelect" value="E0"></td>
                <td><input type="radio" name="seatSelect" value="E1"></td>
                <td><input type="radio" name="seatSelect" value="E2"></td>
                <td><input type="radio" name="seatSelect" value="E3"></td>
                <td><input type="radio" name="seatSelect" value="E4"></td>
                <td><input type="radio" name="seatSelect" value="E5"></td>
                <td><input type="radio" name="seatSelect" value="E6"></td>
                <td><input type="radio" name="seatSelect" value="E7"></td>
                <td><input type="radio" name="seatSelect" value="E8"></td>
                <td><input type="radio" name="seatSelect" value="E9"></td>
              </tr>
              <tr>
                <th>D</th>
                <td><input type="radio" name="seatSelect" value="D0"></td>
                <td><input type="radio" name="seatSelect" value="D1"></td>
                <td><input type="radio" name="seatSelect" value="D2"></td>
                <td><input type="radio" name="seatSelect" value="D3"></td>
                <td><input type="radio" name="seatSelect" value="D4"></td>
                <td><input type="radio" name="seatSelect" value="D5"></td>
                <td><input type="radio" name="seatSelect" value="D6"></td>
                <td><input type="radio" name="seatSelect" value="D7"></td>
                <td><input type="radio" name="seatSelect" value="D8"></td>
                <td><input type="radio" name="seatSelect" value="D9"></td>
              </tr>
              <tr>
                <th>C</th>
                <td><input type="radio" name="seatSelect" value="C0"></td>
                <td><input type="radio" name="seatSelect" value="C1"></td>
                <td><input type="radio" name="seatSelect" value="C2"></td>
                <td><input type="radio" name="seatSelect" value="C3"></td>
                <td><input type="radio" name="seatSelect" value="C4"></td>
                <td><input type="radio" name="seatSelect" value="C5"></td>
                <td><input type="radio" name="seatSelect" value="C6"></td>
                <td><input type="radio" name="seatSelect" value="C7"></td>
                <td><input type="radio" name="seatSelect" value="C8"></td>
                <td><input type="radio" name="seatSelect" value="C9"></td>
              </tr>
              <tr>
                <th>B</th>
                <td><input type="radio" name="seatSelect" value="B0"></td>
                <td><input type="radio" name="seatSelect" value="B1"></td>
                <td><input type="radio" name="seatSelect" value="B2"></td>
                <td><input type="radio" name="seatSelect" value="B3"></td>
                <td><input type="radio" name="seatSelect" value="B4"></td>
                <td><input type="radio" name="seatSelect" value="B5"></td>
                <td><input type="radio" name="seatSelect" value="B6"></td>
                <td><input type="radio" name="seatSelect" value="B7"></td>
                <td><input type="radio" name="seatSelect" value="B8"></td>
                <td><input type="radio" name="seatSelect" value="B9"></td>
              </tr>
              <tr>
                <th>A</th>
                <td><input type="radio" name="seatSelect" value="A0"></td>
                <td><input type="radio" name="seatSelect" value="A1"></td>
                <td><input type="radio" name="seatSelect" value="A2"></td>
                <td><input type="radio" name="seatSelect" value="A3"></td>
                <td><input type="radio" name="seatSelect" value="A4"></td>
                <td><input type="radio" name="seatSelect" value="A5"></td>
                <td><input type="radio" name="seatSelect" value="A6"></td>
                <td><input type="radio" name="seatSelect" value="A7"></td>
                <td><input type="radio" name="seatSelect" value="A8"></td>
                <td><input type="radio" name="seatSelect" value="A9"></td>
              </tr>
            </table>
          </div>
          <div class="form-group">
            <label for="ticketType">Ticket type</label>
            <select id="ticketType" class="form-control">
              <option disabled selected value></option>
              <option>Child - $6</option>
              <option>Adult - $9</option>
              <option>Senior - $7</option>
            </select>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary" onClick=addTicketToCart()>Add to Cart</button>
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
          <li><b>Producer: </b><%= m.getProducer() %>></li>
          <li><b>Cast: </b>James Earwig, Frederick Langley, James Mao, Ubuntu Gnarls</li> <!-- TODO - get cast list from Movie m -->
        </ul>
        <h3 class="my-3">Trailer</h3>
        <div class="embed-responsive embed-responsive-16by9">
          <iframe class="embed-responsive-item" src=<%= m.getTrailor() %> allowfullscreen="true"></iframe>
        </div>
      </div>
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
