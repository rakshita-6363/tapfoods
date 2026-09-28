package com.food.servlets;

import java.io.IOException;
import java.util.List;
import com.tap.DAOimp.RestaurantDAOImpl;
import com.tap.model.Restaurant;
import jakarta.servlet.http.HttpSession;

import com.tap.DAOimp.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/menu")
public class MenuServlet extends HttpServlet 
{
	/*@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		MenuDAOImpl menuDAOImpl=new MenuDAOImpl();
		int restaurantId=Integer.parseInt(req.getParameter("restaurantId"));
		List<Menu> allMenu=menuDAOImpl.getAllMenu(restaurantId);
		for(Menu menu:allMenu)
		{
			System.out.println(menu);
		}
		req.setAttribute("allMenu", allMenu);
		RequestDispatcher rd=req.getRequestDispatcher("menu.jsp");
		rd.forward(req, resp);
	}*/
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException
	{
	    MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
	    int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
	    HttpSession session = req.getSession();
	    session.setAttribute("restaurantId", restaurantId);

	    RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
	    Restaurant restaurant = restaurantDAOImpl.getRestaurant(restaurantId);

	    session.setAttribute("restaurant", restaurant);


	    String keyword = req.getParameter("keyword");
	    List<Menu> allMenu;

	    if(keyword != null && !keyword.trim().isEmpty())
	    {
	        allMenu = menuDAOImpl.searchMenu(restaurantId, keyword);
	    }
	    else
	    {
	        allMenu = menuDAOImpl.getAllMenu(restaurantId);
	    }

	    req.setAttribute("allMenu", allMenu);

	    RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
	    rd.forward(req, resp);
	}
	
	
	

}
