package com.tap.DAOimp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;
import java.util.LinkedHashSet;
import java.util.Set;
public class RestaurantDAOImpl implements RestaurantDAO
{
	private static final String INSERT_QUERY = "INSERT INTO restaurant(name,cuisineType,deliveryTime,address,rating,isActive,imagePath) values (?,?,?,?,?,?,?)";
	private static final String GET_QUERY = "SELECT * FROM restaurant where restaurantID=?";
	private static final String UPDATE_QUERY = "UPDATE restaurant SET name=?,cuisineType=?,deliveryTime=?,address=?,isActive=?,imagePath=? WHERE restaurantID=?";
	private static final String DELETE_QUERY = "DELETE FROM restaurant WHERE restaurantID=?";
	private static final String GET_ALL_QUERY = "SELECT * FROM restaurant";

	@Override
	public void addRestaurant(Restaurant restaurant)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(INSERT_QUERY))
		{
			psmt.setString(1, restaurant.getName());
			psmt.setString(2, restaurant.getCuisineType());
			psmt.setInt(3, restaurant.getDeliveryTime());
			psmt.setString(4, restaurant.getAddress());
			psmt.setDouble(5, restaurant.getRating());
			psmt.setBoolean(6, restaurant.isActive());
			psmt.setString(7, restaurant.getImagePath());

			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int restaurantId)
	{
		Restaurant restaurant = null;
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(GET_QUERY))
		{
			psmt.setInt(1, restaurantId);
			try (ResultSet rs = psmt.executeQuery())
			{
				if (rs.next())
				{
					restaurant = extractRestaurantFromResultSet(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurant;
	}

	@Override
	public void updateRestaurant(Restaurant restaurant)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(UPDATE_QUERY))
		{
			psmt.setString(1, restaurant.getName());
			psmt.setString(2, restaurant.getCuisineType());
			psmt.setInt(3, restaurant.getDeliveryTime());
			psmt.setString(4, restaurant.getAddress());
			psmt.setBoolean(5, restaurant.isActive());
			psmt.setString(6, restaurant.getImagePath());
			psmt.setInt(7, restaurant.getRestaurantId());

			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deleteRestaurant(int restaurantId)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(DELETE_QUERY))
		{
			psmt.setInt(1, restaurantId);
			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<Restaurant> getAllRestaurant()
	{
		List<Restaurant> list = new ArrayList<Restaurant>();
		try (Connection connection = DBConnection.getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(GET_ALL_QUERY))
		{
			while (rs.next())
			{
				Restaurant restaurant = extractRestaurantFromResultSet(rs);
				list.add(restaurant);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public static Restaurant extractRestaurantFromResultSet(ResultSet rs) throws SQLException
	{
		int id = rs.getInt("restaurantid");
		String name = rs.getString("name");
		String cuisineType = rs.getString("cuisinetype");
		int deliveryTime = rs.getInt("deliverytime");
		String address = rs.getString("address");
		double rating = rs.getDouble("rating");
		boolean isActive = rs.getBoolean("isactive");
		String imagePath = rs.getString("imagepath");

		return new Restaurant(id, name, cuisineType, deliveryTime, address, rating, isActive, imagePath);		
	}
	public List<Restaurant> searchRestaurant(String keyword)
	{
	    List<Restaurant> list = new ArrayList<>();

	    String SEARCH_QUERY = "SELECT DISTINCT r.* "
	            + "FROM restaurant r "
	            + "LEFT JOIN menu m ON r.restaurantId = m.restaurantId "
	            + "WHERE LOWER(r.name) LIKE ? "
	            + "OR LOWER(m.itemname) LIKE ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement psmt = connection.prepareStatement(SEARCH_QUERY))
	    {
	        String search = "%" + keyword.toLowerCase() + "%";

	        psmt.setString(1, search);
	        psmt.setString(2, search);

	        ResultSet rs = psmt.executeQuery();

	        while(rs.next())
	        {
	            Restaurant restaurant = extractRestaurantFromResultSet(rs);
	            list.add(restaurant);
	        }
	    }
	    catch (SQLException e)
	    {
	        e.printStackTrace();
	    }
	    return list;
	}
}