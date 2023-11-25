package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mycompany.wave11.DAO;
import com.mycompany.wave11.DatabaseConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;
import model.usuario;

@WebServlet(name = "EditarPerfilServlet", urlPatterns = { "/EditarPerfilServlet" })
public class EditarPerfilServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Verifica si el usuario está autenticado
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        usuario usuario = (usuario) session.getAttribute("usuario");
        
        // Recoge los datos del formulario
        
        String biografia = request.getParameter("biografia");
        String pfp = request.getParameter("fotoPerfil");
        String spotify = request.getParameter("spotify");
        String youtube = request.getParameter("youtube");
        String username = usuario.getUsername();
        System.out.println("------------------");
        System.out.println(biografia);

        // Utiliza el método updateUser del DAO para actualizar la información del usuario
         // Reemplaza "TuDao" con el nombre real de tu clase DAO
        dao.updateUser(username, biografia, pfp, spotify, youtube);

        // Redirige al usuario a la página del perfil después de la actualización
        response.sendRedirect("profile.jsp");
    }
}