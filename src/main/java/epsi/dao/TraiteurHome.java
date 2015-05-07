package epsi.dao;

// Generated 6 mai 2015 11:18:39 by Hibernate Tools 3.4.0.CR1

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import epsi.model.Traiteur;

/**
 * Home object for domain model class Traiteur.
 * @see epsi.model.Traiteur
 * @author Hibernate Tools
 */
public class TraiteurHome {


	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Traiteur transientInstance) {
		try {
			entityManager.persist(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void remove(Traiteur persistentInstance) {
		try {
			entityManager.remove(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Traiteur merge(Traiteur detachedInstance) {
		try {
			Traiteur result = entityManager.merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Traiteur findById(Integer id) {
		try {
			Traiteur instance = entityManager.find(Traiteur.class, id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
