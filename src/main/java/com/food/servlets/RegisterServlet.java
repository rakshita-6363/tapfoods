package com.food.servlets;
import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;
import com.tap.DAOimp.UserDAOImpl;
import com.tap.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name=req.getParameter("username");
		String mail=req.getParameter("email");
		String password=req.getParameter("password");
		String role=req.getParameter("role");
		String address=req.getParameter("address");		
		String hashpw=BCrypt.hashpw(password, BCrypt.gensalt(12));		
		User user = new User(name, mail, hashpw, role, address);
		UserDAOImpl userDAOImpl=new UserDAOImpl();
		int i=userDAOImpl.addUser(user);
		if(i==1)
		{
			resp.sendRedirect("login.jsp");
		}
		else
		{
			resp.sendRedirect("register.html");
		}		
	}
}
