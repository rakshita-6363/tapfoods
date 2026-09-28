package com.tap.utility;
import java.util.List;
import com.tap.DAOimp.UserDAOImpl;
import com.tap.model.User;

public class UserTest
{
	public static void main(String[] args) {

		UserDAOImpl userDAOImpl = new UserDAOImpl();

		// 1. Test addUser
		User user = new User("Sita","sita@gmail.com","pass123","BTM Layout","customer");

		int i = userDAOImpl.addUser(user);

		System.out.println(i);

		// 2. Test getUser
		//User user = userDAOImpl.getUser(1);
		//System.out.println(user);

		// 3. Test updateUser
		/*User user = userDAOImpl.getUser(1);
		if (user != null) {
			user.setUserMail("updated@gmail.com");
			userDAOImpl.updateUser(user);
		} else {
			System.out.println("User not found");
		}*/

		// 4. Test deleteUser
		//userDAOImpl.deleteUser(2);

		// 5. Test getAllUser
		/*List<User> list = userDAOImpl.getAllUser();
		for (User u : list) {
			System.out.println(u);
		}*/
	}
}