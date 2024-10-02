package GE.controller;
import GE.DAO.EmployeeDAO;
import GE.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;

public class AddEmployeeServlet extends HttpServlet {

    private final EmployeeDAO employeeDAO = new EmployeeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("employeeForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String position = request.getParameter("position");
        String department = request.getParameter("department");

        String errorMessage = validateEmployeeDetails(name, email, phone, position, department);

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("employeeForm.jsp").forward(request, response);
        } else {
            Employee employee = new Employee(name, email, phone, position, department);
            employeeDAO.save(employee);
            response.sendRedirect("/GE/employee");
        }
    }

    private String validateEmployeeDetails(String name, String email, String phone, String position, String department) {
        if (name == null || name.trim().isEmpty()) {
            return "Name is required.";
        }
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            return "Please enter a valid email address.";
        }
        if (phone == null || !phone.matches("\\d{10}")) {
            return "Phone number must be 10 digits.";
        }
        if (position == null || position.trim().isEmpty()) {
            return "Position is required.";
        }
        if (department == null || department.trim().isEmpty()) {
            return "Department is required.";
        }
        return null;
    }}
