<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="epsi.model.Panier"%>
    <%@page import="epsi.model.Plat"%>
    <%@page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="epsi.front.CreationClientServlet" %>

<%@include file="header.jsp" %>
<% Panier lepanier = (Panier) request.getAttribute("panier"); %>

<section class="container">
<h1>Panier</h1>
<h2><%= lepanier.getIdPanier() %></h2>

<%
List<Plat> plats = (List<Plat>) request.getAttribute("plats");

for(Plat plat: plats){
%>
	<div class="product-infos">
        <div class="product-image" style="background-image: url('<%= plat.getPosterPath() %>')">
            <div class="product-price">
                <img src="/static/images/price.png" alt="">
                <div><%= plat.getPrix() %>&#x20AC;</div>
            </div>
        </div>
        <h2><%= plat.getDesignation() %></h2>
        <em class="type-cuisine">Cuisine Française</em>
        <p><%= plat.getDescription() %></p>
        <em class="nb-personnes">Pour <%= plat.getNbPersonne() %> personne</em>
        <em class="plat-chaud">
        <% if(plat.isEstChaud() == true)
        	out.println("Plat Chaud");
       	   else if (plat.isEstChaud() == false)
       		out.println("Plat Froid"); %>
        </em>
        <a href="#">Ajouter au panier</a>
    </div>
<% } %>

<% User user  = (User) request.getSession().getAttribute("user");%>
<p>User id :</p><%=user.getIdUser()%>
</section>
<%@include file="footer.jsp" %>
