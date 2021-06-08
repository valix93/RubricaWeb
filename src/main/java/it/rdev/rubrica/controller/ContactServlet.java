package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet(urlPatterns = "/ContactServlet", name = "contactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ContactServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Contact> contacts = ContactDao.findAllCriteria();
		for(Contact c: contacts) {
			if(c.getEmails() != null) {
				
			}
			if(c.getPhones() != null) {
				
			}
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Contact> contactExist = ContactDao.findAll();
		String action = request.getParameter("action");
		String username = request.getParameter("username");
		boolean checkExist = false;
		Contact contact = null;
	    if (action != null) {
	    	for (Contact c : contactExist) {
	    		if (c.getName().equals(username)) {
	    			checkExist=true;
	    			contact = c;
	    			System.out.println(contact.getName() + " nome");
	    		}
    			break;
	    	}
	    	if (checkExist && contact!=null) {
		    	if (action.equals("modifica")) {
		    		// TODO modifica contatto selezionato
		    		ContactDao.update(contact);
		    	}
		    	else if (action.equals("cancella")){ 
		    		// TODO cancella contatto selezionato
		    		ContactDao.delete(contact);
		    	}
	    	}
	    }
		
		doGet(request, response);
	}

}
