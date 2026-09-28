package com.tap.utility;

import java.sql.Timestamp;
import java.util.List;
import com.tap.DAOimp.OrderTableDAOImpl;
import com.tap.model.OrderTable;

public class OrderTableTest
{
	public static void main(String[] args) {

		OrderTableDAOImpl orderTableDAOImpl = new OrderTableDAOImpl();

		// 1. Test addOrder
		//OrderTable order = new OrderTable(1, new Timestamp(System.currentTimeMillis()), 470.00, "PENDING", "UPI", 1);
		//orderTableDAOImpl.addOrder(order);

		// 2. Test getOrder
		//OrderTable order = orderTableDAOImpl.getOrder(1);
		//System.out.println(order);

		// 3. Test updateOrder
		/*OrderTable order = orderTableDAOImpl.getOrder(1);
		if (order != null) {
			order.setStatus("DELIVERED");
			orderTableDAOImpl.updateOrder(order);
		} else {
			System.out.println("Order not found");
		}*/

		// 4. Test deleteOrder
		//orderTableDAOImpl.deleteOrder(2);

		// 5. Test getAllOrder
		/*List<OrderTable> list = orderTableDAOImpl.getAllOrder();
		for (OrderTable o : list) {
			System.out.println(o);
		}*/
	}
}