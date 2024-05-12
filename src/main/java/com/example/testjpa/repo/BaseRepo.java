package com.example.testjpa.repo;

import java.util.List;

public class BaseRepo<Type, ID> {
    public void save(Type entity) {

    }

    public void delete(Type entity) {

    }

    public Type findById(ID id) {
        return null;
    }
    public List<Type> findAll() {
        return null;
    }
}
