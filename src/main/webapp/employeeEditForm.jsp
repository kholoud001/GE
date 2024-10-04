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
            <select class="input" name="department">
                <option value="">All Departments</option>
                <option value="HR" <%= "HR".equals(employee.getDepartment()) ? "selected" : "" %>>HR</option>
                <option value="IT" <%= "IT".equals(employee.getDepartment()) ? "selected" : "" %>>IT</option>
                <option value="Sales" <%= "Sales".equals(employee.getDepartment()) ? "selected" : "" %>>Sales</option>
                <option value="Marketing" <%= "Marketing".equals(employee.getDepartment()) ? "selected" : "" %>>Marketing</option>
            </select>
        </div>
        <div class="input-container ic2">
            <select class="input" name="position">
                <option value="">All Positions</option>
                <option value="Manager" <%= "Manager".equals(employee.getPosition()) ? "selected" : "" %>>Manager</option>
                <option value="Developer" <%= "Developer".equals(employee.getPosition()) ? "selected" : "" %>>Developer</option>
                <option value="Analyst" <%= "Analyst".equals(employee.getPosition()) ? "selected" : "" %>>Analyst</option>
                <option value="Salesperson" <%= "Salesperson".equals(employee.getPosition()) ? "selected" : "" %>>Salesperson</option>
            </select>
        </div>
        <button type="submit" class="submit">Update</button>
    </form>
</div>
</body>
</html>
