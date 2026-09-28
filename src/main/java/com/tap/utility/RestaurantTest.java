package com.tap.utility;

import java.util.List;
import com.tap.DAOimp.RestaurantDAOImpl;
import com.tap.model.Restaurant;

public class RestaurantTest
{
	public static void main(String[] args) {

		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();

		// 1. Test addRestaurant
		//Restaurant restaurant = new Restaurant("Meghana Foods","Andhra",30,"Koramangala",true,"meghana.jpg");
		//restaurantDAOImpl.addRestaurant(restaurant);

		// 2. Test getRestaurant
		//Restaurant restaurant = restaurantDAOImpl.getRestaurant(1);
		//System.out.println(restaurant);

		// 3. Test updateRestaurant
		/*Restaurant restaurant = restaurantDAOImpl.getRestaurant(1);
		if (restaurant != null) {
			restaurant.setDeliveryTime(25);
			restaurantDAOImpl.updateRestaurant(restaurant);
		} else {
			System.out.println("Restaurant not found");
		}*/

		// 4. Test deleteRestaurant
		//restaurantDAOImpl.deleteRestaurant(2);

		// 5. Test getAllRestaurant
		List<Restaurant> list = restaurantDAOImpl.getAllRestaurant();
		for (Restaurant r : list) {
			System.out.println(r);
		}
	}
}