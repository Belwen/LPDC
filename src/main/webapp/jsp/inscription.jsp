<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="epsi.front.CreationClientServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// Récupération du message d'erreur
String erreur2 = (String) request.getAttribute("erreur2");
// Affichage du message s'il existe
if (erreur2 != null) { %>
<strong>Erreur : </strong>
<%
} %>
<p class="info">${ message }</p>
<form method="post" action="/app/inscription">
	<fieldset>
		<legend>Inscription</legend>
			<label for="nomClient">Nom <span class="requis">*</span></label>
			<input type="text" id="nomClient" name="nomClient" value="" size="30" maxlength="30" />
			<br />
			
			<label for="prenomClient">Prénom </label>
			<input type="text" id="prenomClient" name="prenomClient" value="" size="30" maxlength="30" />
			<br />
			    
			<label for="adresseClient">Adresse de livraison <span class="requis">*</span></label>
			<input type="text" id="adresseClient" name="adresseClient" value="" size="30" maxlength="60" />
			<br />
			
			<label for="telephoneClient">Numéro de téléphone <span class="requis">*</span></label>
			<input type="text" id="telephoneClient" name="telephoneClient" value="" size="30" maxlength="30" />
			<br />
			
			<label for="emailClient">Adresse email<span class="requis">*</span></label>
			<input type="email" id="emailClient" name="emailClient" value="" size="30" maxlength="60" />
			<br />
			
			<label for="mdp">Mot de passe <span class="requis">*</span></label>
			<input type="password" id="mdp" name="mdpClient" value="" size="30" maxlength="30" />
			<br />
			
			<label for="mdp2">Répetez mot de passe <span class="requis">*</span></label>
			<input type="password" id="mdp2" name="mdp2Client" value="" size="30" maxlength="30" />
			<br />
			
			<label for="datenaiss">Votre date de naissance</label>
			<input type="text" id="datenaiss" name="datenaissClient" value="" size="30" maxlength="60" />
			<br />
	</fieldset>
	<button type="submit" value="S'inscrire" class="btn btn-default" name="submit">S'inscrire</button>
	<br /> <input type="reset" value="Remettre à zéro" /> <br />
</form>
						
</body>
</html>