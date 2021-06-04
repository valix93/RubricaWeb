package it.dev.rubrica.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		response.setContentType("text/html");

		String htmlApertura = "<html><head><title>";
		String contextPath = request.getContextPath().replace("/", "");
		String headChiusura = "</title></head>";
		String bodyApertura = "<body>";
		String inputApertura = "<input type=\"text\" value=\"";
		String inputChiusura = "\"/>";
		String htmlChiusura = "</body></html>";
		//esempio http://localhost:8080/RubricaWeb/?username=valix93&password=123
		response.getWriter().append(htmlApertura)
							.append(contextPath)
							.append(headChiusura)
							.append(bodyApertura)
							.append(inputApertura).append(username).append(inputChiusura)
							.append(inputApertura).append(password).append(inputChiusura)
							.append(htmlChiusura);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
