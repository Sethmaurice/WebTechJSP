<%@ page import="com.example.student_mis.Service.UserService" %>
<%@ page import="com.example.student_mis.Service.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/15/2023
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserService studentService = new UserServiceImpl();
        if ((request.getParameter("email").equalsIgnoreCase("Seth"))
                && (request.getParameter("password").equalsIgnoreCase("12345"))) {
            response.sendRedirect("../page/semester.jsp");
            return;
        } else {
            response.sendRedirect("../page/login.jsp");
        }
        %>
