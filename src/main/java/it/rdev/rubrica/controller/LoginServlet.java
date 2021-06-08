package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.rdev.rubrica.dto.User;
import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User()
				.setPassword(request.getParameter("password"))
				.setUsername(request.getParameter("username"));
				
		List<Contact> contactExist = ContactDao.findByName(user.getUsername());
		if (contactExist!=null && contactExist.size()>=1) {
			if (contactExist.get(0).getSurname().equals(user.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("USER", user);
			}
			else {
				// TODO password errata
			}
		} else {
			// TODO utente non presente nel db
		}
		
		String action = request.getParameter("action");
		if(action != null && action.equals("logout") ) {
			HttpSession session = request.getSession();
			session.invalidate();
		}
		
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
