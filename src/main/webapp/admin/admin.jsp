<%@ page import="com.example.testjpa.entity.User" %>
<%@ page import="com.example.testjpa.entity.enums.Role" %>
<%@ page import="com.example.testjpa.repo.GroupRepo" %>
<%@ page import="com.example.testjpa.repo.StudentRepo" %>
<%@ page import="com.example.testjpa.entity.Group" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.testjpa.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 12.05.2024
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    User currentUser = (User) session.getAttribute("user");
    GroupRepo groupRepo = new GroupRepo();
    StudentRepo studentRepo = new StudentRepo();
    List<Group> groups = groupRepo.findAll();
    List<Student> students = studentRepo.findAll();
%>

<div class="row">
    <div class="col-5">
        <h1 class="bg-dark form-control text-center text-white">Groups</h1>
        <a href="/admin/addGroup.jsp">
            <button class="btn btn-dark">Add Group</button>
        </a>
        <table class="table table-striped">
            <thead>
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Action</td>
            </tr>
            </thead>

            <tbody>
            <%for (Group group : groups) {%>
            <tr>
                <td><%=group.getId()%></td>
                <td><%=group.getName()%></td>
                <td>
                    <a href="addGroup.jsp?id=<%=group.getId()%>">
                        <button class="btn btn-info">edit</button>
                    </a>

                    <a href="/group/delete?id=<%=group.getId()%>">
                        <button class="btn btn-danger">delete</button>
                    </a>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
    <%if (currentUser != null && currentUser.getRole().equals(Role.ADMIN)) {%>
    <a href="/">
        <button class="btn btn-success">Home</button>
    </a>
    <%}%>
    <div class="col-5">
        <h1 class="bg-dark form-control text-center text-white">Students</h1>
        <a href="/admin/addStudent.jsp">
            <button class="btn btn-dark">Add Student</button>
        </a>
        <table class="table table-striped">
            <thead>
            <tr>
                <td>Id</td>
                <td>FirstName</td>
                <td>LastName</td>
                <td>Group</td>
                <td>Action</td>
            </tr>
            </thead>
            <tbody>
            <%for (Student student : students) {%>
            <tr>
                <td><%=student.getId()%></td>
                <td><%=student.getFirstName()%></td>
                <td><%=student.getLastName()%></td>
                <td><%=student.getGroup().getName()%></td>
                <td>
                    <a href="addStudent.jsp?id=<%=student.getId()%>">
                        <button class="btn btn-info">edit</button>
                    </a>
                    <a href="/student/delete?id=<%=student.getId()%>">
                        <button class="btn btn-danger">delete</button>
                    </a>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
