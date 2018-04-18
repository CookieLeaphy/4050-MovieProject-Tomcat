<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shopping Cart</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/1-col-portfolio.css" rel="stylesheet">

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

    <!-- Page Heading -->
    <h1 class="my-4">Ticketeer <small>My Cart</small></h1>

    <form>
      <!-- Project One -->
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
                <button type=button class="btn" id="delete0">Remove</button>
              </td>
            </tr>
            <tr>
              <td>
                <p><b>Movie Title </b>show time, auditorium, seat number, age group</p>
              </td>
              <td>$6</td>
              <td>
                <button type=button class="btn" id="delete1">Remove</button>
              </td>
            </tr>
            <tr>
              <td>
                <p><b>Movie Title </b>show time, auditorium, seat number, age group</p>
              </td>
              <td>$6</td>
              <td>
                <button type=button class="btn" id="delete2">Remove</button>
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
              <td>$19.00</td>
            </tr>
            <tr>
              <td>Tax</td>
              <td></td>
              <td>+$1.00</td>
            </tr>
            <tr>
              <td>Promo Code:EXAMPLECODE</td>
              <td>(-10%)</td>
              <td>-$2.00</td>
            </tr>
            <tr>
              <td><b>Order Total</b></td>
              <td></td>
              <td><b>$18.00</b></td>
            </tr>
          </tbody>
        </table>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Two -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <label for="promoCode">Promo Code</label>
          <input type="text" class="input" id="promoCode">
          <button type="button" class="btn btn-secondary">Apply</button>
        </div>
      </div>
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <br>
          <a class="btn" href="#">Continue Shopping</a>
          <button type="submit" class="btn btn-primary">Checkout</button>
        </div>
      </div>

      <hr>
      <!-- /.row -->

    </form>

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