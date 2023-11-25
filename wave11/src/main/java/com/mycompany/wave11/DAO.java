/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.wave11;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;
import model.usuario;
/**
 *
 * @author yungk
 */

public class DAO {
    PreparedStatement ps=null;
    DatabaseConnector conn = new DatabaseConnector();
    ResultSet rs=null;
    
    public void CreateUser(String username, String contrasena, String contrasena2){
        if (contrasena.equals(contrasena2)){
            try { 
                String query = "INSERT INTO users (username, contrasena) values( ?, ?)";
                ps=conn.getConexion().prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, contrasena);
                ps.executeUpdate();
            }  
            catch( SQLException e){
                e.printStackTrace();
            }
        }  
    }
    
    public void updateUser(String username, String biografia, String fotoPerfil, String spotify, String yt) {
        try {
            String query = "UPDATE users SET biografia = ?, pfp = ?, spotify = ?, youtube = ? WHERE username = ?";
            PreparedStatement ps = conn.getConexion().prepareStatement(query);
            ps.setString(1, biografia);
            ps.setString(2, fotoPerfil);
            ps.setString(3, spotify);
            ps.setString(4, yt);
            ps.setString(5, username);
            ps.executeUpdate();
            
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
       public usuario obtenerDatosUsuario(String username) {
        usuario usuario = new usuario();

        try {
            String query = "SELECT * FROM users WHERE username = ?";
            PreparedStatement ps = conn.getConexion().prepareStatement(query);
            ps.setString(1, username);
            ResultSet result = ps.executeQuery();

            if (result.next()) {
                usuario.setUsername(result.getString("username"));
                usuario.setPfp(result.getString("pfp"));
                usuario.setBiografia(result.getString("biografia"));
                usuario.setYoutube(result.getString("youtube"));
                usuario.setSpotify(result.getString("spotify"));
            } else {
                // Si no se encuentra el usuario, podrías devolver null o lanzar una excepción según tu lógica
                usuario = null;
            }

            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de excepciones según tu lógica
            usuario = null;
        } finally {
            
        }

        return usuario;
    }

}
