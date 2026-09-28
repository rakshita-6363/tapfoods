<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
  
<%@ page import="java.util.List,com.tap.model.Menu,com.tap.model.User,com.tap.model.Restaurant" %>
    
    
    <!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub - Menu</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial, Helvetica, sans-serif;
}

body{
background:#f5f5f5;
}

/* ---------------- NAVBAR ---------------- */

nav{
background:white;
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 60px;
box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.logo{
font-size:30px;
font-weight:bold;
color:#ff6b00;
}

.nav-links a{
text-decoration:none;
margin:0 15px;
font-weight:bold;
color:#333;
}

.nav-links a:hover{
color:#ff6b00;
}

.right-links a{
text-decoration:none;
margin-left:18px;
font-weight:bold;
color:#333;
}

.right-links a:hover{
color:#ff6b00;
}

/* ---------------- Restaurant Info ---------------- */

.restaurant-info{

width:90%;
margin:35px auto;
background:white;
border-radius:15px;
overflow:hidden;
box-shadow:0 4px 15px rgba(0,0,0,.1);

}

.restaurant-info img{

width:100%;
height:320px;
object-fit:cover;

}

.restaurant-details{

padding:25px;

}

.restaurant-details h1{

font-size:36px;
margin-bottom:10px;
color:#222;

}

.restaurant-details p{

margin:8px 0;
color:#666;
font-size:17px;

}

.rating{

color:green;
font-weight:bold;

}

/* ---------------- Menu Heading ---------------- */

.menu-heading{

width:90%;
margin:auto;
margin-top:30px;
margin-bottom:25px;

}
.restaurant-header{
    width:90%;
    margin:20px auto 35px;
    background:white;
    border-radius:15px;
    padding:25px 35px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.restaurant-header h1{
    color:#ff6b00;
    font-size:36px;
    margin-bottom:15px;
}

.restaurant-meta{
    display:flex;
    gap:30px;
    flex-wrap:wrap;
    color:#555;
    font-size:17px;
    font-weight:500;
}

.restaurant-meta span{
    display:flex;
    align-items:center;
}

.menu-heading h2{

font-size:32px;
color:#333;

}

/* ---------------- Menu Grid ---------------- */

.container{

width:90%;
margin:auto;
display:grid;
grid-template-columns:repeat(3,1fr);
gap:30px;
margin-bottom:50px;

}

/* ---------------- Menu Card ---------------- */

.card{
    background:white;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 5px 15px rgba(0,0,0,.1);
    transition:.3s;

    display:flex;
    flex-direction:column;
    height:100%;
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
}

.details h3{

font-size:24px;
margin-bottom:10px;
color:#222;

}

.details p:first-of-type{
    min-height:60px;
}

.price{

font-size:22px;
font-weight:bold;
color:#ff6b00;

}

button{

width:100%;
margin-top:15px;
padding:12px;
border:none;
border-radius:8px;
background:#ff6b00;
color:white;
font-size:16px;
cursor:pointer;

}

button:hover{

background:#e55d00;

}
/* ---------------- SEARCH ---------------- */

.search-container{
    position:relative;
    display:inline-block;
}
.search-form{
    position:relative;
}
.search-box{
    display:none;
    position:absolute;
    top:35px;
    left:50%;
    transform:translateX(-50%);
    background:#fff;
    padding:10px;
    border-radius:12px;
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
    border:1px solid #eee;
    z-index:1000;
}

.search-box input{
    width:300px;
    padding:12px 40px 12px 15px;
    border:1px solid #ddd;
    border-radius:30px;
    outline:none;
    font-size:15px;
}

.search-box input:focus{
    border-color:#ff6b00;
    box-shadow:0 0 8px rgba(255,107,0,0.2);
}

.close-search{
    position:absolute;
    right:18px;          /* Increased from 12px */
    top:50%;
    transform:translateY(-35%);
    width:24px;
    height:24px;
    border:none;
    background:none;
    font-size:18px;      /* Slightly smaller */
    color:#888;
    cursor:pointer;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:0;
    line-height:1;
}

.close-search:hover{
    color:#ff6b00;
}

/* ---------------- NO FOOD ITEMS ---------------- */

.no-restaurant{
    width:100%;
    grid-column:1/-1;

    min-height:70vh;

    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;

    text-align:center;
    padding:20px;
}


.no-restaurant h2{
    color:#ff6b00;
    font-size:32px;
    margin-bottom:10px;
}

.no-restaurant p{
    color:#666;
    font-size:18px;
}


.back-btn{
    display:inline-block;
    margin-top:25px;
    padding:12px 25px;
    background:#ff6b00;
    color:white;
    text-decoration:none;
    border-radius:8px;
    font-weight:bold;
    transition:.3s;
}

.back-btn:hover{
    background:#e55d00;
}




/* ---------------- Footer ---------------- */

footer{

background:#222;
color:white;
text-align:center;
padding:20px;
margin-top:30px;

}

/* ---------------- Responsive ---------------- */

@media(max-width:992px){

.container{

grid-template-columns:repeat(2,1fr);

}

}

@media(max-width:650px){

.container{

grid-template-columns:1fr;

}

nav{

flex-direction:column;
gap:15px;

}

}

</style>

</head>

<body>

<%
User loggedInUser = (User)session.getAttribute("user");
%>


<nav>

<div class="logo">
FoodHub
</div>

<div class="nav-links">

<a href="home.html">Home</a>
<a href="restaurant">Restaurants</a>

<div class="search-container">

    <a href="#" id="searchLink">Search</a>

    <div class="search-box" id="searchBox">

        <form action="menu" method="get" class="search-form">

    <input type="hidden"
           name="restaurantId"
           value="<%= request.getParameter("restaurantId") %>">

            <input
                type="text"
                name="keyword"
                placeholder="Search food..."
                required>

            <span class="close-search" id="closeSearch">&times;</span>

        </form>

    </div>

</div>

</div>

<div class="right-links">

<%
if(loggedInUser == null)
{
%>

    <a href="login.jsp">Sign In</a>
    <a href="register.html">Sign Up</a>
    <a href="cartServlet">Cart 🛒</a>
    <a href="profile">Profile 👤</a>

<%
}
else
{
%>

    <a href="cartServlet">Cart 🛒</a>
    <a href="profile">👤 <%= loggedInUser.getUserName() %></a>
    <a href="logout.jsp">Logout</a>

<%
}
%>

</div>


</nav>



<!-- Restaurant Details -->
<!--  
<div class="restaurant-info">

<img src="images/pizza.jpg">

<div class="restaurant-details">

<h1>Pizza Palace</h1>

<p>🍽️ Italian, Pizza, Fast Food</p>

<p class="rating">⭐ 4.6</p>

<p>Freshly baked pizzas, burgers, pasta and delicious desserts served with love.</p>

<p>📍 MG Road, Bangalore</p>

</div>

</div>

-->


<!-- Menu -->

<div class="menu-heading">

<h2>Our Menu</h2>

</div>
<%
Restaurant restaurant = (Restaurant)session.getAttribute("restaurant");
%>

<div class="restaurant-header">

    <h1><%= restaurant.getName() %></h1>

    <div class="restaurant-meta">
        <span>🍽️ <%= restaurant.getCuisineType() %></span>
        <span>⭐ <%= restaurant.getRating() %></span>
        <span>⏱️ <%= restaurant.getDeliveryTime() %> mins</span>
    </div>

</div>



<div class="container">

<%
List<Menu> allMenu=(List<Menu>)request.getAttribute("allMenu");
if(allMenu == null || allMenu.isEmpty())
{
%>
	
	
<div class="no-restaurant">

    <h2>No Food Items Found 😔</h2>

    <p>Try searching with a different food name.</p>

    <a href="menu?restaurantId=<%= request.getParameter("restaurantId") %>" class="back-btn">
        ← Back to Menu
    </a>

</div>

	
	<%
	}
	else
	{

for(Menu menu:allMenu)
{
	%>
	
<!-- Item 1 -->

<div class="card">

<img src="<%= menu.getImagePath() %>" alt="">

<div class="details">

<h3><%= menu.getItemName() %></h3>

<p><%= menu.getDescription() %></p>



<p class="price"><%= menu.getPrice() %></p>

<form action="cartServlet"method= "post">
<input type=hidden name=menuId value=<%= menu.getMenuId() %>>
<input type=hidden name=restaurantId value=<%= menu.getRestaurantId() %>>
<input type=hidden name=qty value=1>
<input type=hidden name=action value=add>
<!--<input type=submit value="Add to Cart">  -->
<button>Add to Cart</button>




</form>


</div>

</div>
<%	
}

}


%>







</div>

</div>

<footer>

© 2026 FoodHub | Fresh Food Delivered

</footer>

<script>

const searchLink = document.getElementById("searchLink");
const searchBox = document.getElementById("searchBox");
const closeSearch = document.getElementById("closeSearch");

searchLink.addEventListener("click", function(e){

    e.preventDefault();

    if(searchBox.style.display==="block")
    {
        searchBox.style.display="none";
    }
    else
    {
        searchBox.style.display="block";
        searchBox.querySelector("input").focus();
    }

});

document.addEventListener("click", function(e){

    if(!searchBox.contains(e.target) && e.target!==searchLink)
    {
        searchBox.style.display="none";
    }

});

closeSearch.addEventListener("click", function(){

    searchBox.style.display="none";

});

</script>




</body>

</html>