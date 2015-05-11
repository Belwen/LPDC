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

<h1>Les paniers</h1>
<h2><%= lepanier.getIdPanier() %></h2>

<%
List<Plat> plats = (List<Plat>) request.getAttribute("plats");

for(Plat plat: plats){
%>
<h2><%= plat.getDesignation() %> </h2>
<h2><%= plat.getDescription() %> </h2>
<h3><p>Nombre de Personne : <%= plat.getNbPersonne() %> </p></h3>
<%

        if(plat.isEstChaud() == true)
            out.println("Plât Chaud");
        else if (plat.isEstChaud() == false)
            out.println("Plât Froid");
}
%>

s
<p>Panier :)</p>
<% User user  = (User) request.getSession().getAttribute("user");%>
<p>User id :</p><%=user.getIdUser()%>
<%@include file="footer.jsp" %>
