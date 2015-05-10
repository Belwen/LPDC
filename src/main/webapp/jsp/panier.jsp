<%@include file="header.jsp" %>

<p>Panier :)</p>
<% User user  = (User) request.getSession().getAttribute("user");%>
<p>User id :</p><%=user.getIdUser()%>
<%@include file="footer.jsp" %>