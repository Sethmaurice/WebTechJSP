<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/18/2023
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.example.student_mis.Service.StudentService"%>
<%@page import="com.example.student_mis.Service.StudentServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.example.student_mis.model.Student"%>
<%@page import="java.util.ArrayList"%>
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
<h2>Student List</h2>
<button> <a href="../page/student.jsp">Add Student</a></button>
<table>
    <thead>
    <tr>
        <th>REG NO</th>
        <th>FULLNAME</th>
        <th>DATE OF BIRTHDAY</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Student> students = new ArrayList<Student>();
        StudentService studentService = new StudentServiceImpl();
        students = studentService.getStudents();

        for (Student student : students) {
    %>
    <tr>
        <td><%=student.getRegNo()%></td>
        <td><%=student.getFullname()%></td>
        <td><%=student.getDob()%></td>
    </tr>
    <%}%>
    </tbody>
</table>
</body>
</html>