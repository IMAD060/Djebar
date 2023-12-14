<%@ page language="java"%>
<%@ page import="java.sql.*"%>
    
    <% if(session.getAttribute("login")==null){
    	
		response.sendRedirect("Login.jsp");

    	}%>
    	
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bienvenue,<%= session.getAttribute("login") %></title>
<link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.rtl.min.css" integrity="sha384-nU14brUcp6StFntEOOEBvcJm4huWjB0OcIeQ3fltAfSmuZFrkAif0T+UtNGlKKQv" crossorigin="anonymous">

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
<!DOCTYPE html>
<html>
  <head>
    <title>Title of the document</title>
    <style>
      .tableFixHead {
        overflow-y: auto; 
        height: 200px; 
      }
      .tableFixHead thead th {
        position: sticky; 
        top: 0px; 
      }
      table {
        border-collapse: collapse; 
        width: 100%;
      }
      th,
      td {
        padding: 8px 16px;
        border: 1px solid #ccc;
      }
      th {
        background: #eee;
      }
    </style>
  </head>
  <body>
  <hr style="height: 3px; background-color: blue;">
  <h1 style="text-align: center;">Liste de tous les ouvrage</h1>
  <div style="text-align: center; padding: 20px">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Ajouter Un Nouveau Ouvrage</button>
  
  </div>
    <div class="tableFixHead">
      <table>
      
        <thead>
          <tr>
            <th>Nom Ouvrage</th>
            <th>Auteurs</th>
            <th>Edition</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
        <%
		String url = "jdbc:mysql://localhost:3300/Bibliothquedb";
		String user = "root";
		String pwd = "";
		int number = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pwd);
			PreparedStatement pst = con.prepareStatement("SELECT * FROM ouvrages");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
		%>
		
          <tr>
            <td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><a href="Suprimer?nom_ouvrage=<%=rs.getString(1)%>">Supprimer</a></td>
		
          </tr>
        <%
		}} catch (Exception e) {
			//System.out.print(e);
			}
		
		%>
        </tbody>
      </table>
    </div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Ajouter Un Nouveau Ouvrage</h1>
      </div>
      <div class="modal-body">
        <form method="POST" action="AjouterOvrage">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Nom Ouvrage</label>
            <input type="text" name="nom" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Auteurs</label>
       		<input type="text" name="Auteurs" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Edition</label>
			<input type="text" name="Edition" class="form-control" id="recipient-name">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <button type="submit" class="btn btn-primary">Ajouter</button>
      </div>
      </form>
      
    </div>
  </div>
</div>
  </body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>