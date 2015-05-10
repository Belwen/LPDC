<%@page import="epsi.dao.PlatHome" %>
<%@page import="epsi.model.Plat"%>
<%@page import="epsi.dao.MenuHome" %>
<%@page import="epsi.model.Menu"%>
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

<a href="/jsp/inscription.jsp">
	<p>Nouvel utilisateur</p>
</a>
<%@include file="footer.jsp" %>