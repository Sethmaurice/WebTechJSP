<%@ page import="com.example.student_mis.model.Semester" %>
<%@ page import="com.example.student_mis.Service.SemesterInteface" %>
<%@ page import="com.example.student_mis.Service.SemesterServiceImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.UUID" %>

<%
    SemesterInteface service = new SemesterServiceImpl();
    Semester semester = new Semester();

    String semName = request.getParameter("semName");
    LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
    LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
    boolean isValid = false;

    if(semName.trim().isEmpty()){
        isValid = true;
        System.out.println("All fields are required");
    }else{
        semester.setId(UUID.randomUUID());
        semester.setName(semName);
        semester.setStartDate(startDate);
        semester.setEndDate(endDate);

        boolean feedback = service.addSemester(semester);

        if(feedback) {
            request.getRequestDispatcher("../page/semesterDisplay.jsp").forward(request, response);
            System.out.println("Inserted");
        }else {
            request.getRequestDispatcher("../page/error.jsp").forward(request, response);
            System.out.println("failed");
        }
    }

%>
