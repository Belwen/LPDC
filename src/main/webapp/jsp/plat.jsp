<%@page import="epsi.model.Plat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@include file="header.jsp" %>


<%
Plat plat = (Plat) request.getAttribute("plat");

%>
<h2><%= plat.getDescription() %> </h2>
<h3><p>Nombre de Personne : <%= plat.getNbPersonne() %> </p></h3>
<%

        if(plat.isEstChaud() == true)
            out.println("Plât Chaud");
        else if (plat.isEstChaud() == false)
            out.println("Plât Froid");
%>

<h3>Prix : <%= plat.getPrix() %> Euro</h3>


<%@include file="footer.jsp" %>