package epsi.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;

import epsi.dao.PlatHome;
import epsi.dao.TypeCuisineHome;
import epsi.exception.PlatNotFoundException;
import epsi.model.Plat;
import epsi.model.TypeCuisine;

public class PlatServlet extends HttpServlet{
	
	@Override
	public void init() throws ServletException {
		System.out.println("init: loading plat servlet");
		super.init();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("GET /plats");
		PlatHome platDao = new PlatHome();
		TypeCuisineHome TCH = new TypeCuisineHome();
		
		System.out.println("go before try doGet");		
		try{
			System.out.println("go in try doGet");
			
			Long id_Produit = Long.valueOf(req.getParameter("id"));	
			Hibernate.initialize(platDao);
			
			Plat plat = platDao.findById(id_Produit);
			Hibernate.initialize(TCH);
			//int TCid = plat.getTypeCuisine().getIdTypeCuisine();
			
			
			TypeCuisine TC = plat.getTypeCuisine();
			int TCid =TC.getIdTypeCuisine();
			System.out.println(TCid);
			
			//TypeCuisine TC = plat.getTypeCuisine();
			
			String typecuisine = TC.getDesignationTypeCuisine();
			System.out.println(TC.getDesignationTypeCuisine());
			req.setAttribute("plat", plat);
			req.setAttribute("typecuis", typecuisine);

			RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/plat.jsp");
			dispatcher.forward(req, resp);
		}
		catch(NumberFormatException nfe){
			System.err.println(nfe);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/static/404.html");
			dispatcher.forward(req, resp);
		}catch(PlatNotFoundException anfe){
			System.err.println(anfe);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/static/404.html");
			dispatcher.forward(req, resp);
		}
	}
	
}
