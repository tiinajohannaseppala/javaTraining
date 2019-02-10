package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

@WebServlet("/TarkistaKirjautuminen")
public class TarkistaKirjautuminen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TarkistaKirjautuminen() {
        super();
        System.out.println("TarkistaKirjautuminen.TarkistaKirjautuminen()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TarkistaKirjautuminen.doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TarkistaKirjautuminen.doPost()");
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		Dao dao = new Dao();
		String name = dao.login(user_id, password);
		if(name!=null){
			HttpSession session = request.getSession(true);
			session.setAttribute("kayttaja", name);
			response.sendRedirect("haeveneet.jsp");
		}else{
			response.sendRedirect("index.jsp?login=0");
		}
	}

}
