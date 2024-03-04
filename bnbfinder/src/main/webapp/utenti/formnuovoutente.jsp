<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "false" %>

<%String message = (String) request.getAttribute("message"); %>
<!DOCTYPE html>
<html lang="it">
<head>
	<title>Creazione Account</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../assets/css/fontawesome.css">
	<link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="../assets/css/templatemo_style.css" rel="stylesheet" type="text/css">	
</head>
<body class="templatemo-bg-gray">
<%if (message != null && !message.isEmpty()) {%>
    <script>
        alert("<%= message %>");
    </script>
<%}%>

	<h1 class="margin-bottom-15" style="text-align: center;">Creazione Account</h1>
	<div class="container">
		<div class="col-md-12">			
			<form class="form-horizontal templatemo-create-account templatemo-container" role="form" action="/utenti/registrati" method="post">
				<div class="form-inner">
					<div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="first_name" class="control-label" >Nome</label>
			            <input type="text" class="form-control" id="first_name" name="nome" placeholder="" required>		            		            		            
			          </div>  
			          <div class="col-md-6">		          	
			            <label for="last_name" class="control-label" >Cognome</label>
			            <input type="text" class="form-control" id="last_name" name="cognome" placeholder="" required>		            		            		            
			          </div>             
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">		          	
			            <label for="username" class="control-label" >Email</label>
			            <input type="email" class="form-control" id="email" name="email" placeholder="" required>		            		            		            
			          </div>              
			        </div>			
			        <div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="username" class="control-label" >Username</label>
			            <input type="text" class="form-control" id="username" name="username" placeholder="" required>		            		            		            
			          </div>
			          <div class="col-md-6 templatemo-radio-group">
			          </div>             
			        </div>
			        <div class="form-group">			        	
			        	<div class="col-md-6">
			        		<label for="password" class="control-label">Password</label>
			          		<div class="input-group" id="show_hide_password">				          		
	      						<input class="form-control" type="password" name="password" required>     						
	      						<div class="input-group-addon">
	       				 			<a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
				          		</div>
				          	</div>
				        </div>
			        </div>
			        <div class="form-group">
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <input type="submit" value="Crea account" class="btn btn-info">
			            <a href="/" class="pull-right">Torna alla Home</a>
			          </div>
			        </div>	
				</div>				    	
		      </form>		      
		</div>
	</div>
		
	
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>	
	<script src="../assets/js/pswcontroll.js"></script>


</body>
</html>