<%@ page import="com.example.testjpa.entity.User" %>
<%@ page import="com.example.testjpa.entity.enums.Role" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
</head>
<body>

<%
    User currentUser = (User) session.getAttribute("user");
%>

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
        <h1 class="text-center bg-dark text-white">Content</h1>
    </div>
</div>

</body>
</html>