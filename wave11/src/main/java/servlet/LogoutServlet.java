package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.usuario;


@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtiene la sesión actual o crea una nueva si no existe
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Invalida la sesión (cierra sesión)
            session.invalidate();
        }

        // Redirige al usuario a la página de inicio después de cerrar sesión
        response.sendRedirect("index.jsp");
    }
}
