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


@WebServlet(value = "/student/update")
public class UpdateStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentId = req.getParameter("id");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String groupId = req.getParameter("groupId");

        GroupRepo groupRepo = new GroupRepo();
        Group group = groupRepo.findById(Integer.parseInt(groupId));

        Student student = Student.builder()
                .firstName(firstName)
                .lastName(lastName)
                .group(group)
                .build();
        student.setId(Integer.parseInt(studentId));

        StudentRepo studentRepo = new StudentRepo();
        studentRepo.update(student);
        resp.sendRedirect("/admin/admin.jsp");
    }
}
