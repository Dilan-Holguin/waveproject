package servlet;

import com.mycompany.wave11.DatabaseConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mycompany.wave11.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="RegisterServlet", urlPatterns={"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            String username=request.getParameter("newUsername");
            String contrasena=request.getParameter("newPassword");
            String contrasena2=request.getParameter("confirmPassword");
            DAO dao = new DAO();
            response.sendRedirect("index.jsp");
            dao.CreateUser(username, contrasena, contrasena2);

    } 
        
    
}
