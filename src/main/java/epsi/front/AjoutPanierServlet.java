package epsi.front;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import epsi.model.User;

/**
 * Servlet implementation class AjoutPanierServlet
 */
@WebServlet("/AjoutPanierServlet")
public class AjoutPanierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutPanierServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String nom = request.getParameter( CHAMP_NOM );
	        String prenom = request.getParameter( CHAMP_PRENOM );
	        String adresse = request.getParameter( CHAMP_ADRESSE );


	        String message;
	        boolean erreur;
	        
	        User user = null;
	        if ( nom.trim().isEmpty() || adresse.trim().isEmpty() || telephone.trim().isEmpty() || mdp.trim().isEmpty() || email.trim().isEmpty() ) {
	        	message = "Erreur- Vous n'avez pas rempli tous les champs obligatoires.";
	            erreur = true;
	            request.setAttribute( ATT_CLIENT, user );
		        request.setAttribute( ATT_MESSAGE, message );
		        request.setAttribute( ATT_ERREUR, erreur );
	            this.getServletContext().getRequestDispatcher( ERREUR ).forward( request, response );
	            
	        } 
	        else if (mdp.contentEquals(mdp2))
	        {
	            message = "Nous avons bien recu votre demande d'inscription. Veuilez dès à present vous connecter juste au dessus.";
	            erreur = false;
	            
	            user = new User();
	            user.setNom( nom );
	            user.setPrenom( prenom );
	            user.setAdresse( adresse );
	            user.setTelephone( telephone );
	            user.setEmail( email );
	            user.setPassword( mdp );
	            user.setDateNaissance( datenaiss );
	            
	            
	    		EntityManagerFactory emf = Persistence.createEntityManagerFactory("musciPU");
	    		EntityManager em = emf.createEntityManager();
	    		
	    		EntityTransaction transaction = em.getTransaction();
	    		transaction.begin();
	    		
	    		em.persist(user);
	    		transaction.commit();
	    		
	    		request.setAttribute( ATT_CLIENT, user );
		        request.setAttribute( ATT_MESSAGE, message );
		        request.setAttribute( ATT_ERREUR, erreur );
		        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
	           
	        }
	        else
	        {
	        	message = "Erreur - vos mots de passes ne sont pas identiques.";
	        	erreur = true;
	        	request.setAttribute( ATT_CLIENT, user );
		        request.setAttribute( ATT_MESSAGE, message );
		        request.setAttribute( ATT_ERREUR, erreur );
	        	this.getServletContext().getRequestDispatcher( ERREUR ).forward( request, response );
	        	
	        }
	        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
