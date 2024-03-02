<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page session = "false" %>
<%Map<String,String> bnb = (Map<String,String>) request.getAttribute("mappabnb"); %>
<%Map<String,String> optionals = (Map<String,String>) request.getAttribute("optionals"); %>
<%List<Map<String,String>> altribnb = (List<Map<String,String>>) request.getAttribute("altribnb"); %>
<%String messagep = (String) request.getAttribute("messagep"); %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Il Manuale del B&amp;B</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->

    
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">  
	
	<link href="../assets/css/templatemo_style.css" rel="stylesheet" type="text/css">	
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->
  </head>

<body>
	<%if (messagep != null && !messagep.isEmpty()) {%>
	    <script>
	        alert("<%= messagep %>");
	    </script>  
	<%}%>

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
                        <%if(request.getSession(false) != null){ %>                    	
                        	<li><div class="more-info col-lg-3 col-sm-6 col-6">
                        			<i class="fa fa-user"></i>                       		
                      			</div> 
                      		</li>
                      		<% Map<String,String> utente = (Map<String,String>) request.getAttribute("utenteloggato"); %>
                      		<li><h4 class ="name-user">Ciao,<%= utente.get("nome") %></h4></li>
                      		<li><a href="../utenti/logout">Logout</a></li>
                        <%}%>
                         <%if(request.getSession(false) == null){ %>
	                       <li><form class="form-inline pull-right" role="form" action="../utenti/login" method="post">
								  <div class="form-group">
								    <div class="input-group">
								      <div class="input-group-addon"><i class="fa fa-address-book"></i></div>
								      <input class="form-control" type="text" name="username" placeholder="Username">
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="sr-only" for="password">Password</label>
								    <input type="password" class="form-control" id="password" name="password" placeholder="Password">								 
								  </div>
								  <button type="submit" class="btn btn-default">Accedi</button>
								</form>																
							</li>
							<li><a class="buttonHeader" href= "../utenti/formnuovoutente" target="_blank"><button  class="btn btn-default">Registrati</button></a></li>								                       
						 <%}%>
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
  <!-- ***** Main Banner Area End ***** -->
  
  <div class="cities-town" style="margin-top: 190px;">
    <div class="container">
      <div class="row">
        <div class="slider-content">
          <div class="row">
            <div class="col-lg-12">
              <h2><em><%= bnb.get("nome") %></em></h2>
            </div>
            <div class="col-lg-12"> 
              <div class="owl-cites-town owl-carousel"> 
              <%String[] imgs = bnb.get("link_img").split(","); %>
              <%for(int i=0; i<imgs.length; i++){%>          	
                <div class="item">
                  <div class="thumb">
                    <img src="<%=imgs[i] %>" alt="">
                  </div>
                </div>   
             <%} %>             
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="more-about">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="left-image">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d155418.43546665814!2d12.35369372883973!3d41.902783834437124!2m3!1f357.26927939317244!2f20.870722720054623!3f0!3m2!1i1024!2i768!4f35!3m3!1m2!1s0x13257f1b11618069%3A0x11a1e191567e6b1d!2sItaly!5e1!3m2!1sen!2sth!4v1642869952544!5m2!1sen!2sth" width="100%" height="550px" frameborder="0" style="border:0; border-radius: 23px;" allowfullscreen=""></iframe>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="section-heading">
            <h2>Informazioni <%= bnb.get("nome") %> </h2>
            <p><%= bnb.get("descrizione") %></p>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <div class="info-item">
                <h4><%= bnb.get("prezzo_notte") %>€</h4>
                <span>Prezzo per notte</span>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="info-item">
                 <h4><%= bnb.get("location") %></h4>
                 <span>Location</span>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="info-item">
                <div class="row">
                  <div class="col-lg-6">
                	<h4><%= bnb.get("citta") %></h4>
                	<span>Citta'</span>
                  </div>
                  <div class="col-lg-6">
                    <h4><%= bnb.get("indirizzo") %></h4>
                    <span>Indirizzo</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <div id="section-1"class="container">
  	<div class="section-heading text-center">
       <h2>Optionals inclusi</h2>
    </div>
  	<div class="row">
    <div class="col-lg-12">
      <div class="more-info">
        <div class="row">
        <%for(String k : optionals.keySet()){%>
        	<%if(!k.equalsIgnoreCase("id_struttura") && !k.equalsIgnoreCase("id")  ){ %>
        		<%if(optionals.get(k).equals("1")){%>
	          		<div class="col-lg-3 col-sm-6 col-6">
	            	<!--<i class="fa fa-user"></i>-->
	            		<span class="icon"><img src="../assets/images/icon/<%= k %>.png" ></span>
	            		<h4><%= k.replace('_', ' ') %></h4>
	          		</div> 
          		<%} %>
          	<%}%>	
          <%} %>                       					  
        </div>
      </div>
    </div>
  </div>
</div>
<div class="reservation-form">
  <div class="container">
    <div class="row">
   <div class="col-lg-12">
     <form id="reservation-form"  method="get" role="search" action="prenotazione">
     	<input type="hidden" name="id_struttura" value="<%= bnb.get("id") %>">
     	<%if(request.getSession(false) != null){ %>
     		<% Map<String,String> utente = (Map<String,String>) request.getAttribute("utenteloggato");%>      
     		<input type="hidden" name="id_utente" value="<%= utente.get("id") %>">
     	<%}%>
       <div class="row">
         <div class="col-lg-12">
           <h4>Richiedi prenotazione per il B&amp;B <em><%= bnb.get("nome") %></em></h4>
         </div>
       
		<div class="col-lg-6">
           <fieldset>
               <label for="Number" class="form-label">Data Check In</label>
               <input type="date" name="inizio" class="date" required>
           </fieldset>
          </div> 
         <div class="col-lg-6">
           <fieldset>
               <label for="Number" class="form-label">Data Check Out</label>
               <input type="date" name="fine" class="date" required>
           </fieldset>
         </div>

         <div class="col-lg-12">                        
             <fieldset>
             <%if(request.getSession(false) != null){ %>
                 <button type="submit" class="main-button">Richiedi Prenotazione</button>
             <%}%>
             <%if(request.getSession(false) == null){ %>
                 <h5>E' necessario effettuare il <em>LogIn</em> per richiedere una <em>prenotazione</em></h5>
             <%}%>
             </fieldset>
         </div>
       </div>
     </form>
   </div>
   </div>
  </div>
</div>


  <div class="weekly-offers">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 offset-lg-3">
          <div class="section-heading text-center">
            <h2>Altri B&amp;B nella citta' di <%= bnb.get("citta") %></h2>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-12">
          <div class="owl-weekly-offers owl-carousel">
         
          <%for(Map<String,String> altrobnb : altribnb) {%>
          <%String[] imgsalt = altrobnb.get("link_img").split(","); %>
            <div class="item">
              <div class="thumb">
                <img src="<%= imgsalt[1] %>" alt="">
                <div class="text">
                	<%if(altrobnb.get("nome").length()<=15){ %>
                		 <h4><%= altrobnb.get("nome")%>..   <br><span><i class="fa fa-map"></i>  <%= altrobnb.get("citta") %></span></h4>
                	<%}else{ %>               
                		 <h4><%= altrobnb.get("nome").substring(0, 15) %>..   <br><span><i class="fa fa-map"></i>  <%= altrobnb.get("citta") %></span></h4>
                	<%} %>               
                  <h6><%= altrobnb.get("prezzo_notte") %>€<br><span>/notte</span></h6>
                  <div class="line-dec"></div>
                  <ul>
                    <li>Informazioni:</li>
                    <li><i class="fa fa-building"></i>  <%= altrobnb.get("indirizzo")%></li>
                    <li><i class="fa fa-info"></i>  <%= altrobnb.get("location") %></li>
                  </ul>
                  <div class="main-button">
                    <a href="/bnb/infobnb?id=<%= altrobnb.get("id") %>">Visita</a>
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
