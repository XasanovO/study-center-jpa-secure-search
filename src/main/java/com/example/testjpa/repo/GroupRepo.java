package com.example.testjpa.repo;

import com.example.testjpa.entity.Group;
import com.example.testjpa.entity.Student;
import jakarta.persistence.TypedQuery;

import java.util.List;

import static com.example.testjpa.config.MyListener.emf;

public class GroupRepo extends BaseRepo<Group, Integer> {
    public List<Group> findGroupsByName(String search) {
        String queryString = "SELECT s FROM Group s WHERE s.name LIKE :name";
        TypedQuery<Group> query = emf.createEntityManager().createQuery(queryString, Group.class);
        query.setParameter("name", "%" + search + "%");
        return query.getResultList();
    }
}
