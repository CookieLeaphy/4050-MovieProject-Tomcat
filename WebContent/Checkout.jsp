<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Checkout</title>

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
  <form>
    <div class="container">
      <h1 class="my-4">Ticketeer
        <small>Checkout</small>
      </h1>
      <h4>Personal Information</h4>
      <div class="form-group">
        <label for="firstName">First name</label>
        <input type="text" class="form-control" id="firstName" value="Nicholas">
      </div>
      <div class="form-group">
        <label for="lastName">Last name</label>
        <input type="text" class="form-control" id="lastName" value="Marx">
      </div>
      <div class="form-group">
        <label for="phone">Phone number</label>
        <input id="phone" class="form-control" value="(202)123-5984">
      </div>
      <div class="form-group">
        <label for="email">Email address</label>
        <input type="text" class="form-control" id="email" value="pabstdrinker44@gmail.com">
      </div>
      <h4>Billing Information</h4>
      <div class="form-group">
        <label for="address">Street address</label>
        <input type="text" class="form-control" id="address" value="1417 Carr St">
      </div>
      <div class="form-group">
        <label for="city">City</label>
        <input type="text" class="form-control" id="city" value="Athens">
      </div>
      <div class="form-group">
        <label for="stateSelect">State</label>
        <select id="stateSelect" class="form-control" value="GA">
          <option disabled selected value>--</option>
          <option>AL</option>
          <option>AK</option>
          <option>AZ</option>
          <option>AR</option>
          <option>CA</option>
          <option>CO</option>
          <option>CT</option>
          <option>DE</option>
          <option>DC</option>
          <option>FL</option>
          <option>GA</option>
          <option>HI</option>
          <option>ID</option>
          <option>IL</option>
          <option>IN</option>
          <option>IA</option>
          <option>KS</option>
          <option>KY</option>
          <option>LA</option>
          <option>ME</option>
          <option>MT</option>
          <option>NE</option>
          <option>NV</option>
          <option>NH</option>
          <option>NJ</option>
          <option>NM</option>
          <option>NY</option>
          <option>NC</option>
          <option>ND</option>
          <option>OH</option>
          <option>OK</option>
          <option>OR</option>
          <option>MD</option>
          <option>MA</option>
          <option>MI</option>
          <option>MN</option>
          <option>MS</option>
          <option>MO</option>
          <option>PA</option>
          <option>RI</option>
          <option>SC</option>
          <option>SD</option>
          <option>TN</option>
          <option>TX</option>
          <option>UT</option>
          <option>VT</option>
          <option>VA</option>
          <option>WA</option>
          <option>WV</option>
          <option>WI</option>
          <option>WY</option>
        </select>
        <label for="zip">Zip code</label>
        <input type="text" class="form-control" id="zip" value="30601">
        <label for="country">Country</label>
        <input type="text" class="form-control" id="country" value="United States">
      </div>
      <div class="form-group">
        <label for="ccno">Credit card number</label>
        <input type="text" class="form-control" id="ccno" value="XXXXXXXXXXXX2039">
      </div>
      <div class="form-group">
        <label for="ccType">Credit card type</label>
        <select id="ccType" class="form-control" value="American Express">
          <option>American Express</option>
          <option>Visa</option>
          <option>Mastercard</option>
          <option>Discover Card</option>
        </select>
      </div>
      <div class="form-group">
        <label for="expMonth">Exp. month</label>
        <select id="expMonth" class="form-control" value="01">
          <option disabled selected value>--</option>
          <option>01</option>
          <option>02</option>
          <option>03</option>
          <option>04</option>
          <option>05</option>
          <option>06</option>
          <option>07</option>
          <option>08</option>
          <option>09</option>
          <option>10</option>
          <option>11</option>
          <option>12</option>
        </select>
        <label for="expYear">Exp. year</label>
        <select id="expYear" class="form-control" value="2020">
          <option disabled selected value>----</option>
          <option>2018</option>
          <option>2019</option>
          <option>2020</option>
          <option>2021</option>
          <option>2022</option>
          <option>2023</option>
          <option>2024</option>
          <option>2025</option>
          <option>2026</option>
          <option>2027</option>
          <option>2028</option>
          <option>2029</option>
          <option>2030</option>
          <option>2031</option>
          <option>2032</option>
          <option>2033</option>
          <option>2034</option>
          <option>2035</option>
          <option>2036</option>
          <option>2037</option>
          <option>2038</option>
          <option>2039</option>
          <option>2040</option>
          <option>2041</option>
          <option>2042</option>
          <option>2043</option>
          <option>2044</option>
          <option>2045</option>
          <option>2046</option>
          <option>2047</option>
          <option>2048</option>
          <option>2049</option>
          <option>2050</option>
        </select>
      </div>
      <div class="form-group">
        <label for="cvc">CVC</label>
        <input type="text" class="form-control" id="cvc" size=4>
      </div>
    </div>
    <div class="container">
      <h2 class="mt-5">Order # <small>39483</small></h2>
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
          <a class="btn" href="#">Back to Cart</a>
          <button type="submit" class="btn btn-primary" onClick="checkFormCheckout()">Confirm Purchase</button>
        </div>
      </div>
    </div>
  </form>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
