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

    <title>Welcome</title>
</head>
<body>
</h1>
<br/><header class="header">
    <div class="header-content responsive-wrapper">
        <div class="header-logo">
            <div>
                  <h1>Employee management system</h1>
                </div>
        </div>
    </div>
</header>
<main class="main">
    <div class="responsive-wrapper">
        <div class="main-header">
            <div></div>
            <div class="search">
                <input type="text" placeholder="Search" />
                <button type="submit">
                    <i class="ph-magnifying-glass-bold"></i>
                </button>
            </div>
            <div>
                <a href="/GE/employee?view=add">
                    <button class="button">
                        <i class="fa-solid fa-plus"></i> Add Employee
                    </button>
                </a>

            </div>
        </div>

        <div class="content">
            <div class="content-main">
                <div class="card-grid">

                    <c:forEach var="employee" items="${employees}">
                        <article class="card">
                            <div class="card-header">
                                <div>
                                    <h3>${employee.name}</h3>
                                </div>
                                <div class="action">
                                    <!-- Update Employee -->
                                    <a href="#">
                                        <i class="fas fa-pen-to-square"></i>
                                    </a>
                                    <!-- Delete Employee -->
                                    <a href="#">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <p><i class="fa-regular fa-at"></i> ${employee.email}</p>
                                <p>${employee.position}</p>
                                <p>${employee.department}</p>
                            </div>
                            <div class="card-footer">
                                <a href="#">View more</a>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>