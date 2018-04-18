<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Order Confirmation</title>

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
    <h1 class="my-4">Ticketeer
      <small>Order Confirmation</small>
    </h1>
    <p>Thank you, James! Your order has been confirmed.</p>
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
            <td>2839 Peachtree St<br>Atlanta, GA 30043-4859<br>United States</td>
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
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <p><b>Movie Title </b>show time, auditorium, seat number, age group</p>
            </td>
            <td>$6</td>
          </tr>
          <tr>
            <td>
              <p><b>Movie Title </b>show time, auditorium, seat number, age group</p>
            </td>
            <td>$6</td>
          </tr>
          <tr>
            <td>
              <p><b>Movie Title </b>show time, auditorium, seat number, age group</p>
            </td>
            <td>$6</td>
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
      <div class="form-group">
        <a class="btn" href="#">Back to Browse</a>
      </div>
    </div>
  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>