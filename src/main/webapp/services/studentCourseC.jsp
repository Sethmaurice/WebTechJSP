<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/21/2023
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.Service.StudentCourseService" %>
<%@ page import="com.example.student_mis.Service.StudentCourseServiceImpl" %>
<%@ page import="com.example.student_mis.model.StudentCourse" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.example.student_mis.Service.CourseService" %>
<%@ page import="com.example.student_mis.Service.CourseServiceImpl" %>
<%@ page import="com.example.student_mis.model.Course" %>
<%@ page import="com.example.student_mis.Service.StudentRegService" %>
<%@ page import="com.example.student_mis.Service.StudentRegServiceImpl" %>
<%@ page import="com.example.student_mis.model.StudentRegistration" %>
<%--<jsp:useBean id="stCourseBean" class="com.example.student_mis.bean.StudentCourseBean" scope="request" />--%>

<%
    StudentCourseService service = new StudentCourseServiceImpl();
    StudentCourse course = new StudentCourse();

//    UUID id = UUID.fromString(request.getParameter("id"));
    UUID regNo = UUID.fromString(request.getParameter("regNo"));
    UUID courseInput = UUID.fromString(request.getParameter("course"));
    Integer credits = Integer.parseInt(request.getParameter("credits"));
    String results = request.getParameter("results");
    String action = request.getParameter("action");

    boolean isValid = false;

    if(results.trim().isEmpty()){
        isValid = true;
//        stCourseBean.setErrorMessage("All fields are required");
    }else{
        CourseService service1 = new CourseServiceImpl();
        Course course1 = service1.courseById(courseInput);

        StudentRegService service2 = new StudentRegServiceImpl();
        StudentRegistration registration = service2.studRegistrationById(regNo);

        course.setId(UUID.randomUUID());
        course.setCourse(course1);
        course.setCredits(credits);
        course.setResults(results);
        course.setStudentRegistration(registration);

        boolean feedback;
        if(action.equals("Update")){
            UUID id = UUID.fromString(request.getParameter("id"));
            course.setId(id);
            feedback = service.addStudentCourse(course);
        }else if(action.equals("Submit")){
            course.setId(UUID.randomUUID());
            feedback = service.addStudentCourse(course);
        }else{
            UUID id = UUID.fromString(request.getParameter("id"));
            course.setId(id);
            feedback = service.deleteStudentCourse(course);
        }

//        if(feedback) {
//            if(action.equals("Submit")) {
//                stCourseBean.setInfoMessage("Successfully inserted!");
//            }else if(action.equals("Update")){
//                stCourseBean.setInfoMessage("Successfully updated!");
//            }else{
//                stCourseBean.setInfoMessage("Successfully deleted!");
//            }
//            request.getRequestDispatcher("../components/studentCourse.jsp").forward(request, response);
//        }else {
//            stCourseBean.setErrorMessage("Insert failed!");
            request.getRequestDispatcher("../page/studentCourseDisplay.jsp").forward(request, response);
//        }
    }
%>
