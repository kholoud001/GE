package GE.controller;

import GE.DAO.EmployeeDAO;
import GE.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UpdateEmployeeServlet extends HttpServlet {

    private EmployeeDAO employeeDAO = new EmployeeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");

        try {
            int id = Integer.parseInt(idStr);
            Employee employee = employeeDAO.getEmployeeById(id);

            if (employee != null) {
                request.setAttribute("employee", employee);
                request.getRequestDispatcher("employeeEditForm.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "No employee found with ID: " + id);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid employee ID.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String position = request.getParameter("position");
        String department = request.getParameter("department");

        try {
            int id = Integer.parseInt(idStr);

            Employee updatedEmployee = new Employee();
            updatedEmployee.setId(id);
            updatedEmployee.setName(name);
            updatedEmployee.setEmail(email);
            updatedEmployee.setPhone(phone);
            updatedEmployee.setPosition(position);
            updatedEmployee.setDepartment(department);

            employeeDAO.updateEmployee(updatedEmployee);

            response.sendRedirect("employee?view=employees");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the employee: " + e.getMessage());
            request.getRequestDispatcher("employeeEditForm.jsp").forward(request, response);
        }
    }
}
