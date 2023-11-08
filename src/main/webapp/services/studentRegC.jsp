<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/20/2023
  Time: 11:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.Service.StudentRegService" %>
<%@ page import="com.example.student_mis.Service.StudentRegServiceImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.example.student_mis.Service.StudentService" %>
<%@ page import="com.example.student_mis.Service.StudentServiceImpl" %>
<%@ page import="com.example.student_mis.Service.SemesterInteface" %>
<%@ page import="com.example.student_mis.Service.SemesterServiceImpl" %>
<%@ page import="com.example.student_mis.model.*" %>
<%@ page import="com.example.student_mis.Service.AcademicService" %>
<%@ page import="com.example.student_mis.Service.AcademicServiceImpl" %>
<%@ page import="com.example.student_mis.enums.ERegistrationStatus" %>
<%--<jsp:useBean id="studRegBean" class="com.example.student_mis.bean.StudentRegistrationBean" scope="request" />--%>


<%
    StudentRegistration studentRegistration =new StudentRegistration();
    StudentRegService service = new StudentRegServiceImpl();

    String academics = request.getParameter("unit");
    String semester1 = request.getParameter("semester");
    String student1 = request.getParameter("student");
    String status = request.getParameter("status");
    boolean isValid = false;

    AcademicService service0 = new AcademicServiceImpl();
    AcademicUnit unit1 = service0.findUnitByName(academics);

    SemesterInteface service2 = new SemesterServiceImpl();
    Semester semester = service2.findSemesterByName(semester1);


    StudentService service1 = new StudentServiceImpl();
    Student student = service1.findStudentByRegNo(student1);

    studentRegistration.setUnit(unit1);
    studentRegistration.setStudent(student);
    studentRegistration.setSemester(semester);
    if(status.equals("PENDING")){
        studentRegistration.setRegistrationStatus(ERegistrationStatus.PENDING);
    }
    else if (status.equals("ADMITTED"))
    {
        studentRegistration.setRegistrationStatus(ERegistrationStatus.ADMITTED);
    }
    else if (status.equals("REJECTED"))
    {
        studentRegistration.setRegistrationStatus(ERegistrationStatus.REJECTED);
    }
    else {
        studentRegistration.setRegistrationStatus(null);
    }

    boolean feedback = service.addStudentRegistration(studentRegistration);

    if(feedback) {
        request.getRequestDispatcher("../page/stdRegDisplay.jsp").forward(request, response);
        System.out.println("Inserted");
    }else {
        request.getRequestDispatcher("../page/error.jsp").forward(request, response);
        System.out.println("failed");

    }

%>
<%--<%--%>
<%--    StudentRegService service = new StudentRegServiceImpl();--%>
<%--    StudentRegistration registration = new StudentRegistration();--%>

<%--    String std = (request.getParameter("regNo"));--%>
<%--    String unit = request.getParameter("unit");--%>
<%--    String semesterInput = request.getParameter("semester");--%>
<%--//    LocalDate regDate = LocalDate.parse(request.getParameter("regDate"));--%>
<%--    String action = request.getParameter("action");--%>
<%--    boolean isValid = false;--%>
<%--    isValid = true;--%>
<%--        StudentService service1 = new StudentServiceImpl();--%>
<%--        Student student = service1.findStudentByRegNo(std);--%>

<%--        SemesterInteface service2 = new SemesterServiceImpl();--%>
<%--        Semester semester = service2.findSemesterByName(semesterInput);--%>

<%--        AcademicService service3 = new AcademicServiceImpl();--%>
<%--        AcademicUnit unit1 = service3.findUnitByName(unit);--%>

<%--        registration.setId(UUID.randomUUID());--%>
<%--        registration.setStudent(student);--%>
<%--//        registration.setRegistrationDate(regDate);--%>
<%--        registration.setSemester(semester);--%>
<%--        registration.setUnit(unit1);--%>
<%--        registration.setStatus(ERegistrationStatus.PENDING);--%>

<%--        boolean feedback;--%>
<%--//        if(action.equals("Update")){--%>
<%--//            UUID id = UUID.fromString(request.getParameter("id"));--%>
<%--//            registration.setId(id);--%>
<%--//            feedback = service.createStudentRegistration(registration);--%>
<%--//        }else--%>
<%--//        if(action.equals("Submit")) {--%>
<%--            registration.setId(UUID.randomUUID());--%>
<%--            feedback = service.addReg(registration);--%>
<%--    request.getRequestDispatcher("../page/stdRegDisplay.jsp").forward(request, response);--%>
<%--    System.out.println("INSERTED");--%>

<%--//        }else{--%>
<%--//            UUID id = UUID.fromString(request.getParameter("id"));--%>
<%--//            registration.setId(id);--%>
<%--//            feedback = service.deleteStudentRegistration(registration);--%>
<%--//        }--%>
<%--//--%>
<%--//        if(feedback) {--%>
<%--//            if(action.equals("Submit")) {--%>
<%--//                studRegBean.setInfoMessage("Successfully inserted!");--%>
<%--//            }else if(action.equals("Update")){--%>
<%--//                studRegBean.setInfoMessage("Successfully updated!");--%>
<%--//            }--%>
<%--//            else{--%>
<%--//                System.out.println("error deleted!");--%>
<%--//            }--%>
<%--//            request.getRequestDispatcher("../page/studentReg.jsp").forward(request, response);--%>
<%--//        }else {--%>
<%--//            studRegBean.setErrorMessage("Insert failed!");--%>
<%--//            request.getRequestDispatcher("../components/studentRegistration.jsp").forward(request, response);--%>
<%--//        }--%>
<%--//    }--%>
<%--%>--%>
