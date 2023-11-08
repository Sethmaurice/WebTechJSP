
<%@ page import="com.example.student_mis.model.AcademicUnit" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.student_mis.Service.AcademicService" %>
<%@ page import="com.example.student_mis.Service.AcademicServiceImpl" %><%--

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Academic</title>
</head>
<body>
<div class="header">
    <div class="information">
        <h1 style="color: white;">AUCA STUDENT REGISTRATION</h1>
    </div>
</div>

<ul>
    <li><a href="student.jsp">STUDENT</a></li>
    <li><a href="studentReg.jsp">STD REGISTRATION</a></li>
    <li><a href="academic.jsp">Academic Unit</a></li>
    <li><a href="courseDefinition.jsp">Course Definition</a></li>
    <li><a href="teacher.jsp">Teacher</a></li>
    <li><a href="Course.jsp">Course</a></li>
    <li><a href="semester.jsp">Semester</a></li>
    <li><a href="studentCourse.jsp">Student Course Reg</a></li>
    <li><a href="Status.jsp">#</a></li>
</ul>

<%--<ul style="float: left;margin-left: 20px;margin-top: -60px;height: 45px;">--%>
<%--    <li>--%>
<%--        <a href="academicDisplay.jsp">Academic Unit List</a>--%>
<%--    </li>--%>
<%--</ul>--%>

<%--<div class="content">--%>
<%--    <form action="#" method="POST" style="margin-left: 455px;">--%>

<%--        <table border="0" style="width: 350px;height: 350px;">--%>

<%--            <tr><td><font color="black"><h1>COURSES</h1></font><hr></td></tr></font>--%>

<%--            <tr><td><label for="programme2">Choose Programme</label>--%>
<%--                <select name="programme" id="programme2">--%>
<%--                    <option>Select Programme</option>--%>
<%--                    <%--%>

<%--                        List<AcademicUnit> unitList= new ArrayList<>();--%>
<%--                        AcademicService unitService = new AcademicServiceImpl();--%>
<%--                        unitList = unitService.findAll();--%>

<%--                        for(AcademicUnit units: unitList){--%>
<%--                            if(units.getUnit().name().equals("PROGRAMME")){--%>
<%--                    %>--%>
<%--                    <option value="<%=units.getName()%>"><%=units.getName()%></option>--%>
<%--                    <%--%>
<%--                            }--%>
<%--                        }--%>
<%--                    %>--%>
<%--                </select>--%>
<%--            </td></tr>--%>
<%--            <tr><td><label for="faculty">Choose faculty</label>--%>
<%--                <select name="faculty" id="faculty">--%>
<%--                    <option>Select Programme</option>--%>
<%--                    <%--%>
<%--                        for(AcademicUnit units: unitList){--%>
<%--                            if(units.getUnit().name().equals("FACULTY")){--%>
<%--                    %>--%>
<%--                    <option value="<%=units.getName()%>"><%=units.getName()%></option>--%>
<%--                    <%--%>
<%--                            }--%>
<%--                        }--%>
<%--                    %>--%>
<%--                </select>--%>
<%--            </td></tr>--%>
<%--            <tr><td><label for="department">Choose faculty</label>--%>
<%--                <select name="department" id="department">--%>
<%--                    <option>Select Department</option>--%>
<%--                    <%--%>
<%--                        for(AcademicUnit units: unitList){--%>
<%--                            if(units.getUnit().name().equals("DEPARTMENT")){--%>
<%--                    %>--%>
<%--                    <option value="<%=units.getName()%>"><%=units.getName()%></option>--%>
<%--                    <%--%>
<%--                            }--%>
<%--                        }--%>
<%--                    %>--%>
<%--                </select>--%>
<%--            </td></tr>--%>
<%--        </table>--%>

<%--    </form>--%>


<%--</div>--%>
<%--<div class="footer">--%>
<%--    <div class="me">regis.rw123@gmail.com</div>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>
<div class="sm">
    <div class="vw">
        <table>
            <thead>
            <tr>
                <th>#</th>
                <th>Code</th>
                <th>Name</th>
                <th>Category</th>
                <th>Unit</th>
                <%--                            <th></th>--%>
            </tr>
            </thead>
            <tbody>

            <%
                List<AcademicUnit> unitList= new ArrayList<>();
                AcademicService unitService = new AcademicServiceImpl();
                unitList = unitService.findAll();

                for(AcademicUnit academicUnit: unitList){
                    AcademicUnit parent = null;
            %>
            <tr>
                <td><%=academicUnit.getId()%></td>
                <td><%=academicUnit.getCode()%></td>
                <td><%=academicUnit.getName()%></td>
                <td><%=academicUnit.getUnit()%></td>
                <%
                    if(academicUnit.getParent() != null){
                        parent = academicUnit.getParent();
                %>
                <td><%=parent.getName()%></td>
                <%} else { %>
                <td>--parent--</td>
                <%}%>
                <%--                            <td>--%>
                <%--                                <div class="tdAction">--%>
                <%--                                    <button class="updateBtn">?</button>--%>
                <%--                                    <button class="deleteBtn">x</button>--%>
                <%--                                </div>--%>
                <%--                            </td>--%>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <div class="actions">
        <div id="programmeForm">
            <div class="hd">
                <h3>Add PROGRAM</h3>
            </div>
            <form action="../services/programC.jsp" method="post">
<%--                <small class="msg" style="color: darkred;">${unitBean.errorMessage}</small>--%>
<%--                <small class="msg" style="color: green;">${unitBean.infoMessage}</small>--%>
                <div class="form-input">
                    <label for="programme">PROGRAM NAME</label>
                    <input type="text" name="programme" id="programme" />
                </div>
                <button type="submit">Submit</button>
            </form>
        </div>

        <div id="departmentForm">
            <div class="hd">
                <h3>Add Faculty</h3>
            </div>
            <form action="../services/departmentC.jsp" method="post">
<%--                <small class="msg" style="color: darkred;">${unitBean.errorMessage}</small>--%>
<%--                <small class="msg" style="color: green;">${unitBean.infoMessage}</small>--%>
                <div class="form-input">
                    <label for="programme1">Choose Programme</label>
                    <select name="programme" id="programme1">
                        <option>Select Programme</option>
                        <%
                            for(AcademicUnit academicUnit: unitList){
                                if(academicUnit.getUnit().name().equals("PROGRAMME")){
                        %>
                        <option value="<%=academicUnit.getName()%>"><%=academicUnit.getName()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-input">
                    <label for="department">Faculty Name</label>
                    <input type="text" name="department" id="department" />
                </div>
                <button type="submit">Submit</button>
            </form>
        </div>

        <div id="facultyForm">
            <div class="hd">
                <h3>Add Department</h3>
            </div>
            <form action="../services/facultyC.jsp" method="post">
<%--                <small class="msg" style="color: darkred;">${unitBean.errorMessage}</small>--%>
<%--                <small class="msg" style="color: green;">${unitBean.infoMessage}</small>--%>
                <div class="form-input">
                    <label for="programme2">Choose Programme</label>
                    <select name="programme" id="programme2">
                        <option>Select Programme</option>
                        <%
                            for(AcademicUnit academicUnit: unitList){
                                if(academicUnit.getUnit().name().equals("PROGRAMME")){
                        %>
                        <option value="<%=academicUnit.getName()%>"><%=academicUnit.getName()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-input">
                    <label for="department1">Choose Faculty</label>
                    <select name="department" id="department1">
                        <option>Select department</option>
                        <%
                            for(AcademicUnit academicUnit: unitList){
                                if(academicUnit.getUnit().name().equals("FACULTY")){
                        %>
                        <option value="<%=academicUnit.getName()%>"><%=academicUnit.getName()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-input">
                    <label for="faculty">Department Name</label>
                    <input type="text" name="faculty" id="faculty" />
                </div>

                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
</div>
</div>
</section>
</div>
</body>
</html>

<script defer>
    const messages = document.querySelectorAll(".msg");
    messages.forEach((small) => {
        console.log(small);
        if(small.textContent.trim() === ''){
            small.style.display = 'none';
        }
    })
</script>