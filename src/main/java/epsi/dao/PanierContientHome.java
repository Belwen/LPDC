package epsi.dao;

// Generated 6 mai 2015 11:18:39 by Hibernate Tools 3.4.0.CR1

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import epsi.model.PanierContient;
import epsi.model.PanierContientId;

/**
 * Home object for domain model class PanierContient.
 * @see epsi.model.PanierContient
 * @author Hibernate Tools
 */
public class PanierContientHome {


	@PersistenceContext
	private EntityManager entityManager;

	public void persist(PanierContient transientInstance) {
		try {
			entityManager.persist(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void remove(PanierContient persistentInstance) {
		try {
			entityManager.remove(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public PanierContient merge(PanierContient detachedInstance) {
		try {
			PanierContient result = entityManager.merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public PanierContient findById(PanierContientId id) {
		try {
			PanierContient instance = entityManager.find(PanierContient.class,
					id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
