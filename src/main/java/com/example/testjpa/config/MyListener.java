package com.example.testjpa.config;


import com.example.testjpa.entity.User;
import com.example.testjpa.entity.enums.Role;
import com.example.testjpa.repo.BaseRepo;
import com.example.testjpa.repo.UserRepo;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class MyListener implements ServletContextListener {

    public static EntityManagerFactory emf;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        emf = Persistence.createEntityManagerFactory("test_jpa");
        saveAdminUser();
        ServletContextListener.super.contextInitialized(sce);
    }

    private void saveAdminUser() {
        UserRepo userRepo = new UserRepo();
        userRepo.save(
                new User(Role.ADMIN, "ox1213982@gmail.com", "Admin", "root123")
        );
    }
}
