package com.example.demotest.repositories;

import jakarta.persistence.EntityManager;


public class MainRepository {
    private EntityManager entityManager;

    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    public Object find(Class<?> clazz, Integer id) {
        return getEntityManager().find(clazz, id);
    }
}
