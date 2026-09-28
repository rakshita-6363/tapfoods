package com.food.servlets;
import java.io.IOException;
import com.tap.model.User;
import org.mindrot.jbcrypt.BCrypt;
import com.tap.DAOimp.UserDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
	    String mail = req.getParameter("email");
	    String password = req.getParameter("password");
	    HttpSession session = req.getSession();

	    UserDAOImpl userDAOImpl = new UserDAOImpl();

	    User user = userDAOImpl.getUserByUsermail(mail);//to compare mail

	    // Check whether the email exists
	    if(user == null)
	    {
	        req.setAttribute("error", "No account found with this email.");
	        req.setAttribute("showRegister", true);

	        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
	        rd.forward(req, resp);
	        return;
	    }

	    String dbPassword = user.getPassword();//to compare password
	    if(BCrypt.checkpw(password, dbPassword))
	    {
	        session.setAttribute("user", user);
	        resp.sendRedirect("restaurant");
	    }
	    else
	    {
	        req.setAttribute("error", "Incorrect password. Please try again.");
	        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
	        rd.forward(req, resp);
	    }
	}

}




