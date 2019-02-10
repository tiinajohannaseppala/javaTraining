package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Vene;

@WebServlet("/MuutaVene")
public class MuutaVene extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MuutaVene() {
        super();
        System.out.println("MuutaVene.MuutaVene()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaVene.doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaVene.doPost()");
		int tunnus = Integer.parseInt(request.getParameter("tunnus"));
		String nimi = request.getParameter("nimi");
		String merkkimalli = request.getParameter("merkkimalli");
		Double pituus = Double.parseDouble(request.getParameter("pituus"));
		Double leveys = Double.parseDouble(request.getParameter("leveys"));
		int hinta = Integer.parseInt(request.getParameter("hinta"));
		int tila = Integer.parseInt(request.getParameter("tila"));
		Vene muutettava = new Vene(tunnus, nimi, merkkimalli, pituus, leveys, hinta, tila);
		Dao dao = new Dao();		
		dao.muutaVene(muutettava);
		response.sendRedirect("HaeVeneet");		
	}

}
