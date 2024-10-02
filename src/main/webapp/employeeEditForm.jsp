<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="GE.model.Employee" %>

<%
    Employee employee = (Employee) request.getAttribute("employee");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Edit Employee</title>
</head>
<body>
<div class="form">
    <div class="subtitle">Let's update the employee</div>
    <form action="UpdateEmployeeServlet" method="post">
        <input type="hidden" name="id" value="<%= employee.getId() %>"/>
        <div class="input-container ic1">
            <input id="name" name="name" class="input" type="text" value="<%= employee.getName() %>" required/>
            <div class="cut cut-short"></div>
            <label for="name" class="placeholder">Name</label>
        </div>
        <div class="input-container ic2">
            <input id="email" name="email" class="input" type="email" value="<%= employee.getEmail() %>" required/>
            <div class="cut cut-short"></div>
            <label for="email" class="placeholder">Email</label>
        </div>
        <div class="input-container ic2">
            <input id="phone" name="phone" class="input" type="text" value="<%= employee.getPhone() %>" required/>
            <div class="cut cut-short"></div>
            <label for="phone" class="placeholder">Phone</label>
        </div>
        <div class="input-container ic2">
            <input id="department" name="department" class="input" type="text" value="<%= employee.getDepartment() %>" required/>
            <div class="cut "></div>
            <label for="department" class="placeholder">Department</label>
        </div>
        <div class="input-container ic2">
            <input id="position" name="position" class="input" type="text" value="<%= employee.getPosition() %>" required/>
            <div class="cut "></div>
            <label for="position" class="placeholder">Position</label>
        </div>
        <button type="submit" class="submit">Update</button>
    </form>
</div>
</body>
</html>
