<%@page import="epsi.model.Plat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@include file="header.jsp" %>


<%
Plat plat = (Plat) request.getAttribute("plat");
String typecuisine = (String) request.getAttribute("typecuis");

%>
<section class="container">
	<div class="product-infos">
	    <div class="product-image" style="background-image: url('<%= plat.getPosterPath() %>')">
	        <div class="product-price">
	            <img src="/static/images/price.png" alt="">
	            <div><%= plat.getPrix() %>&#x20AC;</div>
	        </div>
	    </div>
	    <h2><%= plat.getDesignation() %></h2>
	    <em class="type-cuisine">Cuisine <%= typecuisine %></em>
	    <p><%= plat.getDescription() %></p>
	    <em class="nb-personnes">Pour <%= plat.getNbPersonne() %> personne</em>
	    <em class="plat-chaud">
	    <% if(plat.isEstChaud() == true)
	    	out.println("Plat Chaud");
	   	   else if (plat.isEstChaud() == false)
	   		out.println("Plat Froid"); %>
	    </em>
	    <a href="/app/ajoutPanier?id=<%= plat.getIdProduit()%>">Ajouter au panier</a>
	</div>
</section>


<%@include file="footer.jsp" %>