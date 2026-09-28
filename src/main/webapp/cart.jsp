<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
  
<%@ page import = "java.util.List , com.tap.model.Cart, com.tap.model.CartItem, com.tap.model.User,com.tap.model.Restaurant" %>
    


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Cart</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f4f4f4;
}

/* Navbar */

.navbar{

    width:100%;
    height:70px;
    background:#ff6b35;

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:0 60px;
}

.logo{

    font-size:30px;
    font-weight:bold;
    color:white;

}

.nav-links{

    display:flex;
    align-items:center;
    gap:30px;

}

.nav-links a{

    text-decoration:none;
    color:white;
    font-size:18px;
    transition:.3s;

    display:flex;
    align-items:center;

}



.nav-links a:hover{

    color:black;

}

/* Main Container */

.container{

    width:90%;
    margin:40px auto;

}

.heading{

    text-align:center;
    color:#333;
    margin-bottom:35px;

}

/* Cart */

.cart-container{

    width:100%;
    background:white;

    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.2);

    overflow:hidden;

}

/* Header */

.cart-header{

    background:#ff6b35;
    color:white;

    display:flex;
    align-items:center;

    padding:18px 25px;

    font-weight:bold;
    font-size:18px;

}

.cart-header .item-name{

    flex:3;

}

.cart-header .item-price{

    flex:1;
    text-align:center;

}

.cart-header .item-quantity{

    flex:1;
    text-align:center;

}

.cart-header .item-total{

    flex:1;
    text-align:center;

}

.cart-header .item-action{

    flex:1;
    text-align:center;

}

/* Cart Item */

.cart-item{

    display:flex;
    align-items:center;

    padding:20px 25px;

    border-bottom:1px solid #ddd;

    transition:.3s;

}

.cart-item:hover{

    background:#fafafa;

}

/* Item Name */

.item-name{

    flex:3;

    font-size:17px;
    font-weight:bold;
    color:#333;

}

/* Price */

.item-price{

    flex:1;

    text-align:center;

    color:#555;
    font-size:17px;

}

/* Quantity */

.item-quantity{

    flex:1;

    display:flex;
    justify-content:center;

}

.quantity{

    display:flex;
    align-items:center;
    gap:10px;

}

.quantity button{

    width:30px;
    height:30px;

    border:none;
    border-radius:4px;

    background:#ff6b35;
    color:white;

    font-size:18px;

    cursor:pointer;

}

.quantity button:hover{

    background:#e85a2b;

}

.quantity span{

    font-size:18px;
    font-weight:bold;

}

/* Total */

.item-total{

    flex:1;

    text-align:center;

    font-size:17px;
    font-weight:bold;

    color:#28a745;

}

/* Action */

.item-action{

    flex:1;

    display:flex;
    justify-content:center;

}

.remove-btn{

    padding:8px 18px;

    border:none;
    border-radius:5px;

    background:red;
    color:white;

    cursor:pointer;

}

.remove-btn:hover{

    background:darkred;

}

/* Grand Total */

.grand-total{

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:25px;

    background:#fff8f3;

    font-size:24px;
    font-weight:bold;

}

.total-price{

    color:#ff6b35;

}

/* Buttons */

.cart-buttons{

    display:flex;
    justify-content:space-between;

    margin-top:30px;

}

.add-items button{

    padding:15px 30px;

    border:none;
    border-radius:6px;

    background:#007bff;
    color:white;

    font-size:17px;

    cursor:pointer;

}

.add-items button:hover{

    background:#0056b3;

}

.checkout button{

    padding:15px 35px;

    border:none;
    border-radius:6px;

    background:#28a745;
    color:white;

    font-size:17px;

    cursor:pointer;

}

.checkout button:hover{

    background:#218838;

}


/* Add More Button */

.add-more-btn{

    display:inline-block;
    padding:15px 30px;

    background:#007bff;
    color:white;

    text-decoration:none;
    border-radius:6px;

    font-size:17px;
    font-weight:bold;

    transition:.3s;

}

.add-more-btn:hover{

    background:#0056b3;

}

/* Proceed to Checkout Button */

.checkout-btn{

    display:inline-block;
    padding:15px 35px;

    background:#28a745;
    color:white;

    text-decoration:none;

    border-radius:6px;

    font-size:17px;
    font-weight:bold;

    transition:.3s;

}

.checkout-btn:hover{

    background:#218838;

}

/* Empty Cart */

.empty-cart{

    width:100%;
    background:white;

    padding:60px 30px;

    text-align:center;

    border-radius:10px;

    box-shadow:0 2px 10px rgba(0,0,0,.15);

}

.empty-cart h2{

    color:#ff6b35;

    font-size:32px;

    margin-bottom:15px;

}

.empty-cart p{

    color:#666;

    font-size:18px;

    margin-bottom:30px;

}

.empty-cart a{

    display:inline-block;

    padding:15px 35px;

    background:#ff6b35;

    color:white;

    text-decoration:none;

    border-radius:6px;

    font-size:17px;

    font-weight:bold;

    transition:.3s;

}

.empty-cart a:hover{

    background:#e85a2b;

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
    right:18px;
    top:50%;
    transform:translateY(-35%);
    width:24px;
    height:24px;
    border:none;
    background:none;
    font-size:18px;
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

.search-container > a{
    text-decoration:none;
    color:white;
    font-size:18px;
    transition:.3s;
}

.search-container > a:hover{
    color:black;
}
/* Responsive */

@media(max-width:900px){

.navbar{

    padding:0 20px;

}


.cart-header,
.cart-item{

    min-width:850px;

}

.cart-container{

    overflow-x:auto;

}

.cart-buttons{

    flex-direction:column;
    gap:20px;

}

.add-items button,
.checkout button{

    width:100%;

}

}

</style>

</head>

<body>
<%
User loggedInUser = (User) session.getAttribute("user");

Cart cart=(Cart)session.getAttribute("cart");
Integer restaurantId=(Integer)session.getAttribute("restaurantId");
double grandTotal=0;
if(cart!=null && !cart.getItems().isEmpty()){
%>



<!-- Navbar -->

<div class="navbar">

    <div class="logo">
        FoodHub
    </div>

<div class="nav-links">

   <a href="restaurant">Home</a>

<div class="search-container">

    <a href="#" id="searchLink">Search</a>

    <div class="search-box" id="searchBox">

        <form action="menu" method="get" class="search-form">

            <input type="hidden"
                   name="restaurantId"
                   value="<%= restaurantId %>">

            <input
                type="text"
                name="keyword"
                placeholder="Search food..."
                required>

            <span class="close-search" id="closeSearch">&times;</span>

        </form>

    </div>

</div>

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

</div>

<div class="container">

<h1 class="heading">
My Cart
</h1>
<%
Restaurant restaurant = (Restaurant)session.getAttribute("restaurant");
%>
<div class="restaurant-name">
    <%= restaurant.getName() %>
</div>





<div class="cart-container">

<div class="cart-header">

<div class="item-name">
Item Name
</div>

<div class="item-price">
Price
</div>

<div class="item-quantity">
Quantity
</div>

<div class="item-total">
Total
</div>

<div class="item-action">
Action
</div>

</div>

<%
for(CartItem item: cart.getItems().values())
{
	grandTotal=item.getTotalPrice()+grandTotal;
%>

<!-- Cart Item 1 -->

<div class="cart-item">

    <div class="item-name" ><%= item.getName()%>
        
    </div>

    <div class="item-price">₹<%= item.getPrice() %>
    </div>
    
  

    <div class="item-quantity">

        <div class="quantity">
        <form action="cartServlet" method="post">
        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
        <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="quantity" value="<%= item.getQty()-1%>">
        <button class="qty-btn" type="submit">-</button>        
        </form>
        
        <span class="quantity"><%= item.getQty() %></span>
        
        <form action="cartServlet" method="post">
        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
        <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="quantity" value="<%= item.getQty()+1%>">
        <button class="qty-btn" type="submit">+</button>        
        </form>
           
        </div>

    </div>
    
      <div class="item-total">₹<%= item.getTotalPrice() %>
    </div>
    
    <form action="cartServlet" method="post">
    <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
    <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
    <input type="hidden" name="action" value="delete">
     <button class="remove-btn" type="submit">Remove</button>
    </form>
</div>
<%
       }
    
    %>




<!-- Grand Total -->

<div class="grand-total">

    <div class="total-label">Grand Total</div>
    <div class="total-price">₹<%= grandTotal %></div>

</div>

</div>

<!-- Buttons -->

<div class="cart-buttons">

    <div class="add-items">

        <a class="add-more-btn" href=menu?restaurantId=<%=restaurantId %>>Add More Items</a>

    </div>
    
     <div class="checkout">
        <a class="checkout-btn"
           href="checkout.jsp">
           Proceed to Checkout
        </a>
    </div>
    

    <%
}else{
    
    %>
<div class="empty-cart">

    <h2>Your Cart is Empty</h2>

    <p>
        Looks like you haven't added any delicious food yet.
    </p>

    <a href="restaurant">
        Browse Restaurants
    </a>

</div>
    <%
    
}
    
    %>

</div>

</div>

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