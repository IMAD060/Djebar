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


@WebServlet("/AjouterOvrage")
public class AjouterOvrage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null){
			String nom = request.getParameter("nom");
			String Auteurs= request.getParameter("Auteurs");
			String Edition = request.getParameter("Edition");
			String url  = "jdbc:mysql://localhost:3300/Bibliothquedb";
			String user = "root";
			String pwd  = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, pwd);
				PreparedStatement pst=con.prepareStatement("INSERT INTO ouvrages (nom_ouvrage,auteurs,edition) VALUES (?,?,?)");
				pst.setString(1,nom);
				pst.setString(2,Auteurs);
				pst.setString(3,Edition);				

				pst.executeUpdate();
				response.sendRedirect("Bibliothecaire.jsp");
				pst.close();
				con.close();
			}catch(Exception e) {
				System.out.print(e);
			}
		}else response.sendRedirect("Login.jsp");
	}

}





