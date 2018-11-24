package beanMethods;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.User;

public class LoginValidation {
	
	private int index = -1;

	//Method that checks if input username exists in database
	public boolean isUsernameValid(User user) throws SQLException {
		
		String inputUsername = user.getUsername();
		
		BeansImplementation bi = new BeansImplementation();
		
		ArrayList<User> users = bi.getUsers();
		
		for (int i = 0; i < users.size(); i++) {
			String targetUsername = users.get(i).getUsername();
			if(inputUsername.equals(targetUsername)) {
				index = i;
				return true;
			}
		}
		
		return false;
	}
	
	//Method that checks if password corresponds username
	public boolean isPasswordValid(User user) throws SQLException {
		
		String inputPassword = user.getPassword();
		
		BeansImplementation bi = new BeansImplementation();
		
		ArrayList<User> users = bi.getUsers();
		String targetPassword = users.get(index).getPassword();
		
		if(index == -1) {
			return false;
		}
		else if(inputPassword.equals(targetPassword)) {
			return true;
		}
		
		return false;
	}
}
