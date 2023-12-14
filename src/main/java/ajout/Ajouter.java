package ajout;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Ajouter")
public class Ajouter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null){
			String mat = request.getParameter("matricule");
			String nom= request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String anneebac = request.getParameter("anneebac");
			String type = request.getParameter("type");
			
			String url  = "jdbc:mysql://localhost:3300/Bibliothquedb";
			String user = "root";
			String pwd  = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, pwd);
				PreparedStatement pst=con.prepareStatement("INSERT INTO user  (matricule,nom,prenom,motdepasse,AnneeBac,role) VALUES (?,?,?,?,?,?)");
				pst.setString(1,mat);
				pst.setString(2,nom);
				pst.setString(3,prenom);
				pst.setString(4,prenom);
				pst.setString(5,anneebac);
				pst.setString(6,type);

				pst.executeUpdate();
				response.sendRedirect("index.jsp");
				pst.close();
				con.close();
			}catch(Exception e) {
				System.out.print(e);
			}
		}else response.sendRedirect("Login.jsp");
	}

}





