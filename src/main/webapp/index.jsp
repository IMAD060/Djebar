<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<%
String login = "";
if (session.getAttribute("login") != null) {
	login = session.getAttribute("login").toString();
} else {
	response.sendRedirect("Login.jsp");
}
%>

    <link rel="stylesheet" href="style.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Espace Gestionnnaire</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css" integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv" crossorigin="anonymous">

<body>
    <script src="script.js"></script>

	<header>
		<a href="index.html"><img src="logo.jpg" width="200" alt=""></a>
		<span class="masq" onclick="toggleMenu()"><i
			class="fa-solid fa-bars"></i></span>
		<ul class="menu-list">
			<li>Accueil</li>
			<li>Ouvrages</li>
			<li>Memoires</li>
			<li>A propos de nous</li>
		</ul>
		<a class="contacte" href="Logout">Deconnexion</a>
	</header>
	 
        
    

	
	<button class="btn btn-warning""><a style="text-decoration: none;color:  black; font-size: 2em;" href="ajouter.jsp">Ajouter</a></button>
	<br>
	<br>
		
	<table class="table table-striped table-hover" border="1" width="100%">
		<tr>
			<th>Matricule</th>
			<th>Nom</th>
			<th>Prenom</th>
			<th>type Abonne</th>
			<th>Annee bac</th>
			<th>Action</th>
		</tr>
		<%
		String url = "jdbc:mysql://localhost:3300/Bibliothquedb";
		String user = "root";
		String pwd = "";
		int number = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pwd);
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(5)%></td>
			<td><a href="Delete?matricule=<%=rs.getString(1)%>">Supprimer</a></td>
		</tr>


		<%
		}
		pst = con.prepareStatement("SELECT COUNT(*) FROM user");
		rs = pst.executeQuery();
		rs.next();
		number = rs.getInt(1);
		rs.close();
		pst.close();
		con.close();
		} catch (Exception e) {
		//System.out.print(e);
		}
		%>
	</table>
	
	Nomber des etudiants :
	<%=number%><br>



</body>
</html>