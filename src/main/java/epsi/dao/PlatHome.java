package epsi.dao;

// Generated 6 mai 2015 11:18:39 by Hibernate Tools 3.4.0.CR1

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import epsi.model.Plat;

/**
 * Home object for domain model class Plat.
 * @see epsi.model.Plat
 * @author Hibernate Tools
 */
public class PlatHome {


	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Plat transientInstance) {
		try {
			entityManager.persist(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void remove(Plat persistentInstance) {
		try {
			entityManager.remove(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Plat merge(Plat detachedInstance) {
		try {
			Plat result = entityManager.merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Plat findById(int id) {
		try {
			Plat instance = entityManager.find(Plat.class, id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
