<%@page import="epsi.model.Traiteur"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@include file="header.jsp" %>


<%
List<Traiteur> lestraiteurs =(List<Traiteur>) request.getAttribute("traiteurs");

for(Traiteur traiteur: lestraiteurs){
%>
<h2><%= traiteur.getNomTraiteur() %> </h2>
<h2><%= traiteur.getTelTraiteur() %> </h2>
<h2><%= traiteur.getAdresse() %> </h2>
<%

}
%>


<%@include file="footer.jsp" %>