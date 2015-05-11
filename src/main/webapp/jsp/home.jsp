<%@page import="epsi.dao.PlatHome" %>
<%@page import="epsi.dao.ProduitHome" %>
<%@page import="epsi.model.Plat"%>
<%@page import="epsi.dao.MenuHome" %>
<%@page import="epsi.model.Menu"%>
<%@page import="epsi.model.Panier"%>
<%@page import="epsi.model.PanierContient"%>
<%@page import="epsi.model.Produit"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>

<h1>Plat Seul</h1>
<div class="plat">
<ul class="media-list">

<%
	List<Plat> plats = (List<Plat>) request.getAttribute("plats");	
	
	for(Plat plat: plats){
		%>
		<li class="media">
				<a href="./app/plats?id=<%= plat.getIdProduit()%>">
     				<div class="media-body">
   						<h4 class="media-heading"><%= plat.getDesignation()  %></h4>
 					</div>
   				</a>
   				<form method="post" action="/app/ajoutPanier?id=<%= plat.getIdProduit()%>">
   				<label for="nbre">Nombre produit <span class="requis">*</span></label>
				<input type="number" id="nbre" name="nbre" value="1" size="8" maxlength="10" />
   				
   				<% if(request.getSession().getAttribute("user") != null){%>
<%--    				<% PanierContient pc = new PanierContient(); 
//    				PlatHome platDao = new PlatHome();
//    				Plat plat_panier = platDao.findById(plat.getIdProduit());
//    				ProduitHome prodDao = new ProduitHome();
//    				Produit produit_panier = prodDao.findById(plat.getIdProduit());
//    				pc.getPanier();
<%--    				pc.getProduit();%> --%>
   				
   				<a href="./app/ajoutPanier?id=<%= plat.getIdProduit()%>">
   				
   				
     				<button class="btn btn-default">Ajouter au Panier</button>
   				</a>
   				<%} %>
   				</form>
   				
   				<div>
<%-- 					<a class="btn btn-default" href="buyalbum?id=<%= album.getId() %>" role="button">Ajouter au panier</a>
 --%>				</div>
 				
		</li>
	<%}%>
</ul>
</div>

<h1>Les menus</h1>
<div class="menu">
<ul class="media-list">
<%
	List<Menu> menus = (List<Menu>) request.getAttribute("menus");	
	
	for(Menu menu: menus){
		%>
		<li class="media">
				<a href="./app/menus?id=<%= menu.getIdProduit()%>">
     				<div class="media-body">
   						<h4 class="media-heading"><%= menu.getDesignation()  %></h4>
 					</div>
   				</a>
 				
		</li>
	<%}%>
</ul>
</div>



<%@include file="footer.jsp" %>