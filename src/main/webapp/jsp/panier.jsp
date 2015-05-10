<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="epsi.model.Panier"%>
    <%@page import="epsi.model.Plat"%>
<%@ page import="java.util.Date" %>
<%@ page import="epsi.front.CreationClientServlet" %>

<%@include file="header.jsp" %>
<% Panier lepanier = (Panier) request.getAttribute("panier"); %>

<h1>Les paniers</h1>
<h2><%= lepanier.getIdPanier() %></h2>

<%
Plat plat = (Plat) request.getAttribute("plat");


%>
<h2><%= plat.getDesignation() %> </h2>
<h2><%= plat.getDescription() %> </h2>
<h3><p>Nombre de Personne : <%= plat.getNbPersonne() %> </p></h3>
<%

        if(plat.isEstChaud() == true)
            out.println("Plât Chaud");
        else if (plat.isEstChaud() == false)
            out.println("Plât Froid");
%>



<%@include file="footer.jsp" %>
