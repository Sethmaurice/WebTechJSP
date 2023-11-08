<%@ page import="com.example.student_mis.model.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.Service.TeacherService" %>
<%@ page import="com.example.student_mis.Service.TeacherServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/15/2023
  Time: 12:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../page/style.css" rel="stylesheet" type="text/css"/>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h2>Course List</h2>
<button> <a href="../page/teacher.jsp">Add teacher</a></button>
<table>
    <thead>
    <tr>
        <th>Code</th>
        <th>Names</th>
        <th>Qualification</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Teacher> teachers = new ArrayList<Teacher>();
        TeacherService teacherService = new TeacherServiceImpl();
        teachers = teacherService.getTeacher();

        for (Teacher teacher : teachers) {
    %>
    <tr>
        <td><%=teacher.getCode()%></td>
        <td><%=teacher.getNames()%></td>
        <td><%=teacher.getQualification()%></td>
    </tr>
    <%}%>
    </tbody>
</table>
</body>
</html>>
