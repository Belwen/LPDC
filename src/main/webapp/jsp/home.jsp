<%@page import="epsi.dao.PlatHome" %>
<%@page import="epsi.model.Plat"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>

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
		</li>
	<%}%>
</ul>

<%@include file="footer.jsp" %>