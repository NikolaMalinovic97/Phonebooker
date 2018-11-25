package beanMethods;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.User;

public class RegisterValidation {

	private String message;
	private String username;
	private String password;
	private String repeatPassword;
	private String name;
	private String surname;
	private String email;
	private String phone;
	
	public RegisterValidation(User user, String repeatPassword) {
		this.message = null;
		this.username = user.getUsername();
		this.password = user.getPassword();
		this.repeatPassword = repeatPassword;
		this.name = user.getName();
		this.surname = user.getSurname();
		this.email = user.getEmail();
		this.phone = user.getPhone();
	}
	
	public String getMessage() {
		return this.message;
	}

	//Method that checks if registration form i correct
	public boolean isValid() {
		
		if(! isUsernameVaild()) {
			return false;
		}
		else if(! isPasswordValid()) {
			return false;
		}
		else if(! isNameValid()) {
			return false;
		}
		else if(! isSurnameValid()) {
			return false;
		}
		else if(! isEmailValid()) {
			return false;
		}
		else if(! isPhoneValid()) {
			return false;
		}
		
		message = "Registration was succesfull!";
		return true;
	}

	//Method that checks if username is valid and correct
	private boolean isUsernameVaild() {
		
		if(username == null) {
			message = "Username is required!";
			return false;
		}
		else if(username.length() < 6 || username.length() > 40) {
			message = "Username must have between 6 and 20 characters!";
			return false;
		}
		
		for (int i = 0; i < username.length(); i++) {
			char c = username.charAt(i);
			if( ! (Character.isLetterOrDigit(c) || c == '_' )) {
				message = "Username must contain only out of letters, digits and underline symbol ('_') !";
				return false;
			}
		}
		
		BeansImplementation bi = new BeansImplementation();
		ArrayList<User> users;
		try {
			users = bi.getUsers();
			for (User u: users) {
				if(username.equals(u.getUsername())) {
					message = "Username already exists!";
					return false;
				}
			}
		} catch (SQLException e) {
			message = "Error!";
			return false;
		}
		
		return true;
	}
	
	//Method that checks if password is entered correctly
	private boolean isPasswordValid() {
		
		if(password == null) {
			message = "Password is required!";
			return false;
		}
		else if(password.length() < 6 || password.length() > 20) {
			message = "Password must have between 6 and 20 characters!";
			return false;
		}
		else if(! password.equals(repeatPassword)) {
			message = "Password's don't match!";
			return false;
		}
		
		return true;
	}
	
	//Method that checks if name is entered correctly
	private boolean isNameValid() {
		
		if(name.length() > 40) {
			message = "Name can't be longer than 40 characters!";
			return false;
		}
		
		return true;
	}
	
	//Method that checks if surname is entered correctly
	private boolean isSurnameValid() {
		
		if(surname.length() > 40) {
			message = "Surname can't be longer than 40 characters!";
			return false;
		}
		
		return true;
	}
	
	//Method that checks if email is entered correctly
	private boolean isEmailValid() {
		
		if(email == null || email.equals("")) {
			return true;
		}
		if(email.length() > 254) {
			return false;
		}
		for (int i = 0; i < email.length(); i++) {
			if(email.charAt(i) == '@') {
				return true;
			}
		}
		return false;
	}
	
	//Method that checks if phone number is entered correctly
	private boolean isPhoneValid() {
		
		if(phone == null || phone.equals("")) {
			return true;
		}
		
		char c;		
		for (int i = 0; i < phone.length(); i++) {
			c = phone.charAt(i);
			if(! (c == '+' || c == '-' || Character.isDigit(c) ))  {
				message = "Phone number must contain out of digits or plus symbol ('+') or minus simybol ('-')!";
				return false;
			}
		}
		return true;
	}
}
