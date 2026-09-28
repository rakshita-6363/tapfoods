package com.tap.DAO;
import java.util.List;
import com.tap.model.User;
public interface UserDAO 
{
	int addUser(User user);
	User getUser(int userId);
	boolean updateUser(User user);
	void deleteUser(int userId);
	List<User>getAllUser();
	User getUserByUsermail(String usermail);

}