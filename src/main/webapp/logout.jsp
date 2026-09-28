<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodHub | Logout</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#ff6b35,#ff9f43);
}

.container{
    width:420px;
    background:#fff;
    padding:40px 35px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

.icon{
    font-size:60px;
    margin-bottom:20px;
}

h2{
    color:#333;
    margin-bottom:15px;
}

p{
    color:#666;
    font-size:16px;
    margin-bottom:35px;
    line-height:1.5;
}

.button-group{
    display:flex;
    justify-content:center;
    gap:20px;
}

.yes-btn,
.cancel-btn{
    text-decoration:none;
    padding:12px 28px;
    border-radius:8px;
    font-size:16px;
    font-weight:bold;
    transition:0.3s;
}

.yes-btn{
    background:#ff6b35;
    color:white;
}

.yes-btn:hover{
    background:#e65c28;
}

.cancel-btn{
    background:#f2f2f2;
    color:#333;
}

.cancel-btn:hover{
    background:#dddddd;
}

</style>

</head>
<body>

<div class="container">

    <div class="icon">🚪</div>

    <h2>Logout</h2>

    <p>
        Are you sure you want to log out?
    </p>

    <div class="button-group">

        <a href="logout" class="yes-btn">
            Yes
        </a>

        <a href="javascript:history.back()" class="cancel-btn">
            Cancel
        </a>

    </div>

</div>

</body>
</html>