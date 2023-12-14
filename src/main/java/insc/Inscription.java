package insc;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/insc")
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mat = request.getParameter("matricule");
		String nom= request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String anneebac = request.getParameter("anneebac");
		String type = request.getParameter("type");
		String mdp = request.getParameter("mdp");

			
			String url  = "jdbc:mysql://localhost:3300/Bibliothquedb";
			String user = "root";
			String pwd  = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, pwd);
				PreparedStatement pst=con.prepareStatement("INSERT INTO demandeInsc  (matricule,nom,prenom,motdepasse,AnneeBac,role) VALUES (?,?,?,?,?,?)");
				pst.setString(1,mat);
				pst.setString(2,nom);
				pst.setString(3,prenom);
				pst.setString(4,mdp);

				pst.setString(5,anneebac);
				pst.setString(6,type);
				pst.executeUpdate();
				response.sendRedirect("app.jsp");
				pst.close();
				con.close();
			}catch(Exception e) {
				System.out.print(e);
			}
		
		
	}}


	
	
	
	
	
	