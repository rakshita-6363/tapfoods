package com.tap.DAOimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO
{
	private static final String INSERT_QUERY = "INSERT INTO orderitem(orderid,quantity,itemtotal,menuid) values (?,?,?,?)";
	private static final String GET_QUERY = "SELECT * FROM orderitem where orderitemid=?";
	private static final String UPDATE_QUERY = "UPDATE orderitem SET quantity=?,itemtotal=? WHERE orderitemid=?";
	private static final String DELETE_QUERY = "DELETE FROM orderitem WHERE orderitemid=?";
	private static final String GET_ALL_QUERY = "SELECT * FROM orderitem";

	@Override
	public void addOrderItem(OrderItem orderItem)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(INSERT_QUERY))
		{
			psmt.setInt(1, orderItem.getOrderId());
			psmt.setInt(2, orderItem.getQuantity());
			psmt.setDouble(3, orderItem.getItemTotal());
			psmt.setInt(4, orderItem.getMenuId());

			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItem(int orderItemId)
	{
		OrderItem orderItem = null;
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(GET_QUERY))
		{
			psmt.setInt(1, orderItemId);
			try (ResultSet rs = psmt.executeQuery())
			{
				if (rs.next())
				{
					orderItem = extractOrderItemFromResultSet(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderItem;
	}

	@Override
	public void updateOrderItem(OrderItem orderItem)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(UPDATE_QUERY))
		{
			psmt.setInt(1, orderItem.getQuantity());
			psmt.setDouble(2, orderItem.getItemTotal());
			psmt.setInt(3, orderItem.getOrderItemId());

			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderItemId)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(DELETE_QUERY))
		{
			psmt.setInt(1, orderItemId);
			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderItem> getAllOrderItem()
	{
		List<OrderItem> list = new ArrayList<OrderItem>();
		try (Connection connection = DBConnection.getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(GET_ALL_QUERY))
		{
			while (rs.next())
			{
				OrderItem orderItem = extractOrderItemFromResultSet(rs);
				list.add(orderItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static OrderItem extractOrderItemFromResultSet(ResultSet rs) throws SQLException
	{
		int orderItemId = rs.getInt("orderitemid");
		int orderId = rs.getInt("orderid");
		int quantity = rs.getInt("quantity");
		double itemTotal = rs.getDouble("itemtotal");
		int menuId = rs.getInt("menuid");

		return new OrderItem(orderItemId, orderId, quantity, itemTotal, menuId);
	}

}