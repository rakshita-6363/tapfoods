package com.food.servlets;
import java.io.IOException;
import java.net.Authenticator.RequestorType;
import java.util.List;
import com.tap.DAOimp.RestaurantDAOImpl;
import com.tap.model.Restaurant;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
	    RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
	/* //sir logic    List<Restaurant> allRestaurant=restaurantDAOImpl.getAllRestaurant();
	    for(Restaurant restaurant: allRestaurant)
	    {
	    	System.out.println(restaurant);
	    	
	    }
	    req.setAttribute("allRestaurant",allRestaurant);//Yes — setAttribute("allRestaurant", allRestaurant) places your entire list of
	    // restaurant objects inside the req object, so that when req is later forwarded to the JSP, 
	    ///the JSP can retrieve that same list and use it (e.g., to loop 
	    ///through and display each restaurant on the page).
	    RequestDispatecher rd=req.getRequestDispatcher("restaurant.jsp");
	    rd.forward(req,resp);
	    
	    */

	    // Get the search keyword
	    String keyword = req.getParameter("keyword");

	    List<Restaurant> allRestaurant;

	    if(keyword == null || keyword.trim().isEmpty())
	    {
	        // No search -> display all restaurants
	        allRestaurant = restaurantDAOImpl.getAllRestaurant();
	    }
	    else
	    {
	        // Search -> display matching restaurants
	        allRestaurant = restaurantDAOImpl.searchRestaurant(keyword);
	    }

	    req.setAttribute("allRestaurant", allRestaurant);

	    RequestDispatcher rd = req.getRequestDispatcher("Restaurant.jsp");
	    rd.forward(req, resp);
	}
}
