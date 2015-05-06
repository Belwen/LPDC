package epsi.dao;

// Generated 6 mai 2015 11:18:39 by Hibernate Tools 3.4.0.CR1

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import epsi.model.Produit;
/**
 * Home object for domain model class Produit.
 * @see epsi.model.Produit
 * @author Hibernate Tools
 */
public class ProduitHome {


	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Produit transientInstance) {
		try {
			entityManager.persist(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void remove(Produit persistentInstance) {
		try {
			entityManager.remove(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Produit merge(Produit detachedInstance) {
		try {
			Produit result = entityManager.merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Produit findById(Integer id) {
		try {
			Produit instance = entityManager.find(Produit.class, id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
