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
        }
