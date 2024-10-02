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
            <input id="department" name="department" class="input" type="text" placeholder=" " required/>
            <div class="cut "></div>
            <label for="department" class="placeholder">Department</label>
        </div>
        <div class="input-container ic2">
            <input id="position" name="position" class="input" type="text" placeholder=" " required/>
            <div class="cut "></div>
            <label for="position" class="placeholder">Position</label>
        </div>
        <button type="submit" class="submit">Submit</button>
    </form>
</div>
</body>
</html>
