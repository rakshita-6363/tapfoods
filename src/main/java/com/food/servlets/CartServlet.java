package com.food.servlets;
import java.io.IOException;
import com.tap.DAOimp.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet 
{
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {

	        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
	        rd.forward(req, resp);

	    }
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		HttpSession session =req.getSession();//
		User user = (User) session.getAttribute("user");

	    if(user == null)
	    {
	        session.setAttribute("message", "Please login or register before adding items to the cart.");
	        resp.sendRedirect("login.jsp");
	        return;
	    }
		Cart cart=(Cart)session.getAttribute("cart");//
		
		int newRestaurantId=Integer.parseInt(req.getParameter("restaurantId"));//when user clicks on the add more items means it goes to the same restaurant menu page and that restautant id is new id
		Integer restaurantId=(Integer)session.getAttribute("restaurantId");//when u adding item to cart
		
		if(cart==null || restaurantId!=newRestaurantId )
		{
			cart=new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", newRestaurantId);
			
		}
		
		
		
		
		
		
		
		
		
		
		
		String action=req.getParameter("action");//action is add....or updtae or delete
		if(action.equals("add"))
		{
			addItemToCart(req,cart);
		}
		else if(action.equals("update"))
		{
			updateItemToCart(req,cart);
		}
		else if(action.equals("delete"))
		{
			removeItemToCart(req,cart);
		}
		RequestDispatcher rd=req.getRequestDispatcher("cart.jsp");
		rd.forward(req, resp);
		
	}

	private void updateItemToCart(HttpServletRequest req, Cart cart) 
	{
		int menuId=Integer.parseInt(req.getParameter("menuId"));
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		cart.updateItem(menuId,quantity);
		
		
	}

	private void removeItemToCart(HttpServletRequest req, Cart cart) 
	{
		int menuId=Integer.parseInt(req.getParameter("menuId"));
		cart.remove(menuId);
		
		
		
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) 
	{
		int menuId=Integer.parseInt(req.getParameter("menuId"));
		int qty=Integer.parseInt(req.getParameter("qty"));
		
		MenuDAOImpl menuDAOImpl=new MenuDAOImpl();
		Menu menu=menuDAOImpl.getMenu(menuId);
		HttpSession session=req.getSession();
		session.setAttribute("restaurantId",menu.getRestaurantId());
		
		CartItem cartItem=new CartItem(menu.getMenuId(),menu.getRestaurantId(),menu.getItemName(),menu.getPrice(),qty);
		cart.addItem(cartItem);
		
		
		
	}

}
