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
import jakarta.servlet.http.HttpSession;





@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null)
        {
            resp.sendRedirect("login.html");
            return;
        }

        User existingUser = (User) session.getAttribute("user");

        String name = req.getParameter("username");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String newPassword = req.getParameter("password");

        String finalPassword;
        if (newPassword != null && !newPassword.trim().isEmpty())
        {
            finalPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
        }
        else
        {
            finalPassword = existingUser.getPassword();   // keep old hash unchanged
        }

        // Build updated user object, preserving fields not being edited (id, role, timestamps)
        User updatedUser = new User(
            existingUser.getUserId(),
            name,
            email,
            finalPassword,
            address,
            existingUser.getRole(),
            existingUser.getCreatedDate(),
            existingUser.getLastLoginDate()
        );
        
        UserDAOImpl userDAOImpl = new UserDAOImpl();
        boolean success = userDAOImpl.updateUser(updatedUser);

        if (success)
        {
            session.setAttribute("user", updatedUser);   // sync session only if DB update actually worked
            resp.sendRedirect("profile?status=success");
        }
        else
        {
            resp.sendRedirect("profile?status=error");
        }
    }
    /*UserDAOImpl userDAOImpl = new UserDAOImpl();
    userDAOImpl.updateUser(updatedUser);

    // Keep session in sync so the UI reflects changes without re-login
    session.setAttribute("user", updatedUser);

    resp.sendRedirect("profile");*/
}