<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/20/2023
  Time: 10:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.model.AcademicUnit" %>
<%@ page import="com.example.student_mis.Service.AcademicService" %>
<%@ page import="com.example.student_mis.Service.AcademicServiceImpl" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.example.student_mis.enums.EAcademicUnit" %>
<%--<jsp:useBean id="unitBean" class="com.example.student_mis.bean.AcademicUnitBean" scope="request" />--%>

<%
    AcademicService unitService = new AcademicServiceImpl();
    AcademicUnit unit = new AcademicUnit();

    String unitName = request.getParameter("programme");
    String depName = request.getParameter("department");
    String faculty = request.getParameter("faculty");
    AcademicUnit parent = unitService.findUnitByName(depName);

    if(unitName.trim().isEmpty() || depName.trim().isEmpty()){
//        unitBean.setErrorMessage("All fields are required!");
        System.out.println("All fields are required");
    }else{
        int min = 10000; // Smallest 5-digit number
        int max = 99999; // Largest 5-digit number
        Random random = new Random();
        int randomCode = random.nextInt(max - min + 1) + min;

        unit.setId(UUID.randomUUID());
        unit.setCode(String.valueOf(randomCode));
        unit.setName(faculty);
        unit.setUnit(EAcademicUnit.DEPARTMENT);
        unit.setParent(parent);

        boolean feedback = unitService.addAcademicUnit(unit);

        if(feedback) {
//            unitBean.setInfoMessage("Successfully inserted!");
            System.out.println("Successfully inserted");
            request.getRequestDispatcher("../page/academic.jsp").forward(request, response);
        }else {
//            unitBean.setErrorMessage("Insert failed!");
            System.out.println("Insert failed!");
            request.getRequestDispatcher("../page/error.jsp").forward(request, response);
        }
    }
%>

