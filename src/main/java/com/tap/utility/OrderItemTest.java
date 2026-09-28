package com.tap.utility;

import java.util.List;
import com.tap.DAOimp.OrderItemDAOImpl;
import com.tap.model.OrderItem;

public class OrderItemTest
{
	public static void main(String[] args) {

		OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();

		// 1. Test addOrderItem
		//OrderItem orderItem = new OrderItem(1, 2, 250.00, 1);
		//orderItemDAOImpl.addOrderItem(orderItem);

		// 2. Test getOrderItem
		//OrderItem orderItem = orderItemDAOImpl.getOrderItem(1);
		//System.out.println(orderItem);

		// 3. Test updateOrderItem
		OrderItem orderItem = orderItemDAOImpl.getOrderItem(1);
		if (orderItem != null) {
			orderItem.setQuantity(3);
			orderItem.setItemTotal(375.00);
			orderItemDAOImpl.updateOrderItem(orderItem);
		} else {
			System.out.println("OrderItem not found");
		}

		// 4. Test deleteOrderItem
		//orderItemDAOImpl.deleteOrderItem(2);

		// 5. Test getAllOrderItem
		/*List<OrderItem> list = orderItemDAOImpl.getAllOrderItem();
		for (OrderItem o : list) {
			System.out.println(o);
		}*/
	}
}