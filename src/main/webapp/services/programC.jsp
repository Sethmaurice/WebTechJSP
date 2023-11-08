<%@ page import="com.example.student_mis.model.AcademicUnit" %>
<%@ page import="com.example.student_mis.Service.AcademicService" %>
<%@ page import="com.example.student_mis.Service.AcademicServiceImpl" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.example.student_mis.enums.EAcademicUnit" %>

<%
    AcademicService unitService = new AcademicServiceImpl();
    AcademicUnit unit = new AcademicUnit();

    String unitName = request.getParameter("programme");

    if(unitName.trim().isEmpty()){
        System.out.println("All fields are required!");
    }else{
        int min = 10000; // Smallest 5-digit number
        int max = 99999; // Largest 5-digit number
        Random random = new Random();
        int randomCode = random.nextInt(max - min + 1) + min;

        unit.setId(UUID.randomUUID());
        unit.setCode(String.valueOf(randomCode));
        unit.setName(unitName);
        unit.setUnit(EAcademicUnit.PROGRAMME);

        boolean feedback = unitService.addAcademicUnit(unit);

        if(feedback) {
            System.out.println("Successfully inserted!");
            System.out.println(unitName);
            request.getRequestDispatcher("../page/academic.jsp").forward(request, response);
        }else {
            System.out.println("Insert failed!");
            request.getRequestDispatcher("../page/error.jsp").forward(request, response);
        }
    }
%>
