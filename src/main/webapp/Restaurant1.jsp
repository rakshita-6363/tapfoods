<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <%@ page import = "java.util.List , com.tap.model.Restaurant" %>
    
    
    <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodHub - Restaurants</title>

<style>

a{
text-decoration:none;
color:inherit;
outline:none;
}

a:visited{
color:inherit;
}

a:focus{
outline:none;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f4f4f4;
}

/* ---------------- NAVBAR ---------------- */

nav{
    background:#ffffff;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 60px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.logo{
    font-size:30px;
    font-weight:bold;
    color:#ff6b00;
}

.nav-links a{
    text-decoration:none;
    color:#333;
    margin:0 15px;
    font-weight:bold;
}

.nav-links a:hover{
    color:#ff6b00;
}

.right-links a{
    text-decoration:none;
    margin-left:18px;
    color:#333;
    font-weight:bold;
}

.right-links a:hover{
    color:#ff6b00;
}

/* ---------------- HEADING ---------------- */

.heading{
    text-align:center;
    margin:40px 0;
}

.heading h1{
    color:#333;
    font-size:38px;
}

.heading p{
    color:#666;
    margin-top:10px;
}

/* ---------------- GRID ---------------- */

.container{
    width:90%;
    margin:auto;
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:30px;
    margin-bottom:50px;
}

/* ---------------- CARD ---------------- */

.card{
    background:white;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
    transition:.3s;
    display:flex;
    flex-direction:column;
}

.card:hover{
    transform:translateY(-8px);
}

.card img{
    width:100%;
    aspect-ratio: 3/2;   /* or 4/3 */
    height:auto;
    object-fit:cover;
}

.details{
    padding:18px;
    display:flex;
    flex-direction:column;
    flex:1;
    min-height:230px;
}

.details h2{
    color:#222;
    margin-bottom:10px;
}

.details p{
    color:#666;
    margin:6px 0;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}

.rating{
    color:green;
    font-weight:bold;
}

button{
    margin-top:15px;
    width:100%;
    padding:12px;
    border:none;
    background:#ff6b00;
    color:white;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;
}

button:hover{
    background:#e65c00;
}

.view-btn{
display:inline-block;
width:100%;
text-align:center;
margin-top:auto;
padding:12px;
border-radius:8px;
background:#ff6b00;
color:white;
font-size:16px;
font-weight:bold;
cursor:pointer;
}

.view-btn:hover{
background:#e55d00;
}

/* ---------------- FOOTER ---------------- */

footer{
    background:#222;
    color:white;
    text-align:center;
    padding:20px;
}

</style>

</head>

<body>

<nav>

<div class="logo">FoodHub</div>

<div class="nav-links">
<a href="home.html">Home</a>
<a href="restaurant">Restaurants</a>
<a href="#">Offers</a>
<a href="#">Search</a>
</div>

<div class="right-links">
<a href="login.html">Sign In</a>
<a href="register.html">Sign Up</a>
<a href="cartServlet">Cart 🛒</a>
<a href="profile">Profile 👤</a>
</div>

</nav>

<div class="heading">
<h1>Popular Restaurants</h1>
<p>Discover delicious food from the best restaurants near you.</p>
</div>

<div class="container">


<%
List<Restaurant> allRestaurant=(List<Restaurant>)request.getAttribute("allRestaurant");
for (Restaurant restaurant : allRestaurant) 
{
	%>
	<!-- Restaurant 1 -->
	<div class="card">
	<img src="<%= restaurant.getImagePath() %>" alt="">
	<div class="details">
	<h2> <%= restaurant.getName() %> </h2>
	<p>🍽️ <%= restaurant.getCuisineType() %></p>
	<p class="rating">⭐ <%= restaurant.getRating() %></p>
	<p>⏱️ <%= restaurant.getDeliveryTime()  %> mins</p>
	<p>📍 <%= restaurant.getAddress() %></p>
	
	<a href="menu?restaurantId=<%=restaurant.getRestaurantId()  %>" class="view-btn">View Details</a>
	</div>
	</div>

<%	
}
%>

</div>

<footer>
© 2026 FoodHub | Delicious Food Delivered to Your Doorstep
</footer>

</body>
</html>
