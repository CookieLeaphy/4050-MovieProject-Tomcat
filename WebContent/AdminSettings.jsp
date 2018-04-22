<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin Control Hub</title>

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

<% } else if((int)session.getAttribute("userType")==1){ //Check if the user is an admin %>

            <a class="nav-item" href="AdminSettings.html">Hello, <%= session.getAttribute("user") %>!
              <span class="sr-only">(current)</span>
            </a>

<% } else { %>

            <a class="nav-item" href="Settings.jsp">Hello, <%= session.getAttribute("user") %>!
              <span class="sr-only">(current)</span>
            </a>
            
<% } %>
          </li>
<% if((int)session.getAttribute("userType")==0){ //if user is a customer%>

          <li class="nav-item active">
            <a class="nav-link" href="Settings.jsp">Settings</a>
          </li>
          
<% } else if((int) session.getAttribute("userType")==1) { //Check if admin {%>
	<li class="nav-item active">
            <a class="nav-link" href="AdminSettings.html">Settings</a>
          </li>
<% } %>
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
  <div class="container-fluid">
    <div class="row">
      <h1 class="my-4">Ticketeer
        <small>Control Hub</small>
      </h1>
    </div>
    <div class="row row-eq-height">
      <div class="col">
        <h2 class="mt-4">Promotions</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead style="display:block;">
            <tr>
              <th>Promo Code</th>
              <th>Type</th>
              <th>Amount</th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td>MERRYXMAS22</td>
              <td>%</td>
              <td>22</td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deletePromo()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>hellocode</td>
              <td>$</td>
              <td>9</td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deletePromo()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>example_promo29381</td>
              <td>$</td>
              <td>20</td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deletePromo()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>specialDISCOUNT</td>
              <td>%</td>
              <td>11</td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deletePromo()">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
        <h5>Create New Promotion</h5>
        <form>
          <div class="form-group">
            <label for="newPromoCode">Promo Code</label>
            <input type="input" class="form-control" id="newPromoCode">
            <label for="newPromoType">Type</label>
            <input type="input" class="form-control" id="newPromoType">
            <label for="newPromoAmount">Amount</label>
            <input type="input" class="form-control" id="newPromoAmount">
            <button type="submit" class="btn btn-primary" onClick="addPromo()">Create</button>
          </div>
        </form>
      </div>
      <div class="col"> <!--style:"resize:both;"-->
        <h2 class="mt-4">Users</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead>
            <tr>
              <th>#</th>
              <th>Username</th>
              <th>Email</th>
              <th>Name</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td>0</td>
              <td>Sample12</td>
              <td>freddy1293@gmail.com</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteUser()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>1</td>
              <td>aaalpha</td>
              <td>qwert69@gmail.com</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteUser()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>davidc</td>
              <td>11auster@yahoo.com</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteUser()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td>simmerdown</td>
              <td>sd454@gmail.com</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteUser()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>4</td>
              <td>Samp8</td>
              <td>jr495@gmail.com</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteUser()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>5</td>
              <td>hello</td>
              <td>davidsanders@gmail.com</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteUser()">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
        <h5>Search User</h5>
        <form>
          <div class="form-group">
            <input type="input" class="form-control" id="user">
            <button type="submit" class="btn btn-primary" onClick="searchUser()">Search</button>
          </div>
        </form>
        <a class="btn btn-success" href="#">Create New User</a>
      </div>
    </div>
    <div class="row row-eq-height">
      <div class="col">
        <h2 class="mt-4">Movies</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead>
            <tr>
              <th>Movie</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td>Black Panther</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteMovie()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>Ladybird</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteMovie()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>Saw XVI</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteMovie()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>Mars Attacks</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteMovie()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>Spider-Man vs. X-Men</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteMovie()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>Mulan</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteMovie()">Delete</button>
              </td>
            </tr>
            <tr>
              <td>Fast and the Furious 17</td>
              <td>
                <a class="btn" href="#">Edit</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="deleteMovie()">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
        <h5>Search Movie</h5>
        <form>
          <div class="form-group">
            <input type="input" class="form-control" id="movie">
            <button type="submit" class="btn btn-primary" onClick="searchMovie()">Search</button>
          </div>
        </form>
        <a class="btn btn-success" href="#">Create New Movie</a>
      </div>

      <div class="col">
        <h2 class="mt-4">Orders</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead>
            <tr>
              <th>Order #</th>
              <th>Date</th>
              <th>User</th>
              <th>Total</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td><b>039432</b></td>
              <td>1/1/2000</td>
              <td>userEx283</td>
              <td>$19.00</td>
              <td>
                <a class="btn" href="#">View Details</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="refundOrder()">Refund</button>
              </td>
            </tr>
            <tr>
              <td><b>039433</b></td>
              <td>1/1/2000</td>
              <td>bigSpender69</td>
              <td>$382.00</td>
              <td>
                <a class="btn" href="#">View Details</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="refundOrder()">Refund</button>
              </td>
            </tr>
            <tr>
              <td><b>039434</b></td>
              <td>1/1/2000</td>
              <td>hellokitttttty</td>
              <td>$50.51</td>
              <td>
                <a class="btn" href="#">View Details</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="refundOrder()">Refund</button>
              </td>
            </tr>
            <tr>
              <td><b>039435</b></td>
              <td>1/1/2000</td>
              <td>sammyboy2</td>
              <td>$23.19</td>
              <td>
                <a class="btn" href="#">View Details</a>
              </td>
              <td>
                <button type="button" class="btn btn-danger" onClick="refundOrder()">Refund</button>
              </td>
            </tr>
          </tbody>
        </table>
        <h5>Search Order</h5>
        <form>
          <div class="form-group">
            <input type="input" class="form-control" id="order">
            <button type="submit" class="btn btn-primary" onClick="searchOrder()">Search</button>
          </div>
        </form>
      </div>
    </div>
    <div class="row row-eq-height">
      <div class="col">
        <h2 class="mt-4">Emails</h2>
        <form>
          <div class="form-group">
            <label for="title">Subject</label>
            <input type="text" class="form-control" id="subject">
          </div>
          <div class="form-group">
            <label for="heading1">Heading 1</label>
            <input type="text" class="form-control" id="heading1">
          </div>
          <div class="form-group">
            <label for="media1">Media 1</label>
            <input type="text" class="form-control" id="media1">
          </div>
          <div class="form-group">
            <label for="text1">Text 1</label>
            <textarea class="form-control" rows="5" id="text1"></textarea>
          </div>
          <div class="form-group">
            <label for="heading2">Heading 2</label>
            <input type="text" class="form-control" id="heading2">
          </div>
          <div class="form-group">
            <label for="media2">Media 2</label>
            <input type="text" class="form-control" id="media2">
          </div>
          <div class="form-group">
            <label for="text2">Text 2</label>
            <textarea class="form-control" rows="5" id="text2"></textarea>
          </div>
          <div class="form-group">
            <label for="heading3">Heading 3</label>
            <input type="text" class="form-control" id="heading3">
          </div>
          <div class="form-group">
            <label for="media3">Media 3</label>
            <input type="text" class="form-control" id="media3">
          </div>
          <div class="form-group">
            <label for="text3">Text 3</label>
            <textarea class="form-control" rows="5" id="text3"></textarea>
          </div>
          <div class="form-group">
            <label for="rating">Type</label>
            <select class="form-control" id="rating">
              <option disabled selected value></option>
              <option>News</option>
              <option>Promotion</option>
            </select>
          </div>
          <div class="form-group">
            <label for="sendDate">Send Date</label>
            <input type="date" class="form-control" id="sendDate">
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary" onClick=createPreview()>View Email Preview</button>
          </div>
        </form>
      </div>
      <div class="col">
        <h2 class="mt-4">Sales</h2>
        <table class="table table-responsive table-scrollable" height="250">
          <thead>
            <tr>
              <th>Movie</th>
              <th>Tickets Sold</th>
              <th>Proportion of Total Sales</th>
            </tr>
          </thead>
          <tbody class="table table-searchable">
            <tr>
              <td>Black Panther</td>
              <td>9,384</td>
              <td>5%</td>
            </tr>
            <tr>
              <td>Ladybird</td>
              <td>2,394</td>
              <td>1%</td>
            </tr>
            <tr>
              <td>Saw XVI</td>
              <td>3,293</td>
              <td>3%</td>
            </tr>
            <tr>
              <td>Mars Attacks</td>
              <td>20,000</td>
              <td>20%</td>
            </tr>
            <tr>
              <td>Spider-Man vs. X-Men</td>
              <td>50,034</td>
              <td>47%</td>
            </tr>
          </tbody>
        </table>
        <a class="btn btn-primary">Go to Sales Page</a>
      </div>
    </div>
  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
