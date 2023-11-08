<%@ page import="com.example.student_mis.Service.CourseDefService" %>
<%@ page import="com.example.student_mis.Service.CourseDefServiceImpl" %>
<%@ page import="com.example.student_mis.model.CourseDefinition" %>
<%@ page import="java.util.UUID" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/14/2023
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    CourseDefService service = new CourseDefServiceImpl();
    CourseDefinition semester = new CourseDefinition();

    String code = request.getParameter("ccode");
    String name = request.getParameter("cname");
    String des = request.getParameter("cdesc");
    boolean isValid = false;

    if(code.trim().isEmpty() && name.trim().isEmpty() && des.trim().isEmpty()){
        isValid = true;
        System.out.println("All fields are required");
    }else{
        semester.setId(UUID.randomUUID());
        semester.setCode(code);
        semester.setName(name);
        semester.setDescription(des);

        boolean feedback = service.addCourseDefinition(semester);

        if(feedback) {
            request.getRequestDispatcher("../page/CourseDefDisplay.jsp").forward(request, response);
            System.out.println("Inserted");
        }else {
            request.getRequestDispatcher("../page/error.jsp").forward(request, response);
            System.out.println("failed");
        }
    }

%>
