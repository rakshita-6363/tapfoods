package com.tap.utility;

import java.util.List;
import com.tap.DAOimp.MenuDAOImpl;
import com.tap.model.Menu;

public class MenuTest
{
	public static void main(String[] args) {

		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();

		// 1. Test addMenu
		//Menu menu = new Menu(1,"Chicken Biryani","Spicy and flavorful biryani",220.00,true,"biryani.jpg");
		//menuDAOImpl.addMenu(menu);

		// 2. Test getMenu
		//Menu menu = menuDAOImpl.getMenu(1);
		//System.out.println(menu);

		// 3. Test updateMenu
		/*Menu menu = menuDAOImpl.getMenu(1);
		if (menu != null) {
			menu.setPrice(250.00);
			menu.setAvailable(false);
			menuDAOImpl.updateMenu(menu);
		} else {
			System.out.println("Menu not found");
		}*/

		// 4. Test deleteMenu
		//menuDAOImpl.deleteMenu(2);

		// 5. Test getAllMenu
		List<Menu> list = menuDAOImpl.getAllMenu(1);
		for (Menu m : list) {
			System.out.println(m);
		}
	}
}