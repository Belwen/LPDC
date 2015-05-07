package epsi.dao;

// Generated 6 mai 2015 11:18:39 by Hibernate Tools 3.4.0.CR1

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import epsi.model.Menu;

/**
 * Home object for domain model class Menu.
 * @see epsi.model.Menu
 * @author Hibernate Tools
 */
public class MenuHome {


	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Menu transientInstance) {
		try {
			entityManager.persist(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void remove(Menu persistentInstance) {
		try {
			entityManager.remove(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Menu merge(Menu detachedInstance) {
		try {
			Menu result = entityManager.merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Menu findById(int id) {
		try {
			Menu instance = entityManager.find(Menu.class, id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
