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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css"
	integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv"
	crossorigin="anonymous">


<title></title>
</head>
<body>
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
	<!-- <div align="left">
		Bienvenue
		<%=login%><br>
	</div>
	 -->
	<h1 style="text-align: center;">Ajouter un Etudiant</h1>
	<form class="row g-3" method="POST" action="Ajouter" style="margin: 100px;">
	
		<div class="col-md-6">
			<label for="inputEmail4" class="form-label">Matricule</label> <input
				type="text" class="form-control" id="inputEmail4" name="matricule"
				required>
		</div>
		<div class="col-md-6">
			<label for="inputPassword4" class="form-label">Année bac</label> <input
				type="text" class="form-control" id="inputPassword4" name="anneebac">
		</div>
		<div class="col-md-6">
			<label for="inputAddress" class="form-label">Nom</label> <input
				type="text" class="form-control" id="inputAddress" name="nom"
				required>
		</div>
		<div class="col-md-6">
			<label for="inputAddress2" class="form-label"> Prenom</label> <input
				type="text" class="form-control" id="inputAddress2" name="prenom"
				required>
		</div>
		
		
		
	 <div class="col-12">
			<label for="inputState" class="form-label">Type</label> <select
				id="inputState" class="form-select" name="type">
				<option selected value="Etudiant interne">Etudiant interne</option>
				<option value="Etudiant externe">Etudiant externe</option>
				<option value="Enseigant">Enseigant</option>
				<option value="Bibliothecaire">Bibliothecaire</option>
			</select>
		</div>

		<div class="col-12" style="text-align: right;">
			<input type="submit" class="btn btn-primary" value="Ajouter">
			<input type="reset" class="btn btn-primary" value="Retablir">
		</div>
	</form>

	<br>
	<h1 style="text-align: center;">Listre des demande dinscription</h1>
	<table class="table table-striped table-hover" border="1" width="100%">
		<tr>
			<th>Matricule</th>
			<th>Nom</th>
			<th>Prenom</th>
			<th>Annee bac</th>
			<th>Type inscirption</th>
			<th>Action</th>
		</tr>
		<%
		String url = "jdbc:mysql://localhost:3300/Bibliothquedb";
		String user = "root";
		String pwd = "";
		int number2 = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pwd);
			PreparedStatement pst = con.prepareStatement("SELECT * FROM demandeInsc");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><a href="Delete?nom=<%=rs.getString(1)%>">Supprimer</a></td>
		</tr>


		<%
		}
		pst = con.prepareStatement("SELECT COUNT(*) FROM demandeInsc");
		rs = pst.executeQuery();
		rs.next();
		number2 = rs.getInt(1);
		rs.close();
		pst.close();
		con.close();
		} catch (Exception e) {
		//System.out.print(e);
		}
		%>
	</table>

	Nomber des etudiants :
	<%=number2%><br>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>