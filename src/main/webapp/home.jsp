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
        <div class="header-logo">
            <h1>Employee Management System</h1>
        </div>
    </div>
</header>

<main class="main">
    <div class="responsive-wrapper">
        <div class="main-header">
            <div></div>
            <div class="search">
                <form action="${pageContext.request.contextPath}/searchEmployee" method="get">
                    <input type="text" name="search" placeholder="Search by name, email, department, or position" value="${param.search}"/>

                    <button type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>
            <div class="filter">
                <!-- Filter by Department -->
                <form action="${pageContext.request.contextPath}/filterEmployees" method="get">
                    <select name="department">
                        <option value="">All Departments</option>
                        <option value="HR" <c:if test="${param.department == 'HR'}">selected</c:if>>HR</option>
                        <option value="IT" <c:if test="${param.department == 'IT'}">selected</c:if>>IT</option>
                        <option value="Sales" <c:if test="${param.department == 'Sales'}">selected</c:if>>Sales</option>
                        <option value="Marketing" <c:if test="${param.department == 'Marketing'}">selected</c:if>>Marketing</option>
                    </select>

                    <!-- Filter by Position -->
                    <select name="position">
                        <option value="">All Positions</option>
                        <option value="Manager" <c:if test="${param.position == 'Manager'}">selected</c:if>>Manager</option>
                        <option value="Developer" <c:if test="${param.position == 'Developer'}">selected</c:if>>Developer</option>
                        <option value="Analyst" <c:if test="${param.position == 'Analyst'}">selected</c:if>>Analyst</option>
                        <option value="Salesperson" <c:if test="${param.position == 'Salesperson'}">selected</c:if>>Salesperson</option>
                    </select>

                    <button type="submit">Filter</button>
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

        <div class="content">
            <div class="content-main">
                <c:if test="${not empty employees}">
                    <div class="card-grid">
                        <c:forEach var="employee" items="${employees}">
                            <article class="card">
                                <div class="card-header">
                                    <h3>${employee.name}</h3>
                                    <div class="action">
                                        <a href="UpdateEmployeeServlet?id=${employee.id}">
                                            <i class="fas fa-pen-to-square"></i>
                                        </a>
                                        <form action="/GE/deleteEmployee" method="post" onsubmit="return confirm('Are you sure you want to delete this employee?');">
                                            <input type="hidden" name="id" value="${employee.id}" />
                                            <button type="submit" class="delete-button">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p><i class="fa-regular fa-envelope"></i> ${employee.email}</p>
                                    <p>${employee.position}</p>
                                    <p>${employee.department}</p>
                                </div>
                                <div class="card-footer">
                                    <a href="displayEmployee?id=${employee.id}">
                                        View more info
                                    </a>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
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
