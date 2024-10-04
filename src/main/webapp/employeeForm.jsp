<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Add Employee</title>
</head>
<body>
<div class="form">
    <div class="title">Welcome</div>
    <div class="subtitle">Let's add an employee</div>

    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <form action="addEmployee" method="post">
        <div class="input-container ic1">
            <input id="name" name="name" class="input" type="text" placeholder=" " required/>
            <div class="cut cut-short"></div>
            <label for="name" class="placeholder">Name</label>
        </div>
        <div class="input-container ic2">
            <input id="email" name="email" class="input" type="email" placeholder=" " required/>
            <div class="cut cut-short"></div>
            <label for="email" class="placeholder">Email</label>
        </div>
        <div class="input-container ic2">
            <input id="phone" name="phone" class="input" type="text" placeholder=" " required/>
            <div class="cut cut-short"></div>
            <label for="phone" class="placeholder">Phone</label>
        </div>
        <div class="input-container ic2">
            <select class="input" name="department">
                <option value="">All Departments</option>
                <option value="HR" <c:if test="${param.department == 'HR'}">selected</c:if>>HR</option>
                <option value="IT" <c:if test="${param.department == 'IT'}">selected</c:if>>IT</option>
                <option value="Sales" <c:if test="${param.department == 'Sales'}">selected</c:if>>Sales</option>
                <option value="Marketing" <c:if test="${param.department == 'Marketing'}">selected</c:if>>Marketing</option>
            </select>
        </div>
        <div class="input-container ic2">
            <select class="input" name="position">
                <option value="">All Positions</option>
                <option value="Manager" <c:if test="${param.position == 'Manager'}">selected</c:if>>Manager</option>
                <option value="Developer" <c:if test="${param.position == 'Developer'}">selected</c:if>>Developer</option>
                <option value="Analyst" <c:if test="${param.position == 'Analyst'}">selected</c:if>>Analyst</option>
                <option value="Salesperson" <c:if test="${param.position == 'Salesperson'}">selected</c:if>>Salesperson</option>
            </select>
        </div>
        <button type="submit" class="submit">Submit</button>
    </form>
</div>
</body>
</html>
