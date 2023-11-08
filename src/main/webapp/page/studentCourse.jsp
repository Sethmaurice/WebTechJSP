<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/21/2023
  Time: 7:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.student_mis.model.StudentCourse" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.student_mis.Service.StudentCourseService" %>
<%@ page import="com.example.student_mis.Service.StudentCourseServiceImpl" %>
<%@ page import="com.example.student_mis.model.StudentRegistration" %>
<%@ page import="com.example.student_mis.Service.StudentRegService" %>
<%@ page import="com.example.student_mis.Service.StudentRegServiceImpl" %>
<%@ page import="com.example.student_mis.model.Course" %>
<%@ page import="com.example.student_mis.Service.CourseService" %>
<%@ page import="com.example.student_mis.Service.CourseServiceImpl" %>
<%--<jsp:useBean id="stCourseBean" class="com.example.student_mis.bean.StudentCourseBean" scope="request" />--%>
<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023-10-13
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>

</head>
<body>
                <div class="actions">
                    <div class="hd">
                        <h3>Add/Update STUDENT_COURSE</h3>
                    </div>
                    <form action="../services/studentCourseC.jsp" method="post" id="form">
<%--                        <small style="color: darkred;">${stCourseBean.errorMessage}</small>--%>
<%--                        <small style="color: green;">${stCourseBean.infoMessage}</small>--%>
                        <input type="hidden" id="id" name="id" />
                        <div class="form-input">
                            <label for="regNo">Select St Registration</label>
                            <select name="regNo" id="regNo">
                                <option>Select Std...</option>
                                <%
                                    List<StudentRegistration> registrations = new ArrayList<>();
                                    StudentRegService service1 = new StudentRegServiceImpl();
                                    registrations = service1.getStudentRegistration();

                                    for(StudentRegistration reg: registrations){
                                %>
                                <option value="<%=reg.getId()%>"><%=reg.getStudent().getRegNo()+" "+reg.getRegistrationDate()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="course">Select Course</label>
                            <select name="course" id="course">
                                <option>Select Course</option>
                                <%
                                    List<Course> courseList = new ArrayList<>();
                                    CourseService service2 = new CourseServiceImpl();
                                    courseList = service2.getCourse();

                                    for(Course cr: courseList){
                                %>
                                <option value="<%=cr.getCourseDefinition().getId()%>"><%=cr.getCourseDefinition().getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-input">
                            <label for="credits">Enter Credits</label>
                            <input type="number" name="credits" id="credits" required/>
                        </div>
                        <div class="form-input">
                            <label for="results">Enter results</label>
                            <input type="text" name="results" id="results" required/>
                        </div>
                        <input type="submit" id="formBtn" value="Submit" />
                    </form>
                </div>
            </div>
</body>
</html>

<script defer>
    const form = document.getElementById("form");
    const updateButtons = document.querySelectorAll('.updateBtn');
    const deleteButtons = document.querySelectorAll('.deleteBtn');
    const scIdInput = document.getElementById('id');
    const stRegInput = document.getElementById('regNo');
    const semInput = document.getElementById('course');
    const creditInput = document.getElementById('credits');
    const resultInput = document.getElementById('results');
    const formBtn = document.getElementById('formBtn');

    updateButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            scIdInput.value = cells[0].textContent;
            stRegInput.value = cells[1].textContent;
            semInput.value = cells[2].textContent;
            creditInput.value = cells[3].textContent;
            formBtn.value = 'Update';
            formBtn.style.backgroundColor = '#2b9b58';
        });
    })

    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            const row = button.closest('tr');
            const cells = row.getElementsByTagName('td');

            scIdInput.value = cells[0].textContent;
            stRegInput.value = cells[1].textContent;
            semInput.value = cells[2].textContent;
            creditInput.value = cells[3].textContent;
            formBtn.value = 'Delete';
            formBtn.style.backgroundColor = '#d13a3a';
        });
    });

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.action = "../services/studentCourseC.jsp?action=" + formBtn.value;
        form.submit();
    });
</script>
