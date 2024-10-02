package GE.controller;

import GE.DAO.EmployeeDAO;
import GE.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class FilterEmployeeServlet extends HttpServlet {

    EmployeeDAO employeeDAO = new EmployeeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get filter parameters from the request
        String department = request.getParameter("department");
        String position = request.getParameter("position");

        // Retrieve filtered employee data from the DAO
        List<Employee> employees = employeeDAO.filterEmployees(department, position);

        request.setAttribute("employees", employees);
        request.setAttribute("department", department);
        request.setAttribute("position", position);

        System.out.println("Department: " + department);
        System.out.println("Position: " + position);


        // Forward to the JSP
        request.getRequestDispatcher("/GE/employee").forward(request, response);
    }}
