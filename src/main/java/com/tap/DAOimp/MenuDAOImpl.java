package com.tap.DAOimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO
{
	private static final String INSERT_QUERY = "INSERT INTO menu(restaurantid,itemname,description,price,isavailable,imagepath) values (?,?,?,?,?,?)";
	private static final String GET_QUERY = "SELECT * FROM menu where menuid=?";
	private static final String UPDATE_QUERY = "UPDATE menu SET itemname=?,description=?,price=?,isavailable=?,imagepath=? WHERE menuid=?";
	private static final String DELETE_QUERY = "DELETE FROM menu WHERE menuid=?";
	private static final String GET_ALL_QUERY = "SELECT * FROM menu";
	private static final String GET_ALL_BY_RESTAURANT_QUERY = "SELECT * FROM menu WHERE restaurantid=?";

	@Override
	public void addMenu(Menu menu)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(INSERT_QUERY))
		{
			psmt.setInt(1, menu.getRestaurantId());
			psmt.setString(2, menu.getItemName());
			psmt.setString(3, menu.getDescription());
			psmt.setDouble(4, menu.getPrice());
			psmt.setBoolean(5, menu.isAvailable());
			psmt.setString(6, menu.getImagePath());

			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId)
	{
		Menu menu = null;
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(GET_QUERY))
		{
			psmt.setInt(1, menuId);
			try (ResultSet rs = psmt.executeQuery())
			{
				if (rs.next())
				{
					menu = extractMenuFromResultSet(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public void updateMenu(Menu menu)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(UPDATE_QUERY))
		{
			psmt.setString(1, menu.getItemName());
			psmt.setString(2, menu.getDescription());
			psmt.setDouble(3, menu.getPrice());
			psmt.setBoolean(4, menu.isAvailable());
			psmt.setString(5, menu.getImagePath());
			psmt.setInt(6, menu.getMenuId());

			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId)
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(DELETE_QUERY))
		{
			psmt.setInt(1, menuId);
			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/*  @Override
	    public List<Menu> getAllMenu()
	    {
	        List<Menu> list = new ArrayList<Menu>();
	        try (Connection connection = DBConnection.getConnection();
	                Statement stmt = connection.createStatement();
	                ResultSet rs = stmt.executeQuery(GET_ALL_QUERY))
	        {
	            while (rs.next())
	            {
	                Menu menu = extractMenuFromResultSet(rs);
	                list.add(menu);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return list;
	    }*/
	
	@Override
	public List<Menu> getAllMenu(int restaurantId)
	{
	    List<Menu> list = new ArrayList<Menu>();
	    try (Connection connection = DBConnection.getConnection();
	            PreparedStatement psmt = connection.prepareStatement(GET_ALL_BY_RESTAURANT_QUERY))
	    {
	        psmt.setInt(1, restaurantId);
	        try (ResultSet rs = psmt.executeQuery())
	        {
	            while (rs.next())
	            {
	                Menu menu = extractMenuFromResultSet(rs);
	                list.add(menu);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	public static Menu extractMenuFromResultSet(ResultSet rs) throws SQLException
	{
		int menuId = rs.getInt("menuid");
		int restaurantId = rs.getInt("restaurantid");
		String itemName = rs.getString("itemname");
		String description = rs.getString("description");
		double price = rs.getDouble("price");
		boolean isAvailable = rs.getBoolean("isavailable");
		String imagePath = rs.getString("imagepath");

		return new Menu(menuId, restaurantId, itemName, description, price, isAvailable, imagePath);
	}
	public List<Menu> searchMenu(int restaurantId, String keyword)
	{
	    List<Menu> list = new ArrayList<>();

	    String query = "SELECT * FROM menu WHERE restaurantId=? AND itemName LIKE ?";

	    try(Connection connection = DBConnection.getConnection();
	        PreparedStatement psmt = connection.prepareStatement(query))
	    {
	        psmt.setInt(1, restaurantId);
	        psmt.setString(2, "%" + keyword + "%");

	        ResultSet rs = psmt.executeQuery();

	        while(rs.next())
	        {
	            Menu menu = extractMenuFromResultSet(rs);
	            list.add(menu);
	        }
	    }
	    catch(Exception e)
	    {
	        e.printStackTrace();
	    }

	    return list;
	}

}