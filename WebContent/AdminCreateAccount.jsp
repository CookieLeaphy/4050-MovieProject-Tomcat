<!DOCTYPE html>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Log In/Create New Account</title>

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
          <li class="nav-item">
            <a class="nav-link" href="Cart.jsp">Cart</a>
          </li>
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
    <!-- Page Heading -->
    <h1 class="my-4">Ticketeer
      <small>Create New Account</small>
    </h1>

      <div class="col-lg-6 col-md-12 col-sm-12 portfolio-item">
        <div class="card">
          <div class="card-body">
            <form>
              <div class="form-group">
                <label for="accountType">Account type</label>
                <select id="accountType" class="form-control">
                  <option disabled selected value></option>
                  <option>Admin</option>
                  <option>Employee</option>
                  <option>User</option>
                </select>
              </div>
              <h5>Personal Information</h5>
              <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username">
              </div>
              <div class="form-group">
                <label for="firstName">First name</label>
                <input type="text" class="form-control" id="firstName">
              </div>
              <div class="form-group">
                <label for="lastName">Last name</label>
                <input type="text" class="form-control" id="lastName">
              </div>
              <div class="form-group">
                <label for="phone">Phone number</label>
                <input type="text" id="phone" class="form-control">
              </div>
              <div class="form-group">
                <label for="email">Email address</label>
                <input type="text" class="form-control" id="email">
              </div>
              <div class="form-group">
                <label for="newPass0">Password</label>
                <input type="password" class="form-control" id="newPass0">
              </div>
              <div class="form-group">
                <label for="newPass1">Confirm password</label>
                <input type="password" class="form-control" id="newPass1">
              </div>
              <h5>Subscriptions</h5>
              <div class="form-check form-check-inline">
                <input type="checkbox" class="form-check-input" id="news">
                <label for="news" class="form-check-label">News</label>
              </div><br>
              <div class="form-check form-check-inline">
                <input type="checkbox" class="form-check-input" id="promotions">
                <label for="promotions" class="form-check-label">Promotions</label>
              </div><br><br>
              <h5>Billing Information</h5>
              <div class="form-group">
                <label for="address">Street address</label>
                <input type="text" class="form-control" id="address">
              </div>
              <div class="form-group">
                <label for="city">City</label>
                <input type="text" class="form-control" id="city">
              </div>
              <div class="form-group">
                <label for="stateSelect">State</label>
                <select id="stateSelect" class="form-control">
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
                <input type="text" class="form-control" id="zip">
                <label for="country">Country</label>
                <input type="text" class="form-control" id="country">
              </div>
              <div class="form-group">
                <label for="ccno">Credit card number</label>
                <input type="text" class="form-control" id="ccno">
              </div>
              <div class="form-group">
                <label for="ccType">Credit card type</label>
                <select id="ccType" class="form-control">
                  <option>American Express</option>
                  <option>Visa</option>
                  <option>Mastercard</option>
                  <option>Discover Card</option>
                </select>
              </div>
              <div class="form-group">
                <label for="expMonth">Exp. month</label>
                <select id="expMonth" class="form-control">
                  <option disabled selected value></option>
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
                <select id="expYear" class="form-control">
                  <option disabled selected value></option>
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
                <a class="btn" href="#">Return to Hub</a>
                <button type="submit" class="btn btn-primary" onClick="checkFormInputs()">Create Account</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    <!-- /.row -->

    <!-- Pagination -->


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
