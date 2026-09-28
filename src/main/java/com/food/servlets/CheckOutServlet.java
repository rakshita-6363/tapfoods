package com.food.servlets;
import java.io.IOException;
import java.sql.Timestamp;

import com.tap.DAOimp.OrderItemDAOImpl;
import com.tap.DAOimp.OrderTableDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/checkoutServlet")
public class CheckOutServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("user");
		Integer restaurantId=(Integer)session.getAttribute("restaurantId");
		Cart cart=(Cart)session.getAttribute("cart");
		double grandTotal=(double)session.getAttribute("grandTotal");
		if(user!=null)
		{
			if(cart!=null && !cart.getItems().isEmpty())
			{
				int userId=user.getUserId();
				String payment=req.getParameter("payment");
				
				
				OrderTable orderTable=new OrderTable(userId, new Timestamp(System.currentTimeMillis()),grandTotal, "pending", payment,restaurantId);
				OrderTableDAOImpl orderTableDAOImpl=new OrderTableDAOImpl();
				int orderId=orderTableDAOImpl.addOrder(orderTable);
				
				
				for(CartItem cartItem:cart.getItems().values())
				{
					int menuId=cartItem.getMenuId();
					int qty=cartItem.getQty();
					double price=cartItem.getPrice();
					
					
					
					OrderItem orderItem=new OrderItem(orderId, qty, price, menuId);
					OrderItemDAOImpl orderItemDAOImpl=new OrderItemDAOImpl();
					orderItemDAOImpl.addOrderItem(orderItem);
					
					
				}
				
				session.removeAttribute("cart");
				session.removeAttribute("grandTotal");
				resp.sendRedirect("orderconfirmation.jsp");
				
				
				
				
				
				
				
				
				
				
			}
			
		}
		else
		{
			RequestDispatcher rd=req.getRequestDispatcher("login.html");
			rd.forward(req, resp);
			
		}
		
	}

}
