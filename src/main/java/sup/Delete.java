package sup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null){
			String id = request.getParameter("matricule");
			
			String url  = "jdbc:mysql://localhost:3300/Bibliothquedb";
			String user = "root";
			String pwd  = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, pwd);
				PreparedStatement pst=con.prepareStatement("DELETE FROM user WHERE matricule=?");
				pst.setString(1,id);
				pst.executeUpdate();
				response.sendRedirect("index.jsp");
				pst.close();
				con.close();
			}catch(Exception e) {
				System.out.print(e);
			}
		}else response.sendRedirect("connection.jsp");
	}


}