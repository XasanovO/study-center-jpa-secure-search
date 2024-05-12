<%--
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
        <a href="/auth/login.jsp">
            <button class="btn btn-success">Login</button>
        </a>
        <h1 class="text-center bg-dark text-white">groups</h1>
        <form>
            <input class="form-control" type="text" name="search">
            <button class="btn btn-success">search</button>
        </form>
    </div>
</div>
</body>
</html>
