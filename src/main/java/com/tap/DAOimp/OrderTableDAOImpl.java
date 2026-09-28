package com.tap.DAOimp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.OrderTableDAO;
import com.tap.model.OrderTable;
import com.tap.utility.DBConnection;

public class OrderTableDAOImpl implements OrderTableDAO
{
	private static final String INSERT_QUERY = "INSERT INTO ordertable(userid,orderdate,totalamount,status,paymentmethod,restaurantid) values (?,?,?,?,?,?)";
	private static final String GET_QUERY = "SELECT * FROM ordertable where orderid=?";
	private static final String UPDATE_QUERY = "UPDATE ordertable SET status=?,paymentmethod=? WHERE orderid=?";
	private static final String DELETE_QUERY = "DELETE FROM ordertable WHERE orderid=?";
	private static final String GET_ALL_QUERY = "SELECT * FROM ordertable";

	@Override
	public int addOrder(OrderTable order)
	{
		int orderId=0;
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS))
		{
			psmt.setInt(1, order.getUserId());
			psmt.setTimestamp(2, order.getOrderDate());
			psmt.setDouble(3, order.getTotalAmount());
			psmt.setString(4, order.getStatus());
			psmt.setString(5, order.getPaymentMethod());
			psmt.setInt(6, order.getRestaurantId());

			psmt.executeUpdate();
			
			ResultSet res=psmt.getGeneratedKeys();
			{
				if(res.next())
				{
					orderId=res.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderId;
	}

	@Override
	public OrderTable getOrder(int orderId)
	{
		OrderTable order = null;
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(GET_QUERY))
		{
			psmt.setInt(1, orderId);
			try (ResultSet rs = psmt.executeQuery())
			{
				if (rs.next())
				{
					order = extractOrderFromResultSet(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public void updateOrder(OrderTable order)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(UPDATE_QUERY))
		{
			psmt.setString(1, order.getStatus());
			psmt.setString(2, order.getPaymentMethod());
			psmt.setInt(3, order.getOrderId());

			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int orderId)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(DELETE_QUERY))
		{
			psmt.setInt(1, orderId);
			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderTable> getAllOrder()
	{
		List<OrderTable> list = new ArrayList<OrderTable>();
		try (Connection connection = DBConnection.getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(GET_ALL_QUERY))
		{
			while (rs.next())
			{
				OrderTable order = extractOrderFromResultSet(rs);
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static OrderTable extractOrderFromResultSet(ResultSet rs) throws SQLException
	{
		int orderId = rs.getInt("orderid");
		int userId = rs.getInt("userid");
		Timestamp orderDate = rs.getTimestamp("orderdate");
		double totalAmount = rs.getDouble("totalamount");
		String status = rs.getString("status");
		String paymentMethod = rs.getString("paymentmethod");
		int restaurantId = rs.getInt("restaurantid");

		return new OrderTable(orderId, userId, orderDate, totalAmount, status, paymentMethod, restaurantId);
	}

}