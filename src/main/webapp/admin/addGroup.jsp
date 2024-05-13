<%@ page import="com.example.testjpa.repo.GroupRepo" %>
<%@ page import="com.example.testjpa.entity.Group" %><%--
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
    String id = request.getParameter("id");
    GroupRepo groupRepo = new GroupRepo();
    Group group = null;
    if (id != null) {
        group = groupRepo.findById(Integer.parseInt(id));
    }
%>
<body>
<div class="container mt-5">
    <h1><%=group != null ? "Update Group" : "Add Group"%>Add Group</h1>
    <form action="<%=group != null?"/group/update":"/group/add"%>" method="POST">
        <%if (group != null) {%>
        <input type="hidden" value="<%=group.getId()%>" name="id">
        <%}%>
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input value="<%=group != null?group.getName():""%>" type="text" class="form-control" id="name" name="name">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
