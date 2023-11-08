<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/18/2023
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.model.Student" %>
<%@ page import="com.example.student_mis.Service.StudentService" %>
<%@ page import="com.example.student_mis.Service.StudentServiceImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.example.student_mis.model.Semester" %>
<%@ page import="com.example.student_mis.dao.SemesterDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    StudentService service = new StudentServiceImpl();
    Student student = new Student();
    String ids =request.getParameter("regNo");
    String stname = request.getParameter("fullname");
    LocalDate dob = LocalDate.parse(request.getParameter("dob"));
    boolean isValid = false;

//    if(stname.trim().isEmpty()){
        isValid = true;
//        System.out.println("All fields are required");
//    }else{
        student.setId(UUID.randomUUID());
        student.setRegNo(ids);
        student.setFullname(stname);
        student.setDob(dob);
        boolean feedback = service.addStudent(student);
        if(feedback) {
            request.getRequestDispatcher("../page/studentDisplay.jsp").forward(request, response);
            System.out.println("Inserted");
        }else {
            request.getRequestDispatcher("../page/error.jsp").forward(request, response);
            System.out.println("failed");

    }
    SemesterDao semesterDao = new SemesterDao();
    List<Semester> semesters = semesterDao.findAll();

    List<Student> studentsPerSemester = new ArrayList<Student>();

    for (Semester semester : semesters) {
        List<Student> students = service.getStudentsBySemester(semester);
        studentsPerSemester.addAll(students);
    }

    request.setAttribute("studentsPerSemester", studentsPerSemester);

    // Redirect to the appropriate JSP page
    if (isValid) {
        request.getRequestDispatcher("../page/studentDisplay.jsp").forward(request, response);
        System.out.println("Inserted");
    } else {
        request.getRequestDispatcher("../page/error.jsp").forward(request, response);
        System.out.println("Failed");
    }
%>

