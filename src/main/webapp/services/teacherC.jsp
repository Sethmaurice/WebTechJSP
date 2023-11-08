<%@ page import="com.example.student_mis.Service.TeacherService" %>
<%@ page import="com.example.student_mis.Service.TeacherServiceImpl" %>
<%@ page import="com.example.student_mis.model.Teacher" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.example.student_mis.enums.EQualification" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/15/2023
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TeacherService teacherService = new TeacherServiceImpl();
    Teacher teacher = new Teacher();

    String tCode = request.getParameter("Tcode");
    String tname = request.getParameter("Tname");
    String qual = request.getParameter("Qualifications");

    boolean isValid = false;

    if(tCode.trim().isEmpty()){
        isValid = true;
        System.out.println("All fields are required");
    }else{
        teacher.setId(UUID.randomUUID());
        teacher.setCode(tCode);
        teacher.setNames(tname);
        if ("MASTER".equals(qual)) {
            teacher.setQualification(EQualification.MASTER);
        } else if ("PHD".equals(qual)) {
            teacher.setQualification(EQualification.PHD);
        } else if ("PROFESSOR".equals(qual)) {
            teacher.setQualification(EQualification.PROFESSOR);
        } else {
            System.out.println("Invalid qualification: " + qual);
            // Handle invalid qualification here
        }

        boolean feedback = teacherService.addTeacher(teacher);

        if(feedback) {
            request.getRequestDispatcher("../page/teacherDisplay.jsp").forward(request, response);
            System.out.println("Inserted");
        }else {
            request.getRequestDispatcher("../page/error.jsp").forward(request, response);
            System.out.println("failed");
        }
    }

%>
