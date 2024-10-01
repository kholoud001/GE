package GE;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/test-connection")
public class TestConnectionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><body>");
        out.println("<h1>Test de Connexion Hibernate</h1>");

        try {
            // Appel de la méthode de test de connexion
            TestConnection.testHibernateConnection();
            out.println("<p>Connexion réussie à la base de données PostgreSQL via Hibernate.</p>");
        } catch (Exception e) {
            out.println("<p>Erreur lors de la connexion : " + e.getMessage() + "</p>");
            e.printStackTrace();
        }

        out.println("</body></html>");
    }
}
