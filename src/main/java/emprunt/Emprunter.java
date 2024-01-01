package emprunt;

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

@WebServlet("/Emprunter")
public class Emprunter extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("login") != null) {
            String ISBN = request.getParameter("nom_ouvrage");
            String NOM = request.getParameter("nom_etudiant");

            // Vérifier combien d'ouvrages l'étudiant a déjà empruntés
            int nombreEmprunts = obtenirNombreEmprunts(NOM);

            // Limiter à 3 ouvrages
            if (nombreEmprunts < 3) {
                // L'étudiant peut emprunter un nouveau livre
                String url = "jdbc:mysql://localhost:3300/Bibliothquedb";
                String user = "root";
                String pwd = "";
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, user, pwd);
                    PreparedStatement pst = con
                            .prepareStatement("INSERT INTO demandeEmprunt (nom_etudiant,nom_ouvrage) VALUES (?,?)");
                    pst.setString(1, NOM);
                    pst.setString(2, ISBN);
                    pst.executeUpdate();
                    response.sendRedirect("Etudiant.jsp");
                    pst.close();
                    con.close();

                } catch (Exception e) {
                    System.out.print(e);
                }
            } else {
                // L'étudiant a atteint la limite d'emprunts
                response.getWriter().write("Désolé, vous avez atteint la limite d'emprunts (3 ouvrages).");
            }
        } else
            response.sendRedirect("Login.jsp");
    }
    
    private int obtenirNombreExemplairesDisponibles(String nomOuvrage) {
        int nombreDisponible = 0;
        String url = "jdbc:mysql://localhost:3300/Bibliothquedb";
		String user = "root";
		String pwd = "";
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pwd);
			PreparedStatement pst = con.prepareStatement("SELECT o.nom_ouvrage, o.auteurs, o.edition, COUNT(e.isbn) AS nombre_exemplaires "
            + "FROM ouvrages o LEFT JOIN exemplaires e ON o.nom_ouvrage = e.nom_ouvrage "
            + "GROUP BY o.nom_ouvrage");
			
			
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    nombreDisponible = rs.getInt("nombre_disponible");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return nombreDisponible;
    }


    private int obtenirNombreEmprunts(String nomEtudiant) {
        int nombreEmprunts = 0;

        // Utilisation de try-with-resources pour s'assurer que les ressources sont fermées correctement
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/Bibliothquedb", "root", "");
                PreparedStatement pst = con.prepareStatement("SELECT COUNT(*) FROM demandeEmprunt WHERE nom_etudiant = ?")) {
            pst.setString(1, nomEtudiant);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    nombreEmprunts = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return nombreEmprunts;
    }
}
