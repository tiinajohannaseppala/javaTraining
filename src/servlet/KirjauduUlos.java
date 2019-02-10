package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/KirjauduUlos")
public class KirjauduUlos extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public KirjauduUlos() {
        super();
        System.out.println("KirjauduUlos.KirjauduUlos()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("KirjauduUlos.doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("KirjauduUlos.doPost()");
		HttpSession session = request.getSession();
	    if (session != null) {
	         session.invalidate();
	         response.sendRedirect("index.jsp");
	    }
	}
}
