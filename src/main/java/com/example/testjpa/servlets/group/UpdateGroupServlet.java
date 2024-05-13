package com.example.testjpa.servlets.group;

import com.example.testjpa.entity.Group;
import com.example.testjpa.repo.GroupRepo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(value = "/group/update")
public class UpdateGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String id = req.getParameter("id");
        int groupId = Integer.parseInt(id);

        Group group = new Group();
        group.setName(name);
        group.setId(groupId);

        GroupRepo groupRepo = new GroupRepo();
        groupRepo.update(group);
        resp.sendRedirect("/admin/admin.jsp");
    }
}
