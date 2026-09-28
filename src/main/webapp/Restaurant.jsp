<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<%@ page import="java.util.List,com.tap.model.Restaurant,com.tap.model.User" %>
	    
    
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
    top:60%;
    transform:translateY(-1%);
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



.close-search{
    position:absolute;
    top:8px;
    right:12px;
    font-size:22px;
    color:#777;
    cursor:pointer;
    font-weight:bold;
    transition:.3s;
}

.close-search:hover{
    color:#ff6b00;
}



/* ---------------- NO RESTAURANTS ---------------- */

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
	
	<%
	User loggedInUser = (User) session.getAttribute("user");
	%>
	

<nav>

<div class="logo">FoodHub</div>

<div class="nav-links">
<a href="home.html">Home</a>
<a href="restaurant">Restaurants</a>

<div class="search-container">

    <a href="#" id="searchLink">Search</a>

    <div class="search-box" id="searchBox">

        <form action="restaurant" method="get" class="search-form">

            <input type="text"
                   name="keyword"
                   placeholder="Search restaurant or food..."
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

<div class="heading">
<h1>Popular Restaurants</h1>
<p>Discover delicious food from the best restaurants near you.</p>
</div>

<div class="container">


	<%
	List<Restaurant> allRestaurant = (List<Restaurant>)request.getAttribute("allRestaurant");

	if(allRestaurant == null || allRestaurant.isEmpty())
	{
	%>
	<div class="no-restaurant">

	    <h2>No Restaurants Found 😔</h2>

	    <p>Try searching with a different restaurant or food name.</p>

	    <a href="restaurant" class="back-btn">
	        ← Back to Restaurants
	    </a>
		

	</div>
	

	<%
	}
	else
	{
	    for(Restaurant restaurant : allRestaurant)
	    {
	%>

	    <!-- Restaurant 1 -->
	    <div class="card">
	        <img src="<%= restaurant.getImagePath() %>" alt="">
	        <div class="details">
	            <h2><%= restaurant.getName() %></h2>
	            <p>🍽️ <%= restaurant.getCuisineType() %></p>
	            <p class="rating">⭐ <%= restaurant.getRating() %></p>
	            <p>⏱️ <%= restaurant.getDeliveryTime() %> mins</p>
	            <p>📍 <%= restaurant.getAddress() %></p>

	            <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>" class="view-btn">
	                View Details
	            </a>
	        </div>
	    </div>
	 
	 
	 



	<%
	    }
	}
	%>
	

</div>

<footer>
© 2026 FoodHub | Delicious Food Delivered to Your Doorstep
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


document.addEventListener("click", function(e)
{

    if(!searchBox.contains(e.target) && e.target!==searchLink)
    {
        searchBox.style.display="none";
    }

});
closeSearch.addEventListener("click", function(){

    searchBox.style.display = "none";

});

</script>

</body>
</html>
