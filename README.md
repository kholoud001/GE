# Employee Management Web Application

## Project Overview

This Employee Management Web Application is a full-stack Java-based solution designed to streamline the process of managing employee data for a company. It provides a comprehensive interface for performing CRUD (Create, Read, Update, Delete) operations on employee records, while offering advanced features like search and filtering based on specific criteria such as department or job position. The application is built with modern web development technologies, ensuring it is intuitive, fast, and efficient for everyday use by HR staff or administrators.

## Key Features

### **1. Employee Management**
This feature enables administrators to effectively manage employee information through an intuitive interface.
- **Create Employee**: Allows the user to add a new employee by entering required fields such as name, email, phone number, department, and position.
- **Read Employee Data**: Displays a list of all employees, complete with their details like name, position, department, and contact information.
- **Update Employee Data**: Users can modify existing employee records, making it easy to update information such as department changes or promotions.
- **Delete Employee**: Administrators can remove employees from the system when necessary, such as when an employee leaves the company.

### **2. User Interface & Experience**
A significant focus of the project is delivering a clean, responsive, and intuitive interface:
- **Dynamic Web Pages**: The application uses JSP and Servlets to generate dynamic content. Each employee action (add, view, update, delete) is tied to an appropriate page, giving the user a clear path for managing records.
- **Form Handling**: Both employee creation and updates are handled through forms, making it easy for the user to submit and modify data.
- **Navigation**: The user interface features clear navigation options, allowing users to quickly switch between viewing the employee list, adding new employees, and performing searches.

### **3. Search and Filtering**
The search and filtering functionality is designed to help users locate specific employees quickly:
- **Search by Employee Name or Email**: Users can search for an employee by entering a name or email address, which displays a filtered list of matching employees.
- **Filter by Department or Position**: To narrow down employee lists, the user can filter based on the department or job position, making it easier to manage large datasets.

## Project Structure

The application follows a typical **Model-View-Controller (MVC)** architecture, separating concerns for better maintainability and scalability:

### **1. Model Layer**
The model layer consists of Java classes that represent the core entities of the application:
- **Employee Model**: Defines the structure of the employee entity with attributes like `id`, `name`, `email`, `phone`, `department`, and `position`.

### **2. Controller Layer**
The controller layer consists of servlets that handle HTTP requests and control the application flow:
- **AddEmployeeServlet**: Handles the creation of a new employee. It captures the form data from the user and saves the employee details to the database.
- **UpdateEmployeeServlet**: Handles the updating of an employee's details. It retrieves the existing employee record, updates the data with user input, and saves the changes.
- **DeleteEmployeeServlet**: Handles the deletion of an employee. It retrieves the employee ID from the request and removes the employee from the database.
- **EmployeeListServlet**: Fetches and displays the list of all employees on the home page, and handles filtering based on user input.
- **SearchEmployeeServlet**: Provides search capabilities based on employee name or email.


## Technologies Used

### Backend:
- **Java EE (Servlets, JSP)**: Used to handle server-side logic, request processing, and dynamic content rendering.
- **Hibernate**: Object-Relational Mapping (ORM) framework used to manage database interactions, making it easier to perform CRUD operations.
- **Jakarta Servlet API**: For handling HTTP requests and routing them to the appropriate servlets.

### Frontend:
- **HTML5/CSS3**: For the basic structure and styling of the web pages.
- **JSP**: Used to dynamically generate HTML pages and handle server-side form submission.

### Database:
- **PostgreSQL**: A robust, open-source relational database used to store employee records. The application interacts with the database via Hibernate to perform data persistence.

### Build Tools:
- **Apache Tomcat**: A Java EE web server used to deploy and run the application.

## Setup Instructions

### Prerequisites:
- Java Development Kit (JDK) 17
- Apache Tomcat 10.x
- PostgreSQL 
- Maven 

### Installation Steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/kholoud001/GE.git
