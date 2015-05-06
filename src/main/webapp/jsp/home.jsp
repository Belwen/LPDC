<%@page import="epsi.dao.UserDao" %>
<%@page import="epsi.model.User"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>

<ul class="media-list">
<%
	List<User> users = (List<User>) request.getAttribute("users");	
	
	for(User user: users){
		%>
		<li class="media">
 				<div class="media-body">
   					<h4 class="media-heading"><%= user.getNom()  %></h4>
 				</div>
		</li>
	<%}%>
</ul>

<%@include file="footer.jsp" %>