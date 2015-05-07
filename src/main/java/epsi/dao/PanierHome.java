package epsi.dao;

// Generated 6 mai 2015 11:18:39 by Hibernate Tools 3.4.0.CR1

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import epsi.model.Panier;

/**
 * Home object for domain model class Panier.
 * @see epsi.model.Panier
 * @author Hibernate Tools
 */
public class PanierHome {


	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Panier transientInstance) {
		try {
			entityManager.persist(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void remove(Panier persistentInstance) {
		try {
			entityManager.remove(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Panier merge(Panier detachedInstance) {
		try {
			Panier result = entityManager.merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Panier findById(Integer id) {
		try {
			Panier instance = entityManager.find(Panier.class, id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
