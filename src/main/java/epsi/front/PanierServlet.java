package epsi.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import epsi.dao.PanierContientHome;
import epsi.dao.PanierHome;
import epsi.dao.PlatHome;
import epsi.dao.UserDao;
import epsi.exception.PlatNotFoundException;
import epsi.exception.UserNotFoundException;
import epsi.model.Panier;
import epsi.model.PanierContient;
import epsi.model.Plat;
import epsi.model.Produit;
import epsi.model.User;

/**
 * Servlet implementation class panierServlet
 */
@WebServlet("/panierServlet")
public class PanierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PanierServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao usDAO = new UserDao();
		PanierHome panDAO = new PanierHome();
		PanierContientHome PCHDAO = new PanierContientHome();
		PlatHome platDAO = new PlatHome();
		System.out.println("go before try doGet");		
		try{
			System.out.println("go in try doGet");
			
			
			User us = (User) req.getSession().getAttribute("user");
			
			Panier panier = panDAO.findByUser(us);
			// ca marchait avant ça
			PanierContient PC = PCHDAO.findByPanier(panier);
			System.out.println("tamre");
			
			Plat leplat = platDAO.findById(PC.getProduit().getIdProduit());
			
			req.setAttribute("plat", leplat);
			// ca marchait après ça
			req.setAttribute("panier", panier);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/panier.jsp");
			dispatcher.forward(req, resp);
		}
		catch(NumberFormatException nfe){
			System.err.println(nfe);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/static/404.html");
			dispatcher.forward(req, resp);
		}catch(UserNotFoundException anfe){
			System.err.println(anfe);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/static/404.html");
			dispatcher.forward(req, resp);
		} catch (PlatNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		this.doGet(req, resp);
		
	}

}
