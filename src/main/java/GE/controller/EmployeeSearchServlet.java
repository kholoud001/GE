package GE.controller;

import GE.DAO.EmployeeDAO;
import GE.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class EmployeeSearchServlet extends HttpServlet {

    private EmployeeDAO employeeDAO = new EmployeeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchTerm = request.getParameter("search");
        List<Employee> employees = null;
        if (searchTerm != null && !searchTerm.isEmpty()) {
            employees = employeeDAO.searchEmployees(searchTerm);
        } else {

            employees = employeeDAO.getAllEmployees();
        }
        request.setAttribute("employees", employees);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
