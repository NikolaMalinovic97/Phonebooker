package beanMethods;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.User;

public class LoginValidation {
	
	private int index = -1;
	BeansImplementation bi = new BeansImplementation();

	//Method that checks if input username exists in database
	public boolean isUsernameValid(String username) throws SQLException {
		
		String inputUsername = username;
		
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
	public boolean isPasswordValid(String password) throws SQLException {
		
		String inputPassword = password;
		
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
