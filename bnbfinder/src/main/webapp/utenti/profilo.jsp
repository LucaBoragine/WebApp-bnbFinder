<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "false" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<% Map<String,String> utente = (Map<String,String>) request.getAttribute("utenteloggato"); %>
<%List<Map<String,String>> elencopronotbnb = (List<Map<String,String>>) request.getAttribute("elencopronotbnb"); %>

<!DOCTYPE html>
<html lang="it">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Il tuo profilo</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

  </head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/" class="logo">
                        <img src="../assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
					<ul class="nav">
                        <li><a href="/">Home</a></li>                       
                    </ul>    
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->

  <div class="second-page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h2>Il mio profilo</h2>
        </div>
      </div>
    </div>
  </div>

  <div class="more-info reservation-info">
    <div class="container">
      <div class="row">
	  
        <div class="col-lg-4 col-sm-6">
          <div class="info-item">
            <i class="fa fa-user"></i>
            <h4><%= utente.get("username") %></h4>
            <a href="#">Username</a>
          </div>
        </div>
		
		<div class="col-lg-4 col-sm-6">
          <div class="info-item">
            <i class="fa fa-info-circle"></i>
            <h4><%= utente.get("nome")%>  <%= utente.get("cognome")%></h4>
            <a href="#">Nome e Cognome</a>
          </div>
        </div>
		
		<div class="col-lg-4 col-sm-6">
          <div class="info-item">
            <i class="fa fa-envelope"></i>
            <h4><%= utente.get("email") %></h4>
            <a href="#">e-mail</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  
    <div class="visit-country">
    <div class="container">
      <div class="row" style="justify-content: center;">
        <div class="col-lg-5">
          <div class="section-heading" style="text-align: center;">
            <h2>Le tue prenotazioni</h2>
            <%if(elencopronotbnb.size()==0){ %> 
            	<p>Non hai effettuato alcuna prenotazione</p>
             <%} %>       
          </div>
        </div>
      </div>
      <div class="row" style="justify-content: center;" >
        <div class="col-lg-8">
          <div class="items">
            <div class="row" >
            
            <%for(Map<String,String> bnbp : elencopronotbnb){ %>
        	<%String[] imgs = bnbp.get("link_img").split(","); %>
              <div class="col-lg-12">
                <div class="item">
                  <div class="row">
                    <div class="col-lg-4 col-sm-5">
                      <div class="image">
                        <img src="<%=imgs[1]%>" alt="">
                      </div>
                    </div>
                    <div class="col-lg-8 col-sm-7">
                      <div class="right-content">
                        <h4><%= bnbp.get("nome") %></h4>
                        <span><%= bnbp.get("citta") %></span>
                        <div class="main-button">
                          <a href="/utenti/eliminaprenot?id=<%= bnbp.get("id") %>">Elimina</a>
                        </div>
                        <p><%= bnbp.get("descrizione")%></p>
                        <ul class="info">
                          <li><i class="fa fa-map-marker"></i><%= bnbp.get("indirizzo") %></li>
                          <li><i class="fa fa-calendar"></i><%= bnbp.get("inizio") %></li>
                          <li><i class="fa fa-flag-checkered"></i> <%= bnbp.get("fine") %></li>                   
                        </ul>
                        <div class="text-button">
                          <a href="/bnb/infobnb?id=<%= bnbp.get("id_struttura") %>">Visita pagina B&amp;B<i class="fa fa-arrow-right"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
              <%} %>           
            </div>
          </div>
		 </div>
        </div>
      </div>
    </div>




   <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2024 <a href="#">Il Manuale del B&amp;B</a> Company. All rights reserved. 
          </p>
        </div>
      </div>
    </div>
  </footer>


  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="../assets/js/isotope.min.js"></script>
  <script src="../assets/js/owl-carousel.js"></script>
  <script src="../assets/js/tabs.js"></script>
  <script src="../assets/js/popup.js"></script>
  <script src="../assets/js/custom.js"></script>

  <script>
    $(".option").click(function(){
      $(".option").removeClass("active");
      $(this).addClass("active"); 
    });
  </script>

  </body>

</html>
