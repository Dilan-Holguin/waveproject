package servlet;



import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.mycompany.wave11.DAO;
import model.usuario;

@WebServlet(name = "ObtenerDatosUsuarioServlet", urlPatterns = { "/ObtenerDatosUsuarioServlet" })
public class ObtenerDatosUsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Verifica si el usuario está autenticado
        HttpSession session = request.getSession();
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Obtiene el nombre de usuario de la sesión
        String username = (String) session.getAttribute("usuario");

        // Utiliza el método obtenerDatosUsuario del DAO para obtener los datos del usuario
        DAO dao = new DAO(); // Reemplaza "TuDao" con el nombre real de tu clase DAO
        usuario usuario = dao.obtenerDatosUsuario(username);

        // Configura los datos del usuario en el ámbito de la solicitud
        if (usuario != null) {
            request.setAttribute("usuario", usuario);
            request.setAttribute("fotoPerfil", usuario.getPfp());
            request.setAttribute("biografia", usuario.getBiografia());
            request.setAttribute("youtube", usuario.getYoutube());
            request.setAttribute("spotify", usuario.getSpotify());
        } else {
            // Manejo de error si no se encuentra el usuario
            response.getWriter().println("Error al obtener los datos del usuario.");
            return;
        }

        // Redirige a la página que muestra los datos del usuario (por ejemplo, profile.jsp)
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
