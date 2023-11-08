<%@ page import="com.example.student_mis.model.Course" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.example.student_mis.model.CourseDefinition" %>
<%@ page import="com.example.student_mis.model.Semester" %>
<%@ page import="com.example.student_mis.model.Teacher" %>
<%@ page import="com.example.student_mis.Service.*" %>

<%
    CourseService service = new CourseServiceImpl();
    Course course = new Course();

    String courseDef = request.getParameter("courseDef");
    String semesterInput = request.getParameter("semester");
    String teacherInput = request.getParameter("teacher");
    String action = request.getParameter("action");

    boolean isValid = false;
    isValid = true;



        CourseDefService service1 = new CourseDefServiceImpl();
        CourseDefinition definition = service1.findCourseByName(courseDef);

        SemesterInteface service2 = new SemesterServiceImpl();
        Semester semester = service2.findSemesterByName(semesterInput);

        TeacherService service3 = new TeacherServiceImpl();
        Teacher teacher = service3.findTeacherByName(teacherInput);

        course.setCourseDefinition(definition);
        course.setSemester(semester);
        course.setTeacher(teacher);

        boolean feedback;
//    if(action.equals("submit")) {
        course.setId(UUID.randomUUID());
        feedback = service.addCourse(course);
        request.getRequestDispatcher("../page/courseDisplay.jsp").forward(request, response);
        System.out.println("INSERTED");

//        if(action.equals("Update")){
//            UUID id = UUID.fromString(request.getParameter("id"));
//            course.setId(id);
//            feedback = service.addCourse(course);
//        }else if(action.equals("Submit")){
//            course.setId(UUID.randomUUID());
//            feedback = service.addCourse(course);
//        }
//        else {
//            System.out.println("hi");
//        }
//        else{
//            UUID id = UUID.fromString(request.getParameter("id"));
//            course.setId(id);
//            feedback = service.d\(course);
//        }
//    }

//        if(feedback) {
//            if(action.equals("Submit")) {
//                courseBean.setInfoMessage("Successfully inserted!");
//            }else if(action.equals("Update")){
//                courseBean.setInfoMessage("Successfully updated!");
//            }else{
//                courseBean.setInfoMessage("Successfully deleted!");
//            }
//            request.getRequestDispatcher("../components/courseMain.jsp").forward(request, response);
//        }else {
//            courseBean.setErrorMessage("Insert failed!");
//            request.getRequestDispatcher("../components/courseMain.jsp").forward(request, response);
//
//    }
%>