package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beanMethods.BeansImplementation;
import beanMethods.LoginValidation;
import beanMethods.RegisterValidation;
import beans.User;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Parameter "action" determines which jsp should be forwarded to
		String action = request.getParameter("action");
		
		//In case paremeter "action" is null, controller should forward to index (home page)
		if(action == null) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//Parameter "action" determines which jsp should be forwarded to
		String action = request.getParameter("action");
		
		//In case parameter "action" is null, controller should forward to index (home page)
		if(action == null) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		//In case parameter "action" is "dologin", controller should test if username and password are correct
		//If so, controller forwards to main page, else it brings client back to index page
		else if(action.equals("dologin")) {
			
			LoginValidation lv = new LoginValidation();
			try {
				if(lv.isUsernameValid(username)) {
					if(lv.isPasswordValid(password)) {
						ServletContext application = request.getServletContext();
						application.setAttribute("username", username);
						application.setAttribute("password", password);
						request.getRequestDispatcher("/phonebooker.jsp").forward(request, response);
					}
					else {
						request.setAttribute("failmessage", "Your password is incorrect!");
						request.getRequestDispatcher("/index.jsp").forward(request, response);
					}
				}
				else {
					request.setAttribute("failmessage", "Your username does not exist!");
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//In case parameter "action" is "doregister", controller should test if registration form is correct
		//Client gets message if registration was succesfull or not
		else if(action.equals("doregister")) {
			
			String regUsername = request.getParameter("username");
			String regPassword = request.getParameter("password");
			String regName = request.getParameter("name");
			String regSurname = request.getParameter("surname");
			String regDob = request.getParameter("birthDate");
			if(regDob.equals("")) {
				regDob = null;
			}
			String regEmail = request.getParameter("email");
			String regPhone = request.getParameter("phone");
			String repeatPassword = request.getParameter("repeatPassword");
			
			User regUser = new User(regUsername, regPassword, regName, regSurname, regDob, regEmail, regPhone);
			RegisterValidation rv = new RegisterValidation(regUser, repeatPassword);
			
			if(rv.isValid()) {
				BeansImplementation bi = new BeansImplementation();
				try {
					bi.addUser(regUser);
					request.setAttribute("message", rv.getMessage());
				} catch (SQLException e) {
					request.setAttribute("failmessage", "Registration was unsuccesfull!");
				}
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			else {
				request.setAttribute("message", rv.getMessage());
				request.getRequestDispatcher("/register.jsp").forward(request, response);
			}
			
		}
	}

}
