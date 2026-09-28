package com.food.servlets;
import java.io.IOException;
import com.tap.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;







@WebServlet("/profile")
public class ProfileServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession(false);   // false = don't create a new empty session
        if (session != null && session.getAttribute("user") != null)
        {
            User user  = (User) session.getAttribute("user");
            req.setAttribute("user", user);
            req.setAttribute("status", req.getParameter("status"));   // pass through, may be null
            RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
            rd.forward(req, resp);
        }
        else
        {
            resp.sendRedirect("login.html");
        }
    }
}