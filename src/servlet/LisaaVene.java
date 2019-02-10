package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Vene;

@WebServlet("/LisaaVene")
public class LisaaVene extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LisaaVene() {
        super();
        System.out.println("LisaaVene.LisaaVene()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaVene.doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaVene.doPost()");
		String nimi = request.getParameter("nimi");
		String merkkimalli = request.getParameter("merkkimalli");
		double pituus = Double.parseDouble(request.getParameter("pituus"));
		double leveys = Double.parseDouble(request.getParameter("leveys"));
		int hinta = Integer.parseInt(request.getParameter("hinta"));
		// ARVO 1, jotta näkyy listauksessa
		int tila = 1;	
		Vene lisattava = new Vene(nimi, merkkimalli, pituus, leveys, hinta, tila);
		Dao dao = new Dao();
		if(dao.lisaaVene(lisattava)){
			response.sendRedirect("lisaavene.jsp?ilmo=1");
		}else{
			response.sendRedirect("lisaavene.jsp?ilmo=0");
		}
	}

}
