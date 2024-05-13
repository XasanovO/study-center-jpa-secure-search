package com.example.testjpa.servlets.group;

import com.example.testjpa.repo.GroupRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(value = "/group/delete")
public class DeleteGroupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        GroupRepo groupRepo = new GroupRepo();
        groupRepo.delete(Integer.parseInt(id));
        resp.sendRedirect("/admin/admin.jsp");
    }
}
