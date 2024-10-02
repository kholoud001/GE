package GE.controller;

import GE.DAO.EmployeeDAO;
import GE.model.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static java.lang.System.out;

public class DisplayEmployeeServlet extends HttpServlet {

    private final EmployeeDAO employeeDAO =new EmployeeDAO();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("id");
        out.println("Employee ID: " + employeeId);

        Employee employee = null;

        try {
            int id = Integer.parseInt(employeeId);
            employee = employeeDAO.getEmployeeById(id);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        if (employee != null) {
            request.setAttribute("employee", employee);
            RequestDispatcher dispatcher = request.getRequestDispatcher("employeeInfo.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("/WEB-INF/views/error.jsp");
        }
    }

    }

