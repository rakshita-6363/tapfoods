<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodHub | My Profile</title>

<style>
*{ margin:0; padding:0; box-sizing:border-box; font-family:Arial, Helvetica, sans-serif; }
body{ min-height:100vh; display:flex; justify-content:center; align-items:center;
      background:linear-gradient(135deg,#ff6b35,#ff9f43); }
.container{ width:420px; background:#fff; padding:35px; border-radius:12px;
            box-shadow:0 8px 20px rgba(0,0,0,0.2); }
.container h2{ text-align:center; color:#ff6b35; margin-bottom:25px; }
.input-group{ margin-bottom:18px; }
.input-group label{ display:block; margin-bottom:6px; font-weight:bold; color:#444; }
.input-group input, .input-group textarea{
    width:100%; padding:12px; border:1px solid #ccc; border-radius:6px;
    font-size:15px; outline:none; }
.input-group input:focus, .input-group textarea:focus{ border-color:#ff6b35; }
.input-group small{ color:#888; }
button{ width:100%; padding:12px; background:#ff6b35; color:white; border:none;
        border-radius:6px; font-size:17px; cursor:pointer; }
button:hover{ background:#e65c28; }
</style>
</head>
<body>

<div class="container">
<h2>My Profile</h2>
<%
    String status = (String) request.getAttribute("status");
%>
<% if ("success".equals(status)) { %>
    <div style="background:#d4edda; color:#155724; padding:10px; border-radius:6px; margin-bottom:15px; text-align:center;">
        ✅ Profile updated successfully!
    </div>
<% } else if ("error".equals(status)) { %>
    <div style="background:#f8d7da; color:#721c24; padding:10px; border-radius:6px; margin-bottom:15px; text-align:center;">
        ❌ Update failed. Please try again.
    </div>
<% } %>

<%
    // Fallback in case someone accesses profile.jsp directly without going through the servlet
    User user = (User) request.getAttribute("user");
    if (user == null) {
        user = (User) session.getAttribute("user");
    }
    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<form action="updateProfile" method="post">

    <div class="input-group">
        <label>Name</label>
        <input type="text" name="username" value="<%= user.getUserName() %>" required>
    </div>

    <div class="input-group">
        <label>Email</label>
        <input type="email" name="email" value="<%= user.getUserMail() %>" required>
    </div>

    <div class="input-group">
        <label>Address</label>
        <textarea name="address" rows="3" required><%= user.getAddress() %></textarea>
    </div>

    <div class="input-group">
        <label>Password</label>
        <input type="password" name="password" placeholder="Leave blank to keep current password">
        <small>Only fill this in if you want to change your password.</small>
    </div>

    <button type="submit">Save Changes</button>

</form>

</div>

</body>
</html>