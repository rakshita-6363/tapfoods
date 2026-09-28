package com.tap.DAOimp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;
public class UserDAOImpl implements UserDAO 
{
	
	String INSERT_QUERY="INSERT INTO user(username,usermail,userpassword,useradd,role,createdDated,lastLoginDate) values (?,?,?,?,?,?,?)";
	String GET_QUERY="SELECT * FROM User where userID=? ";
	String GET_BY_MAIL_QUERY = "SELECT * FROM User where usermail=?";
	private static final String DELETE_QUERY = "DELETE FROM restaurant WHERE userID=?";

	@Override
	
	public int addUser(User user) 
	{
		   Connection connection=DBConnection.getConnection();
		   try {
			PreparedStatement psmt=connection.prepareStatement(INSERT_QUERY);
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getUserMail());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getAddress());
			psmt.setString(5, user.getRole());
			psmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			psmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			/*int i=psmt.executeUpdate();
			System.out.println(i);*/
			return psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return 0;
		
	}
	@Override
	public User getUser(int userId) 
	{
		User user=null;
		Connection connection=DBConnection.getConnection();
		PreparedStatement psmt;
		try {
			psmt = connection.prepareStatement(GET_QUERY);
			psmt.setInt(1, userId);
			ResultSet rs=psmt.executeQuery();
			while(rs.next())
			{
				int id=rs.getInt("userid");
				String name=rs.getString("username");
				String email=rs.getString("usermail");
				String password=rs.getString("userpassword");
				String address=rs.getString("useradd");
				String role=rs.getString("role");
				Timestamp createdDated=rs.getTimestamp("createdDated");
				Timestamp lastLoginDate=rs.getTimestamp("lastLoginDate");
				
				user=new User(id,name, email, password, address, role,createdDated,lastLoginDate);
				
			}
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	/*@Override
	public void updateUser(User user) 
	{
		String UPDATE_USER="UPDATE USER SET username=?,userpassword=?,usermail=?,useradd=?,lastLoginDate=? WHERE userid=?";
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement psmt=connection.prepareStatement(UPDATE_USER);
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getUserMail());
			psmt.setString(4, user.getAddress());
			psmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			psmt.setInt(6,user.getUserId());
			int i=psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}*/
	
	
	@Override
	public boolean updateUser(User user) 
	{
	    String UPDATE_USER = "UPDATE USER SET username=?,userpassword=?,usermail=?,useradd=?,lastLoginDate=? WHERE userid=?";
	    Connection connection = DBConnection.getConnection();
	    try {
	        PreparedStatement psmt = connection.prepareStatement(UPDATE_USER);
	        psmt.setString(1, user.getUserName());
	        psmt.setString(2, user.getPassword());
	        psmt.setString(3, user.getUserMail());
	        psmt.setString(4, user.getAddress());
	        psmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
	        psmt.setInt(6, user.getUserId());
	        int rowsAffected = psmt.executeUpdate();
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	@Override
	public void deleteUser(int userId) 
	{
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement psmt = connection.prepareStatement(DELETE_QUERY))
		{
			psmt.setInt(1, userId);
			int i = psmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public List<User> getAllUser() 
	{	
		String GET_ALL_USER="SELECT * FROM User";
		ArrayList<User> list =new ArrayList<User>();
		Connection connection=DBConnection.getConnection();
		try {
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(GET_ALL_USER);
			while(rs.next())
			{
				User user=extractUserFromResultSet(rs);
				list.add(user);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		

	}
	

	@Override
	public User getUserByUsermail(String usermail)
	{
	    User user = null;
	    Connection connection = DBConnection.getConnection();
	    try {
	        PreparedStatement psmt = connection.prepareStatement(GET_BY_MAIL_QUERY);
	        psmt.setString(1, usermail);
	        ResultSet rs = psmt.executeQuery();
	        if (rs.next())
	        {
	            user = extractUserFromResultSet(rs);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user;
	}
	public static User extractUserFromResultSet(ResultSet rs) throws SQLException
	{
		
			int id=rs.getInt("userid");
			String name=rs.getString("username");
			String email=rs.getString("usermail");
			String password=rs.getString("userpassword");
			String address=rs.getString("useradd");
			String role=rs.getString("role");
			Timestamp createdDated=rs.getTimestamp("createdDated");
			Timestamp lastLoginDate=rs.getTimestamp("lastLoginDate");
			
			User user=new User(id,name, email, password, address, role,createdDated,lastLoginDate);
			return user;
			
		}
		
	}


