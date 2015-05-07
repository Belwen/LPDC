<%@page import="epsi.model.Plat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>


<%
Plat plat = (Plat) request.getAttribute("plat");

%>
<h2><%= plat.getDescription() %></h2>
<h3><%= plat.getNbPersonne() %></h3>
<h3><%= plat.isEstChaud() %></h3>
<h3><%= plat.getPrix() %></h3>


<%@include file="footer.jsp" %>