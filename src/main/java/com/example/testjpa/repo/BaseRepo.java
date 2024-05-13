package com.example.testjpa.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import static com.example.testjpa.config.MyListener.emf;

public class BaseRepo<Type, ID> {

    private Class<Type> typeClass;

    public BaseRepo() {
        typeClass = (Class<Type>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }


    public void save(Type entity) {
        EntityManager entityManager = emf.createEntityManager();
        entityManager.persist(entity);
    }

    public void delete(ID id) {
        EntityManager entityManager = emf.createEntityManager();
        entityManager.remove(entityManager.find(typeClass, id));
    }

    public Type findById(ID id) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Type entity = entityManager.find(typeClass, id);
            transaction.commit();
            return entity;
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
        throw new RuntimeException("couldn't find entity with id: " + id);
    }

    public void update(Type entity, ID id) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Type type = entityManager.find(typeClass, id);
            entityManager.merge(entity);
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }

    public List<Type> findAll() {
        EntityManager entityManager = emf.createEntityManager();
        return entityManager.createQuery("from " + typeClass + " t", typeClass).getResultList();
    }

}
