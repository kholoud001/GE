package GE.controller;

import GE.DAO.EmployeeDAO;
import GE.model.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class EmployeeController extends HttpServlet {

    private final EmployeeDAO employeeDAO = new EmployeeDAO();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("view");
        RequestDispatcher requestDispatcher;

        switch (action) {
            case "home":
                requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
                break;
            case "add":
                requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/employeeForm.jsp");
                break;
            case "employees":
                List<Employee> employeeList = employeeDAO.getAllEmployees();
                request.setAttribute("employees", employeeList);
                requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
                break;
            default:
                requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/error.jsp");
                break;
        }

        requestDispatcher.forward(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("view");

        if ("delete".equals(action)) {
            int employeeId = Integer.parseInt(request.getParameter("id"));
            employeeDAO.deleteEmployee(employeeId);
            response.sendRedirect("/GE/employee?view=employees");
        } else {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone_number = request.getParameter("phone");
            String position = request.getParameter("position");
            String department = request.getParameter("department");

            Employee employee = new Employee(name, email, phone_number, position, department);
            employeeDAO.save(employee);
            response.sendRedirect("/GE/employee?view=employees");
        }
    }
}
