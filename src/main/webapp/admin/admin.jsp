<%@ page import="com.example.testjpa.entity.User" %>
<%@ page import="com.example.testjpa.entity.enums.Role" %><%--
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
        </table>
    </div>
    <%if (currentUser != null && currentUser.getRole().equals(Role.ADMIN)) {%>
    <a href="/">
        <button class="btn btn-success">Home</button>
    </a>
    <%}%>
    <div class="col-5">
        <h1 class="bg-dark form-control text-center text-white">Students</h1>
        <a href="/admin/addStudnet.jsp">
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
        </table>
    </div>
</div>
</body>
</html>
