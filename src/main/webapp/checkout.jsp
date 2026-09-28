<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,
                 com.tap.model.Cart,
                 com.tap.model.CartItem,
                 com.tap.model.User,
                 com.tap.model.Restaurant,
                 com.tap.DAOimp.RestaurantDAOImpl" %>
                     

    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Checkout</title>

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

a{
    text-decoration:none;
    color:inherit;
}

/* ================= NAVBAR ================= */

.navbar{
    width:100%;
    height:70px;
    background:#ff6b35;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 60px;
    color:white;
    box-shadow:0 2px 10px rgba(0,0,0,0.15);
}

.logo{
    font-size:28px;
    font-weight:bold;
}

.nav-links{
    display:flex;
    align-items:center;
    gap:30px;
}
.search-container{
    position:relative;
    display:flex;
    align-items:center;
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




/* ================= CONTAINER ================= */

.checkout-container{
    width:90%;
    margin:40px auto;
    display:flex;
    gap:30px;
    align-items:flex-start;
}

/* ================= LEFT ================= */

.checkout-left{
    flex:2;
}

.checkout-card{
    background:white;
    border-radius:12px;
    padding:25px;
    box-shadow:0 5px 18px rgba(0,0,0,0.08);
}

.section-title{
    font-size:24px;
    font-weight:bold;
    color:#333;
    margin-bottom:25px;
}

.form-row{
    display:flex;
    gap:20px;
    margin-bottom:18px;
}

.form-group{
    flex:1;
    display:flex;
    flex-direction:column;
}

.form-group label{
    font-size:14px;
    color:#555;
    margin-bottom:8px;
    font-weight:bold;
}

.form-group input,
.form-group textarea,
.form-group select{
    padding:14px;
    border:1px solid #ddd;
    border-radius:8px;
    font-size:15px;
    outline:none;
    transition:0.3s;
}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus{
    border-color:#ff6b35;
}

textarea{
    resize:none;
    height:110px;
}

/* ================= PAYMENT ================= */

.payment-box{
    margin-top:30px;
}

.payment-title{
    font-size:20px;
    font-weight:bold;
    margin-bottom:18px;
}

.payment-option{
    display:flex;
    align-items:center;
    padding:15px;
    border:1px solid #ddd;
    border-radius:10px;
    margin-bottom:12px;
    cursor:pointer;
    transition:.3s;
}

.payment-option:hover{
    border-color:#ff6b35;
    background:#fff7f3;
}

.payment-option input{
    margin-right:15px;
}

.payment-name{
    font-size:15px;
    font-weight:bold;
}

/* ================= RIGHT ================= */

.checkout-right{
    flex:1;
}

.summary-card{
    background:white;
    border-radius:12px;
    padding:25px;
    box-shadow:0 5px 18px rgba(0,0,0,.08);
    position:sticky;
    top:20px;
}

.summary-title{
    font-size:22px;
    font-weight:bold;
    margin-bottom:25px;
}

.restaurant-name{
    font-size:18px;
    font-weight:bold;
    color:#ff6b35;
    margin-bottom:20px;
}


.cart-item{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 0;
    border-bottom:1px solid #ececec;
}

.item-left{
    display:flex;
    flex-direction:column;
    gap:6px;
}

.food-name{
    font-size:16px;
    font-weight:bold;
    color:#333;
}

.food-qty{
    font-size:14px;
    color:#777;
}

.item-right{
    display:flex;
    align-items:center;
}

.food-price{
    font-size:17px;
    font-weight:bold;
    color:#ff6b35;
}
.order-item{
    display:flex;
    justify-content:space-between;
    margin-bottom:15px;
    font-size:15px;
}

.item-name{
    color:#444;
}

.item-price{
    font-weight:bold;
}

.line{
    height:1px;
    background:#ddd;
    margin:18px 0;
}

.total-row{
    display:flex;
    justify-content:space-between;
    margin-bottom:15px;
    font-size:16px;
}

.grand-total{
    font-size:22px;
    font-weight:bold;
    color:#ff6b35;
}

.place-order{
    width:100%;
    background:#ff6b35;
    color:white;
    border:none;
    padding:15px;
    border-radius:8px;
    font-size:17px;
    cursor:pointer;
    margin-top:20px;
    transition:.3s;
}

.place-order:hover{
    background:#e85a26;
}

.back-cart{
    display:block;
    text-align:center;
    margin-top:15px;
    color:#ff6b35;
    font-weight:bold;
}

.footer-note{
    margin-top:20px;
    font-size:13px;
    color:#888;
    text-align:center;
}

/* ---------- Search ---------- */

.search-container{
    position:relative;
    display:inline-block;
}



.search-form{
    position:relative;
}

.search-container > a{
    text-decoration:none;
    color:white;
    font-size:18px;
    transition:.3s;

    display:flex;
    align-items:center;
    padding:0;
    margin:0;
   
}

.search-container > a:hover{
    color:black;
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
    box-shadow:0 8px 20px rgba(0,0,0,.15);
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
    box-shadow:0 0 8px rgba(255,107,0,.2);
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
}

.close-search:hover{
    color:#ff6b00;
}


@media(max-width:950px){

.checkout-container{
    flex-direction:column;
}

.summary-card{
    position:static;
}

.form-row{
    flex-direction:column;
}

}

</style>

</head>

<%
User loggedInUser = (User)session.getAttribute("user");
Integer restaurantId = (Integer)session.getAttribute("restaurantId");
%>

<body>

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


<div class="checkout-container">

    <!-- LEFT -->

    <div class="checkout-left">

        <div class="checkout-card">

            <div class="section-title">
                Delivery Information
            </div>

            <div class="form-row">

                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" placeholder="Enter your name">
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" placeholder="Enter phone number">
                </div>

            </div>

            <div class="form-row">

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" placeholder="Enter email">
                </div>

                <div class="form-group">
                    <label>City</label>
                    <input type="text" placeholder="Enter city">
                </div>

            </div>

            <div class="form-row">

                <div class="form-group">
                    <label>Delivery Address</label>
                    <textarea placeholder="House No, Street, Landmark..."></textarea>
                </div>

            </div>

            <div class="payment-box">

                <div class="payment-title">
                    Payment Method
                </div>

                <label class="payment-option">
                    <input type="radio" name="payment">
                    <span class="payment-name">Cash on Delivery</span>
                </label>

                <label class="payment-option">
                    <input type="radio" name="payment">
                    <span class="payment-name">UPI Payment</span>
                </label>

                <label class="payment-option">
                    <input type="radio" name="payment">
                    <span class="payment-name">Credit / Debit Card</span>
                </label>

                <label class="payment-option">
                    <input type="radio" name="payment">
                    <span class="payment-name">Net Banking</span>
                </label>

            </div>

        </div>

    </div>

    <!-- RIGHT -->

    <div class="checkout-right">

        <div class="summary-card">

            <div class="summary-title">
                Order Summary
            </div>
            
            <%
            Cart cart=(Cart)session.getAttribute("cart");
            double itemTotal=0;
            double dc=30;
            double pf=10;
            double gst=42;
            if(cart!=null && !cart.getItems().isEmpty())
            {
            	for(CartItem item:cart.getItems().values())
            	{
            		itemTotal=itemTotal+item.getTotalPrice();
            		
            	}
            }
            double grandTotal=itemTotal+dc+pf+ gst;
            session.setAttribute("grandTotal", grandTotal);
            %>
            
            
            
            
            

           <%
Restaurant restaurant = (Restaurant)session.getAttribute("restaurant");
%>

<div class="restaurant-name">
    <%= restaurant.getName() %>
</div>

            
            
            
            
            <%
            
            if(cart!=null && !cart.getItems().isEmpty())
            {
            	for(CartItem item:cart.getItems().values())
            	{
            		%>
            		
                    <!-- Cart Item (Repeat this in JSP using loop) -->

<div class="cart-item">

    <div class="item-left">

        <span class="food-name">
        <%= item.getName() %>
        </span>

        <span class="food-qty">
          Quantity:<%= item.getQty() %>
        </span>

    </div>

    <div class="item-right">

        <span class="food-price">
           <%= item.getTotalPrice()  %>
        </span>

    </div>

</div>
    <%
    
            		
            	}
            }
            
            
            
            
            
            %>
            
            



<div class="line"></div>

<!-- Bill Details Heading -->

<div class="summary-title" style="font-size:18px; margin-bottom:18px;">
    Bill Details
</div>

<div class="total-row">
    <span>Item Total</span>
    <span>₹<%= itemTotal %></span>
</div>

<div class="total-row">
    <span>Delivery Fee</span>
    <span>₹<%= dc %></span>
</div>

<div class="total-row">
    <span>GST & Taxes</span>
    <span>₹<%= gst %></span>
</div>

<div class="total-row">
    <span>Platform Fee</span>
    <span>₹<%= pf %></span>
</div>

<div class="line"></div>

<div class="total-row grand-total">
    <span>To Pay</span>
    <span>₹<%= grandTotal %></span>
</div>

            

           
            <div class="line"></div>

           

<form action="checkoutServlet" method="post">

    <!-- All input fields -->

    <button type="submit" class="place-order">
        Place Order
    </button>

</form>

            <a href="cartServlet" class="back-cart">
                ← Back to Cart
            </a>

            <div class="footer-note">
                Your order will be delivered within 30-40 minutes.
            </div>

        </div>

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