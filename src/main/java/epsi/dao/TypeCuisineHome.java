package epsi.dao;

// Generated 6 mai 2015 11:18:39 by Hibernate Tools 3.4.0.CR1

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import epsi.model.TypeCuisine;

/**
 * Home object for domain model class TypeCuisine.
 * @see epsi.model.TypeCuisine
 * @author Hibernate Tools
 */
public class TypeCuisineHome {


	@PersistenceContext
	private EntityManager entityManager;

	public void persist(TypeCuisine transientInstance) {
		try {
			entityManager.persist(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void remove(TypeCuisine persistentInstance) {
		try {
			entityManager.remove(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public TypeCuisine merge(TypeCuisine detachedInstance) {
		try {
			TypeCuisine result = entityManager.merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public TypeCuisine findById(Integer id) {
		try {
			TypeCuisine instance = entityManager.find(TypeCuisine.class, id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
