<%@ page import="java.util.List" %>
<%@ page import="test.OuvrageInfo" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Afficher les exemplaires</title>
</head>
<body>

<h2>Liste des ouvrages  nombre d'exemplaires :</h2>



<c:forEach var="ouvrage" items="${ouvrages}">
    <p>ID Ouvrage : ${ouvrage.nom_ouvrage}, Nombre d'exemplaires : ${ouvrage.nombreExemplaires}</p>
</c:forEach>



</body>
</html>
