<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="com.tap.model.User,com.tap.model.Restaurant" %>

    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Order Confirmation</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f5f5f5;
    min-height:100vh;
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

.nav-links a{
    text-decoration:none;
    color:white;
    font-size:16px;
    font-weight:bold;

    display:flex;
    align-items:center;
}


/* ================= MAIN ================= */

.confirmation-container{
    width:100%;
    min-height:calc(100vh - 70px);
    display:flex;
    justify-content:center;
    align-items:center;
    padding:50px 20px;
}

.confirmation-card{
    width:550px;
    max-width:100%;
    background:white;
    border-radius:12px;
    padding:60px 45px;
    text-align:center;
    box-shadow:0 5px 18px rgba(0,0,0,.08);
}

/* ================= SUCCESS ================= */

.success-icon{
    width:100px;
    height:100px;
    background:#28a745;
    border-radius:50%;
    margin:0 auto 30px;
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
    font-size:50px;
    font-weight:bold;
}

.success-title{
    font-size:34px;
    font-weight:bold;
    color:#333;
    margin-bottom:18px;
}
.success-message{
    font-size:18px;
    color:#666;
    line-height:30px;
}

.line{
    height:1px;
    background:#ddd;
    margin:35px 0;
}

.delivery-title{
    font-size:22px;
    font-weight:bold;
    color:#333;
    margin-bottom:15px;
}

.delivery-time{
    font-size:38px;
    color:#ff6b35;
    font-weight:bold;
}

.note{
    margin-top:18px;
    color:#777;
    font-size:16px;
    line-height:26px;
}

/* ================= BUTTON ================= */

.home-btn{
    display:block;
    width:100%;
    margin-top:40px;
    padding:16px;
    background:#ff6b35;
    color:white;
    border-radius:8px;
    font-size:18px;
    font-weight:bold;
    text-align:center;
    transition:.3s;
}

.home-btn:hover{
    background:#e85a26;
}

.home-btn:hover{
    background:#e85a26;
}



.footer-note{
    margin-top:25px;
    font-size:15px;
    color:#888;
    text-align:center;
}





@media(max-width:768px){

.navbar{
    padding:0 20px;
}

.nav-links{
    gap:15px;
}

.confirmation-card{
    width:90%;
}

}

</style>

</head>
<%
User loggedInUser = (User)session.getAttribute("user");
Restaurant restaurant = (Restaurant)session.getAttribute("restaurant");
%>




<body>

<div class="navbar">

    <div class="logo">
        FoodHub
    </div>

    <div class="nav-links">

        <a href="restaurant">Home</a>

 

        <%
        if(loggedInUser == null)
        {
        %>

            <a href="login.jsp">Sign In</a>
            <a href="register.html">Sign Up</a>
           
            <a href="profile">Profile 👤</a>

        <%
        }
        else
        {
        %>

            
            <a href="profile">👤 <%= loggedInUser.getUserName() %></a>
            <a href="logout.jsp">Logout</a>

        <%
        }
        %>

    </div>

</div>


<div class="confirmation-container">

    <div class="confirmation-card">

        <div class="success-icon">
            ✓
        </div>

        <div class="success-title">
            Order Confirmed
        </div>

        <div class="success-message">
            Your order has been placed successfully.
        </div>

        <div class="line"></div>

        <div class="delivery-title">
            Estimated Delivery
        </div>

        <div class="delivery-time">
<%
if(restaurant != null)
{
%>
    <%= restaurant.getDeliveryTime() %> mins
<%
}
else
{
%>
    -- mins
<%
}
%>
</div>


        <div class="note">
            Thank you for choosing FoodHub.<br>
            Your food is being prepared.
        </div>
        
        
        <a href="restaurant" class="home-btn">Back to Home</a>
        
        

        <div class="footer-note">
            We hope you enjoy your meal!
        </div>

    </div>

</div>





</body>
</html>