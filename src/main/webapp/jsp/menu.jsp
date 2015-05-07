<%@page import="epsi.model.Menu"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@include file="header.jsp" %>


<%
Menu menu = (Menu) request.getAttribute("menu");

%>
<h2><%= menu.getDescription() %> </h2>


<%@include file="footer.jsp" %>