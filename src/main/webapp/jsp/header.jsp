<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="epsi.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="/static/js/jquery.js" type="text/javascript"></script>
	<script src="/static/js/bootstrap.js" type="text/javascript"></script>
	<link href="/static/css/bootstrap.css" rel="stylesheet"/>
	<link href="/static/css/style.css" rel="stylesheet"/>
	
	<title>La Pate de cannard</title>
</head>
<body>
	<div class="container">
	
		<div class="header" style="height: 80px">
			<div class="pull-left">

				<h1>La pate de cannard !</h1>
				<h5>Faites vous livrer!</h5>

			</div>
			<div class="pull-right" style="margin-top:20px">
			
			<%
				if(request.getSession().getAttribute("user") == null){												
			%>
			
				<form class="form-inline" action="/app/login" method="post">
					
					<div class="form-group">
					  <label class="sr-only" for="exampleInputEmail3">Email address</label>
					  <input name="email" type="email" class="form-control" id="exampleInputEmail3" placeholder="Enter email">
					</div>
					
					<div class="form-group">
					  <label class="sr-only" for="exampleInputPassword3">Password</label>
					  <input name="password" type="password" class="form-control" id="exampleInputPassword3" placeholder="Password">
					</div>
					
					 <div class="checkbox">
					   <label>
					     <input name="rememberme" type="checkbox"> Remember me
					   </label>
					 </div>
		  			
		  			 <button type="submit" class="btn btn-default">Sign in</button>
		  			 
				
				</form>
				<a href="/jsp/inscription.jsp">
					<button class="btn btn-default">S'inscrire</button>
				</a>
			<%
					if(request.getAttribute("authenticationError") != null){
						%> <p style="color:red;"> Nom d'utilisateur ou mot de passe incorrect </p> <%
					}
				}
				else{
					User user  = (User) request.getSession().getAttribute("user");
			%>
				<p> Connecté en tant que <%=user.getNom() + " " + user.getPrenom()%>
				<a href="/app/logout">(se déconnecter)</a></p>
				<a href="./app/panier">
     				<button class="btn btn-default">Panier</button>
   				</a>
			<%
				}
			%> 
			<p class="info">${ message }</p>
			
			</div>
		</div>
		
		<hr />