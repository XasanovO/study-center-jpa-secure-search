<%@ page import="com.example.testjpa.repo.GroupRepo" %>
<%@ page import="com.example.testjpa.repo.StudentRepo" %>
<%@ page import="com.example.testjpa.entity.Group" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.testjpa.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 12.05.2024
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<%
    GroupRepo groupRepo = new GroupRepo();
    List<Group> groups = groupRepo.findAll();
    String id = request.getParameter("id");
    StudentRepo studentRepo = new StudentRepo();
    Student student = null;
    if (id != null) {
        student = studentRepo.findById(Integer.parseInt(id));
    }
%>

<body>
<div class="container mt-5">
    <h1><%=student != null ? "Update Student" : "Add Student"%>
    </h1>
    <form action="<%=student != null?"/student/update":"/student/add"%>" method="POST">
        <%if (student != null) {%>
        <input type="hidden" value="<%=student.getId()%>" name="id">
        <%}%>
        <div class="mb-3">
            <label for="firstName" class="form-label">First Name</label>
            <input value="<%=student != null? student.getFirstName():""%>" type="text" class="form-control"
                   id="firstName" name="firstName">
        </div>
        <div class="mb-3">
            <label for="lastName" class="form-label">Last Name</label>
            <input value="<%=student != null? student.getLastName():""%>" type="text" class="form-control" id="lastName"
                   name="lastName">
        </div>
        <!-- Group input -->
        <div class="mb-3">
            <label for="group" class="form-label">Group</label>
            <select class="form-select" id="group" name="groupId">
                <option value="<%=student != null?student.getGroup().getId():groups.get(0).getId()%>"><%=student != null ? student.getGroup().getName() : groups.get(0).getName()%>
                </option>
                <%for (Group group : groups) {%>
                <option value="<%=group.getId()%>"><%=group.getName()%>
                </option>
                <%}%>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
