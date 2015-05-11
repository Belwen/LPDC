<%@page import="epsi.dao.PlatHome" %>
<%@page import="epsi.model.Plat"%>
<%@page import="epsi.dao.MenuHome" %>
<%@page import="epsi.model.Menu"%>
<%@page import="epsi.model.Panier"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>

<section class="container">
        <div class="product-list">
        <h1>Liste des plats</h1>

<%
	List<Plat> plats = (List<Plat>) request.getAttribute("plats");	
	
	for(Plat plat: plats){
		%>
		<div class="product">
            <div class="product-image" style="background-image: url('<%= plat.getPosterPath() %>')"></div>
            <div class="product-name"><a href="/app/plats?id=<%= plat.getIdProduit()%>"><%= plat.getDesignation()  %></a></div>
            <div class="product-price">
                <img src="/static/images/price.png" alt="">
                <div><%= plat.getPrix() %>&#x20AC;</div>
            </div>
            <% if(request.getSession().getAttribute("user") != null){%>
            <div class="add-to-cart">
                <a href="/app/ajoutPanier?id=<%= plat.getIdProduit()%>"><img src="/static/images/cart.png" alt=""></a>
            </div>
            <%} %>
        </div>
	<%}%>
</div>
</section>

<h1>Les menus</h1>
<div class="menu">
<ul class="media-list">
<%
	List<Menu> menus = (List<Menu>) request.getAttribute("menus");	
	
	for(Menu menu: menus){
		%>
		<li class="media">
				<a href="/app/menus?id=<%= menu.getIdProduit()%>">
     				<div class="media-body">
   						<h4 class="media-heading"><%= menu.getDesignation()  %></h4>
 					</div>
   				</a>
 				
		</li>
	<%}%>
</ul>
</div>



<%@include file="footer.jsp" %>