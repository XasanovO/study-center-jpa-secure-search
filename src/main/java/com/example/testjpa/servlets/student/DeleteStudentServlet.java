package com.example.testjpa.servlets.student;

import com.example.testjpa.repo.StudentRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/student/delete")
public class DeleteStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        StudentRepo studentRepo = new StudentRepo();
        studentRepo.delete(Integer.parseInt(id));
        resp.sendRedirect("/admin/admin.jsp");
    }
}
