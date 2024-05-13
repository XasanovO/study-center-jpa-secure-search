package com.example.testjpa.repo;

import com.example.testjpa.entity.Student;
import jakarta.persistence.TypedQuery;

import java.util.List;

import static com.example.testjpa.config.MyListener.emf;

public class StudentRepo extends BaseRepo<Student, Integer> {
    public List<Student> findStudentsByName(String search) {
        String queryString = "SELECT s FROM Student s WHERE s.firstName LIKE :name OR s.lastName LIKE :name";
        TypedQuery<Student> query = emf.createEntityManager().createQuery(queryString, Student.class);
        query.setParameter("name", "%" + search + "%");
        return query.getResultList();
    }
}
