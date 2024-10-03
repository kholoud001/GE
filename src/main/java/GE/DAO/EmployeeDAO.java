package GE.DAO;

import GE.model.Employee;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    public void save(Employee employee) {
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

//            session.save(employee.getPosition());
//            session.save(employee.getDepartment());
            session.save(employee);

            transaction.commit();
        }catch (Exception e) {
            if(transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public List<Employee> getAllEmployees() {
        Transaction transaction = null;
        List<Employee> employees = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            employees = session.createQuery("FROM Employee", Employee.class).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return employees;
    }

    public void updateEmployee(Employee updatedEmployee) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try {
            Employee employee = session.get(Employee.class, updatedEmployee.getId());

            if (employee != null) {
                employee.setName(updatedEmployee.getName());
                employee.setEmail(updatedEmployee.getEmail());
                employee.setPhone(updatedEmployee.getPhone());
                employee.setPosition(updatedEmployee.getPosition());
                employee.setDepartment(updatedEmployee.getDepartment());

                session.update(employee);
                transaction.commit();
            } else {
                throw new Exception("Employee not found.");
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
    }

        public void deleteEmployee ( int id) {
            Transaction transaction = null;

            try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                transaction = session.beginTransaction();

                Employee employee = session.get(Employee.class, id);

                if (employee != null) {
                    session.delete(employee);
                    System.out.println("Employee is deleted.");
                }

                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) {
                    transaction.rollback();
                }
                e.printStackTrace();
            }
        }


            public Employee getEmployeeById ( int id){
                Session session = HibernateUtil.getSessionFactory().openSession();
                Transaction transaction = null;
                Employee employee = null;

                try {
                    transaction = session.beginTransaction();
                    employee = session.get(Employee.class, id);
                    transaction.commit();
                } catch (Exception e) {
                    if (transaction != null) {
                        transaction.rollback();
                    }
                    e.printStackTrace();
                } finally {
                    session.close();
                }
                return employee;
            }


    public List<Employee> searchEmployees(String searchTerm) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        List<Employee> employees = null;

        try {
            String hql = "FROM Employee WHERE name LIKE :searchTerm OR email LIKE :searchTerm OR department LIKE :searchTerm OR position LIKE :searchTerm";
            Query<Employee> query = session.createQuery(hql, Employee.class);
            query.setParameter("searchTerm", "%" + searchTerm + "%");
            employees = query.getResultList();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return employees;
    }

    public List<Employee> filterEmployees(String department, String position) {
        List<Employee> employees = new ArrayList<>();
        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Build the HQL query with dynamic conditions
            StringBuilder hql = new StringBuilder("FROM Employee e WHERE 1=1");

            if (department != null && !department.isEmpty()) {
                hql.append(" AND e.department = :department");
            }
            if (position != null && !position.isEmpty()) {
                hql.append(" AND e.position = :position"); // Change OR to AND
            }

            // Prepare and set parameters
            Query<Employee> query = session.createQuery(hql.toString(), Employee.class);

            if (department != null && !department.isEmpty()) {
                query.setParameter("department", department);
            }
            if (position != null && !position.isEmpty()) {
                query.setParameter("position", position);
            }

            // Execute query and get results
            employees = query.getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace(); // Log the exception for debugging
        }

        return employees;
    }




}

