package epsi.front;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;

import epsi.dao.PanierContientHome;
import epsi.dao.PanierHome;
import epsi.dao.PlatHome;
import epsi.dao.TraiteurHome;
import epsi.exception.PlatNotFoundException;
import epsi.model.Panier;
import epsi.model.PanierContient;
import epsi.model.Plat;
import epsi.model.Produit;
import epsi.model.Traiteur;
import epsi.model.User;

/**
 * Servlet implementation class TraiteurServlet
 */

public class PlatTraiteurServlet extends HttpServlet {

	@Override
	public void init() throws ServletException {
		System.out.println("init: loading plat servlet");
		super.init();
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			TraiteurHome traiteurDAO = new TraiteurHome();
			PlatHome platDAO = new PlatHome();
			int id_traiteur =  Integer.parseInt(req.getParameter("id")); 
			List<Traiteur> traits = traiteurDAO.find();
			Traiteur traiteur = null;
			
			PanierHome panDAO = new PanierHome();
			PanierContientHome PCHDAO = new PanierContientHome();
			
			User us = (User) req.getSession().getAttribute("user");
			
			try{
				Panier panier = panDAO.findByUser(us);
				List<PanierContient> PC = PCHDAO.findAllPanier(panier);
				ArrayList<Long> plats = new ArrayList<Long>();
				
				for(Iterator<PanierContient> i = PC.iterator(); i.hasNext(); ){
					PanierContient panierList = i.next();
					
					Plat plat = platDAO.findById(panierList.getProduit().getIdProduit());
					plats.add(plat.getIdProduit());
					System.out.println("Coucou " + plat.getDesignation());
				}
				req.setAttribute("panier", plats);
			} catch(Exception e){
				e.printStackTrace();
			}
			
			for(Traiteur letrait : traits)
			{
				if(id_traiteur == letrait.getIdTraiteur())
				{
					traiteur = letrait;
				}
			}

			List<Plat> listplats = new ArrayList<Plat>();
			Set<Produit> lesprod = traiteur.getProduits();
			
			for(Produit leprod: lesprod)
			{	
				Plat leplat = platDAO.findById(leprod.getIdProduit());
				listplats.add(leplat);
			}
			
			req.setAttribute("plat", listplats);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/plattraiteur.jsp");
			dispatcher.forward(req, resp);
		} catch (PlatNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		this.doGet(request,response);
	}

}
