<%-- 
    Document   : profile
    Created on : 24 nov 2023, 00:58:00
    Author     : yungk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.mycompany.wave11.DAO"%>
<%@ page import="com.mycompany.wave11.DatabaseConnector"%>
<%@ page import="model.usuario"%>
<%@ page import="java.io.*" %>
<%
  String pfp="";
    String biografia = "";
    String youtube = "";
    String spotify = "";
    if(request.getSession().getAttribute("usuario") == null){
%>
    <script>
        alert("Debes iniciar sesión");
        window.location="index.jsp";
    </script>
<%
        request.getSession().invalidate();
        return;
    }

    DatabaseConnector conn = new DatabaseConnector();
    usuario username = (usuario)request.getSession().getAttribute("usuario");

    try {
        String query = "SELECT * FROM users WHERE username = ?";
        PreparedStatement ps = conn.getConexion().prepareStatement(query);
        ps.setString(1, username.getUsername());
        ResultSet result = ps.executeQuery();

        if(result.next()){
            String fetchedUsername = result.getString("username");
            pfp = result.getString("pfp");
            biografia = result.getString("biografia");
            youtube = result.getString("youtube");
            spotify = result.getString("spotify");
        } else {
            out.println("Error al obtener la información del usuario");
            return;
        }

        ps.close();
        conn.getConexion().close();
    } catch(SQLException e){
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Wave</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img\cutIcon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/audioplayer.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header>
            <div class="header-area ">
                <div id="sticky-header" class="main-header-area">
                    <div class="container-fluid">
                        <div class="header_bottom_border">
                            <div class="row align-items-center">
                                <div class="col-xl-3 col-lg-2">
                                    <div class="logo">
                                        <a href="index.html">
                                            <img src="img/cutIcon.png" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-7">
                                    <div class="main-menu  d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">
                                                <li><a class="active" href="index.html">Inicio</a></li>
                                                <li><a href="about.html">Sobre</a></li>
                                                <li><a href="track.html">Tracks</a></li>
                                                <li><a href="#">blog <i class="ti-angle-down"></i></a>
                                                    <ul class="submenu">
                                                        <li><a href="blog.html">blog</a></li>
                                                        <li><a href="single-blog.html">single-blog</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                                    <ul class="submenu">
                                                        <li><a href="elements.html">elements</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="contact.html">Contact</a></li>

                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                                    <div class="social_icon text-right">
                                        <ul>
                                            <%
                    // Verifica si la sesión está establecida (el usuario ha iniciado sesión)
                                            if(session.getAttribute("usuario") != null){
                                            %>
                                            <li><a class="button custom-link" href="profile.jsp">Perfil</a></li> 
                                            <li><a class="button custom-link" href="php/logout.jsp">Exit</a></li>
                                                <%
                                                    } else {
                                                %>
                                            <li id="loginStatus" onclick="showLoginPopup()" class="button custom-button">Iniciar sesión</li>
                                                <%
                                                    }
                                                %>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mobile_menu d-block d-lg-none"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </header>
         <div class="bradcam_area breadcam_bg_2">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                    <div>
                         <h1>
                            

                            

                            <!-- <a href="editar_perfil.php">Editar Perfil</a> -->
                            </div>                    
                                             
                    </div>
                </div>
            </div> 
        </div> 
    </div>
                                                <div class="about_area">
                                                    <div class="container">
                                                        <div class="row align-items-center">
                                                            <div class="col-xl-5 col-md-6">
                                                                <div class="about_thumb">
                                                                    <img class="img-fluid" src="<%=pfp%>" alt="Tu Foto de Perfil">
                                                                    <a class="button custom-button" onclick="showEditProfilePopup()">Editar Perfil</a>
                                                                    <ul>
                                                                        <li><a class="button" href="<%= spotify %>">Spotify</a></li>
                                                                        <li><a class="button" href="<%= youtube %>">YouTube</a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-7 col-md-6">
                                                                <div class="about_info">
                                                                    <h3><%= username.getUsername() %></h3>
                                                                    <p>Biografía: <%= biografia %></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="singer_video">
                                                    <div class="container">
                                                        <div class="row justify-content-center">
                                                            <div class="col-xl-10">
                                                                <div class="video-container" data-youtube-link="">
                                                                    <img src="" alt="">
                                                                    <div class="video_btn">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
       <div class="gallery_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-65">
                        <h3>Image Galleries</h3>
                    </div>
                </div>
            </div>
            <div class="row grid">
                    <div class="col-xl-5 col-lg-5 grid-item cat1 col-md-6">
                        <div class="single-gallery mb-30">
                                <div class="portfolio-img">
                                        <img src="img/gallery/1.png" alt="">
                                </div>
                                <div class="gallery_hover">
                                    <a  class="popup-image"  href="img/gallery/1.png" class="hover_inner">
                                        <i class="ti-plus"></i>
                                    </a>
                                </div>
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7 grid-item cat3 cat4 col-md-6">
                        <div class="single-gallery mb-30">
                                <div class="portfolio-img">
                                        <img src="img/gallery/2.png" alt="">
                                </div>
                                <div class="gallery_hover">
                                        <a class="popup-image" href="img/gallery/2.png" class="hover_inner">
                                            <i class="ti-plus"></i>
                                        </a>
                                </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 grid-item cat4 col-md-6">
                        <div class="single-gallery mb-30">
                                <div class="portfolio-img">
                                        <img src="img/gallery/3.png" alt="">
                                </div>
                                <div class="gallery_hover">
                                        <a class="popup-image" href="img/gallery/3.png" class="hover_inner">
                                            <i class="ti-plus"></i>
                                        </a>
                                </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 grid-item cat2 col-md-6">
                        <div class="single-gallery mb-30">
                            <div class="portfolio-img">
                                    <img src="img/gallery/4.png" alt="">
                            </div>
                            <div class="gallery_hover">
                                    <a class="popup-image" href="img/gallery/4.png" class="hover_inner">
                                        <i class="ti-plus"></i>
                                    </a>
                                </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 grid-item cat2 col-md-6">
                        <div class="single-gallery mb-30">
                            <div class="portfolio-img">
                                    <img src="img/gallery/5.png" alt="">
                            </div>
                            <div class="gallery_hover">
                                    <a class="popup-image" href="img/gallery/5.png" class="hover_inner">
                                        <i class="ti-plus"></i>
                                    </a>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>                                                            
  <!-- contact_rsvp -->
    <div class="contact_rsvp">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="text text-center">
                        <h3>Contact For RSVP</h3>
                        <a class="boxed-btn3" href="contact.html">Contact Me</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ contact_rsvp -->

    <!-- footer start -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-md-6">
                            <div class="footer_widget">
                                    <h3 class="footer_title">
                                            Services
                                    </h3>
                                <div class="subscribe-from">
                                        <form action="#">
                                                <input type="text" placeholder="Enter your mail">
                                                <button type="submit" >Subscribe</button>
                                            </form>
                                </div>
                                <p class="sub_text">Esteem spirit temper too say adieus who direct esteem esteems luckily.</p>
                                </div>
                    </div>
                    <div class="col-xl-5 col-md-5 offset-xl-1">
                        <div class="footer_widget">
                                <h3 class="footer_title">
                                        Contact Me
                                </h3>
                            <ul>
                                <li><a href="#">conbusi@support.com
                                    </a></li>
                                <li><a href="#">+10 873 672 6782
                                    </a></li>
                                <li><a href="#">600/D, Green road, Kings Garden NewYork-6732</a></li>
                            </ul>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class=" fa fa-facebook "></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-youtube-play"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-7 col-md-6">
                        <p class="copy_right">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                           
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                    <div class="col-xl-5 col-md-6">
                        <div class="footer_links">
                            <ul>
                                <li><a href="#">home</a></li>
                                <li><a href="#">about</a></li>
                                <li><a href="#">tracks</a></li>
                                <li><a href="#">blog</a></li>
                                <li><a href="#">contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
            crossorigin="anonymous">
    </script>
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/audioplayer.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/gijgo.min.js"></script>
    <script src="js/slick.min.js"></script>
    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script>
    // Función para mostrar la ventana emergente
    function showLoginPopup() {
        // Obtén la referencia a la ventana emergente
        var popup = document.getElementById("loginPopup");

        // Muestra la ventana emergente
        popup.style.display = "block";
        updateLoginStatus();
    }

    function updateLoginStatus() {
        var loginStatusElement = document.getElementById("loginStatus");
        <% 
            if(session.getAttribute("usuario") != null) {
        %>
            loginStatusElement.style.display = "none";
        <%
            } else {
        %>
            loginStatusElement.style.display = "block";
        <%
            }
        %>
    }

    // window.onload = updateLoginStatus;
    function showEditProfilePopup() {
        var editProfilePopup = document.getElementById("editProfilePopup");
        editProfilePopup.style.display = "block";
    }

    function closeEditProfilePopup() {
        var editProfilePopup = document.getElementById("editProfilePopup");
        editProfilePopup.style.display = "none";
    }
    </script>
    <div id="editProfilePopup" class="popup">
        <div class="popup-content">
            <span class="close" onclick="closeEditProfilePopup()">&times;</span>
            <h2>Editar Perfil</h2>

            <!-- Formulario de edición de perfil -->
            <form action="EditarPerfilServlet" method="post" id="editProfileForm" enctype="multipart/form-data">
                <label for="biografia">Biografía:</label>
                <textarea id="biografia" name="biografia"><%= biografia %></textarea>

                <label for="fotoPerfil">URL de la foto de perfil:</label>
                <input type="text" name="fotoPerfil" value="<%= pfp %>">

                <label for="spotify">Link Spotify:</label>
                <input type="text" id="spotify" name="spotify" value="<%= spotify %>">

                <label for="youtube">Link Youtube:</label>
                <input type="text" id="youtube" name="youtube" value="<%= youtube %>">

                <!-- Otros campos del formulario... -->

                <input type="submit" class="button custon-button" value="Guardar cambios">
            </form>
        </div>
    </div>
    <div id="loginPopup" class="popup">
        <div class="popup-content">

            <!-- Contenido de inicio de sesión y registro aquí -->
            <h2>Login or Register</h2>

            <!-- Formulario de inicio de sesión -->
            <form  action="LoginServlet" method="POST" id="loginForm">
                <h3>Login</h3>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit" class="button custom-button">Login</button>
            </form>

            <!-- Formulario de registro -->



            <form action="RegisterServlet" method="POST" id="registerForm">
                <h3>Register</h3>
                <label for="newUsername">New Username:</label>
                <input type="text" id="newUsername" name="newUsername" required>

                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
                <label for="newPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>



                <button type="submit" class="button custom-button" value="Enviar">Register</button>
            </form>

        </div>
    </div>



                                        
        
        
    </body>
</html>
