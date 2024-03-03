<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page session = "false" %>
<%List<Map<String,String>> elencobnb = (List<Map<String,String>>) request.getAttribute("elencobnb"); %>
<%List<Map<String,String>> elencocitta = (List<Map<String,String>>) request.getAttribute("elencocitta"); %>
<%List<Map<String,String>> elencolocation = (List<Map<String,String>>) request.getAttribute("elencolocation"); %> 
<%String[] labelsOptionals = (String[]) request.getAttribute("labelsOptionals");%>
<!DOCTYPE html>
<html lang="it">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Il Manuale del B&amp;B</title>

    <!-- Bootstrap core CSS -->
   <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/templatemo_style.css" rel="stylesheet" type="text/css">	
	<link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
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
                        <img src="assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="/">Home</a></li>
                        <%if(request.getSession(false) != null){ %>
                        <% Map<String,String> utente = (Map<String,String>) request.getAttribute("utenteloggato"); %>                    	
                        	<li><div class="more-info col-lg-3 col-sm-6 col-6">
                        			<a class="user" href="/utenti/profilo"><i class="fa fa-user"></i></a>                      		
                      			</div> 
                      		</li>                    		
                      		<li><h4 class ="name-user">Ciao,<%= utente.get("nome") %></h4></li>
                      		<li><a href="utenti/logout">Logout</a></li>
                        <%}%>
                         <%if(request.getSession(false) == null){ %>
	                       <li><form class="form-inline pull-right" role="form" action="/utenti/login" method="post">
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
								  <button type="submit" class="btn btn-default logbtn">Accedi</button>
								</form>																
							</li>
							<li><a class="buttonHeader " href= "utenti/formnuovoutente" target="_blank"><button  class="btn btn-default logbtn">Registrati</button></a></li>								                       
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

  <div class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h4>Trova il B&amp;B dei tuoi sogni con</h4>
          <h2>Il Manuale del B&amp;B</h2>
        </div>
      </div>
    </div>
  </div>

  <div class="search-form">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <form id="search-form" method="get" role="search" action="filter">
            <div class="row">
              <div class="col-lg-2">
                <h4>Cerca per:</h4>
              </div>
              <div class="col-lg-4">
                  <fieldset>
                      <select name="citta" class="form-select" aria-label="Default select example" id="chooseCity">
                          <option value="" disabled selected hidden>Citta'</option>
                          <% for(Map<String,String> citta : elencocitta){%>
                          	<option value="<%= citta.get("citta") %>"><%= citta.get("citta") %></option>
                         <%} %>
                      </select>
                  </fieldset>
              </div>
              <div class="col-lg-4">
                  <fieldset>
                      <select name="prezzo_notte" class="form-select" aria-label="Default select example" id="choosePrice" >
                          <option value="" disabled selected hidden>Prezzo Massimo</option>
                          <option value="30">30€</option>
                          <option value="50">50€</option>
                          <option value="100">100€</option>
                          <option value="150">150€</option>
                      </select>
                  </fieldset>                
              </div>
              <div class="col-lg-2">                        
                  <fieldset>
                      <button type="submit" class="border-button" onClick="saveForm()">Cerca</button>
                  </fieldset>
              </div>
            </div>
            
            <div class="row" style="margin-top:15px">
              <div class="col-lg-2">
                
              </div>
              <div class="col-lg-4">
                  <fieldset>
                     <select name="location" class="form-select" aria-label="Default select example" id="chooseLocation">
                       <option value="" disabled selected hidden>Posizione</option>
                         <% for(Map<String,String> loc : elencolocation){%>
                          	<option value="<%= loc.get("location") %>"><%= loc.get("location") %></option>
                         <%} %>
                     </select>          
                  </fieldset>
              	</div>          
            </div>          
            
            <div class="row" style="margin-top:15px">
              <div class="col-lg-2">
                <h4>Filtra Optionals:</h4>
              </div>
              <div class="col-lg-8">
                  <fieldset>
                  <%int i=0; %>
                  <%for(String k : labelsOptionals){%>
        			<%if(!k.equalsIgnoreCase("id_struttura") && !k.equalsIgnoreCase("id")  ){ %> 
        			<%i++; %>                
                     <div class="form-check form-check-inline">
  						<input class="form-check-input" name="<%=k%>" type="checkbox" id="inlineCheckbox<%=i%>" value="1">
						<label class="form-check-label" for="inlineCheckbox1"><%= k.replace('_', ' ') %></label>
					</div> 
					<%}%>  
				<%}%>              
                  </fieldset>
              	</div>
                <div class="col-lg-2">                        
                  <fieldset>
                      <a href="/"><button type="button" onClick="resetForm()" class="border-button" >Reset</button></a>
                  </fieldset>
              </div>           
            </div>           
          </form>
        </div>
      </div>
    </div>
  </div>
  

  <div class="amazing-deals">
    <div class="container">
      <div class="row">
      	<%if(elencobnb.size()==0){ %>
      	<div class="col-lg-6 offset-lg-3">
          <div class="section-heading text-center">
            <h3>La ricerca non ha dato alcun risultato</h3>         
          </div>
        </div>
      	<% }%>
        <%for(Map<String,String> bnb : elencobnb){ %>
        <%String[] imgs = bnb.get("link_img").split(","); %>
	        <div class="col-lg-6 col-sm-6">
	          <div class="item">
	            <div class="row">
	              <div class="col-lg-6">
	                <div id ="imgBnb" class="image">
	                  <img src="<%=imgs[1] %>" alt="">
	                </div>
	              </div>
	              <div class="col-lg-6 align-self-center">
	                <div class="content">
	                  <span class="info"><%= bnb.get("location") %></span>
	                  <h4><%= bnb.get("nome") %></h4>
	                  <div class="row">
	                    <div class="col-6">
	                      <i class="fa fa-map"></i>
	                      <span class="list"><%= bnb.get("citta") %></span>
	                    </div>
	                    <div class="col-6">
	                      <i class="fa fa-eur"></i>
	                      <span class="list"><%= bnb.get("prezzo_notte") %>/notte</span>
	                    </div>
	                  </div>
	                  <p><%= bnb.get("descrizione").substring(0, 30) %>...</p>
	                  <div class="main-button">
	                    <a href="/bnb/infobnb?id=<%= bnb.get("id") %>">Visita</a>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
        <%} %>
        <!--
        <div class="col-lg-12">
          <ul class="page-numbers">
            <li><a href="#"><i class="fa fa-arrow-left"></i></a></li>
            <li><a href="#">1</a></li>
            <li class="active"><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#"><i class="fa fa-arrow-right"></i></a></li>
          </ul>
        </div>-->
      </div>
    </div>
  </div>
<!--
  <div class="call-to-action">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <h2>Are You Looking To Travel ?</h2>
          <h4>Make A Reservation By Clicking The Button</h4>
        </div>
        <div class="col-lg-4">
          <div class="border-button">
            <a href="reservation.html">Book Yours Now</a>
          </div>
        </div>
      </div>
    </div>
  </div>
-->
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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/tabs.js"></script>
  <script src="assets/js/popup.js"></script>
  <script src="assets/js/custom.js"></script>
  <script src="assets/js/custom2.js"></script>

  <script>
    $(".option").click(function(){
      $(".option").removeClass("active");
      $(this).addClass("active"); 
    });
  </script>

  </body>

</html>
