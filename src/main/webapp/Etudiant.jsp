<%@ page language="java"%>
<%@ page import="java.sql.*"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% if(session.getAttribute("login")==null){
    	
		response.sendRedirect("Login.jsp");

    	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <%= session.getAttribute("login") %>
         <h1 style="text-align: center;">Liste de tous les ouvrage</h1>
            <div class="tableFixHead">
            
        <table>
      
        <thead>
          <tr>
            <th>Nom Ouvrage</th>
            <th>Auteurs</th>
            <th>Edition</th>
            <th>Disponible</th>
            <th>Action</th>
			
          </tr>
        </thead>
        <tbody>
        <%
		String url = "jdbc:mysql://localhost:3300/Bibliothquedb";
		String user = "root";
		String pwd = "";
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pwd);
			PreparedStatement pst = con.prepareStatement("SELECT o.nom_ouvrage, o.auteurs, o.edition, COUNT(e.isbn) AS nombre_exemplaires "
            + "FROM ouvrages o LEFT JOIN exemplaires e ON o.nom_ouvrage = e.nom_ouvrage "
            + "GROUP BY o.nom_ouvrage");
			ResultSet rs = pst.executeQuery();
			 
			while (rs.next()) {
				
		%>
			
          <tr>
            <td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getInt("nombre_exemplaires")%></td>
			  <td>
            <% 
                int nombreDisponible = rs.getInt("nombre_exemplaires");
                if (nombreDisponible > 0) {
            %>
		<a href="Emprunter?nom_ouvrage=<%=rs.getString(1)%>&nom_etudiant=<%= session.getAttribute("login") %>">Emprunter</a>
                
                
            <% } else { %>
                <a disabled>Emprunter</a>
            <% } %>
        </td>		
          
        <%
				
			}
			
			} catch (Exception e) {
			//System.out.print(e);
			}
		
		%>
        </tbody>
       
      </table>

    </div>
          
     

</body>
</html>