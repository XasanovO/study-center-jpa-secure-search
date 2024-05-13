package com.example.testjpa.servlets.student;

import com.example.testjpa.entity.Group;
import com.example.testjpa.entity.Student;
import com.example.testjpa.repo.GroupRepo;
import com.example.testjpa.repo.StudentRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/student/add")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String groupId = req.getParameter("groupId");

        GroupRepo groupRepo = new GroupRepo();
        Group group = groupRepo.findById(Integer.parseInt(groupId));

        StudentRepo studentRepo = new StudentRepo();
        studentRepo.save(Student.builder()
                .firstName(firstName)
                .lastName(lastName)
                .group(group)
                .build()
        );
        resp.sendRedirect("/admin/admin.jsp");
    }
}
