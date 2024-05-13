<%@ page import="com.example.testjpa.entity.User" %>
<%@ page import="com.example.testjpa.entity.enums.Role" %>
<%@ page import="com.example.testjpa.repo.StudentRepo" %>
<%@ page import="com.example.testjpa.entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ox121
  Date: 12.05.2024
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<%
    User currentUser = (User) session.getAttribute("user");
    String search = request.getParameter("search");
    StudentRepo studentRepo = new StudentRepo();
    List<Student> students = studentRepo.findAll();
    if (search != null) {
       students = studentRepo.findStudentsByName(search);
    }
%>
<body>
<div class="row">
    <div class="col-3 bg-dark text-white" style="height: 100vh">
        <ul class="list-group">
            <a href="/home/student.jsp">
                <li class="list-group-item">Students</li>
            </a>
            <a href="/home/group.jsp">
                <li class="list-group-item">Groups</li>
            </a>
        </ul>
    </div>
    <div class="col-9">
        <%if (currentUser != null && currentUser.getRole().equals(Role.ADMIN)) {%>
        <a href="/admin/admin.jsp">
            <button class="btn btn-success">Admin</button>
        </a>
        <%} else {%>
        <a href="/auth/login.jsp">
            <button class="btn btn-success">Login</button>
        </a>
        <%}%>
        <h1 class="text-center bg-dark text-white">students</h1>
        <form>
            <input class="form-control" value="<%=search != null? search:""%>" type="text" name="search">
            <button class="btn btn-success">search</button>
        </form>
        <table class="table table-striped">
            <thead>
            <tr>
                <td>Id</td>
                <td>FirstName</td>
                <td>LastName</td>
                <td>Group</td>
            </tr>
            </thead>
            <tbody>
                <% for (Student student : students) { %>
                    <tr>
                        <td><%=student.getId()%></td>
                        <td><%=student.getFirstName()%></td>
                        <td><%=student.getLastName()%></td>
                        <td><%=student.getGroup().getName()%></td>
                    </tr>
                <%}%>
            </tbody>

        </table>
    </div>
</div>
</body>
</html>
