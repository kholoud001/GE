<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styleIndex.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <title>Employee Management System</title>
</head>
<body>
<header class="header">
    <div class="header-content responsive-wrapper">
            <a href="<%= request.getContextPath() %>/employee">
                <h1>Employee Management System</h1>
            </a>
    </div>
</header>

<main class="main">
    <div class="responsive-wrapper">
        <div class="main-header">
            <div class="search">
                <form action="${pageContext.request.contextPath}/searchEmployee" method="get">
                    <input type="text" name="search" placeholder="Search by name, email, department, or position" value="${param.search}"/>

                    <button type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>
            <div>
                <a href="/GE/addEmployee">
                    <button class="button">
                        <i class="fa-solid fa-plus"></i> Add Employee
                    </button>
                </a>

            </div>
        </div>

        <div class="filter">
            <!-- Filter by Department -->
            <form action="${pageContext.request.contextPath}/filterEmployees" method="get">
                <select class="button" name="department">
                    <option value="">All Departments</option>
                    <option value="HR" <c:if test="${param.department == 'HR'}">selected</c:if>>HR</option>
                    <option value="IT" <c:if test="${param.department == 'IT'}">selected</c:if>>IT</option>
                    <option value="Sales" <c:if test="${param.department == 'Sales'}">selected</c:if>>Sales</option>
                    <option value="Marketing" <c:if test="${param.department == 'Marketing'}">selected</c:if>>Marketing</option>
                </select>

                <!-- Filter by Position -->
                <select class="button" name="position">
                    <option value="">All Positions</option>
                    <option value="Manager" <c:if test="${param.position == 'Manager'}">selected</c:if>>Manager</option>
                    <option value="Developer" <c:if test="${param.position == 'Developer'}">selected</c:if>>Developer</option>
                    <option value="Analyst" <c:if test="${param.position == 'Analyst'}">selected</c:if>>Analyst</option>
                    <option value="Salesperson" <c:if test="${param.position == 'Salesperson'}">selected</c:if>>Salesperson</option>
                </select>

                <button class="button" type="submit">
                    <i class="fa-solid fa-arrow-down-wide-short"></i>
                    Filter
                </button>
            </form>
        </div>


        <div class="content">
            <div class="content-main">
                <c:if test="${not empty employees}">
                    <ul class="user-list">
                        <c:forEach var="employee" items="${employees}">
                            <li class="user-item">
                                <!-- User Name and Position -->
                                <div class="user-info">
                                    <a href="displayEmployee?id=${employee.id}" class="user-name">
                                            ${employee.name}
                                    </a>
                                    <span class="user-position">${employee.position}</span>
                                </div>

                                <!-- Action Buttons (Update and Delete) -->
                                <div class="user-actions">
                                    <a href="UpdateEmployeeServlet?id=${employee.id}" class="action-button update-button">
                                        <i class="fas fa-pen-to-square"></i>
                                    </a>
                                    <form action="/GE/deleteEmployee" method="post" onsubmit="return confirm('Are you sure you want to delete this employee?');" class="delete-form">
                                        <input type="hidden" name="id" value="${employee.id}" />
                                        <button type="submit" class="action-button delete-button">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
                <c:if test="${empty employees}">
                    <p>No employees found for the selected filters.</p>
                </c:if>
            </div>
        </div>
    </div>
</main>
</body>
</html>
