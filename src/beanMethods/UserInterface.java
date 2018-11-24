package beanMethods;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.User;

public interface UserInterface {

	//Method to get all users
	public ArrayList<User> getUsers() throws SQLException;
		
	//Method to get a specific user
	public User getUser(String username) throws SQLException;
	
	//Method to update a specific user
	public void updateUser(User oldUser, User newUser) throws SQLException;
	
	//Method to add a user
	public void addUser(User user) throws SQLException;
	
}
