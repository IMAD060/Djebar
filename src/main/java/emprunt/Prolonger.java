package emprunt;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Prolonger")
public class Prolonger extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null){
			String emprunt = request.getParameter("emprunt");
			String nom= request.getParameter("nom_etudiant");
			
			Timestamp date_retour= Timestamp.valueOf(request.getParameter("date_retour"));
			
			/*LocalDateTime currentDateTime = LocalDateTime.now();
			Timestamp timestamp = Timestamp.valueOf(currentDateTime);
			LocalDateTime dateRetour = currentDateTime.plusDays(15); 
			Timestamp timestampDateRetour = Timestamp.valueOf(dateRetour);*/
			String url  = "jdbc:mysql://localhost:3300/Bibliothquedb";
			String user = "root";
			String pwd  = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, pwd);
				PreparedStatement pst=con.prepareStatement("INSERT INTO demandeprolongation (nom_etudiant,isbn,date_retour) VALUES (?,?,?)");
				pst.setString(1,nom);
				pst.setString(2,emprunt);			
				pst.setTimestamp(3,date_retour);			

				pst.executeUpdate();
				response.sendRedirect("Etudiant.jsp");
				pst.close();
				con.close();
			}catch(Exception e) {
				System.out.print(e);
			}
		}else response.sendRedirect("Login.jsp");
	}

}


