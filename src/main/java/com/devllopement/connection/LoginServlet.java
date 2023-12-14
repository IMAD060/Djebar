package com.devllopement.connection;

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


@WebServlet("/app")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String login = request.getParameter("username");
		String passw = request.getParameter("password");
		
		String url  = "jdbc:mysql://localhost:3300/Bibliothquedb";
		String user = "root";
		String pwd  = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pwd);
			PreparedStatement pst=con.prepareStatement("SELECT * FROM user WHERE matricule=? AND motdepasse =?");
			pst.setString(1,login);
			pst.setString(2,passw);
			ResultSet rs = pst.executeQuery();
			
			
			if(rs.next()) {
				
				String userType = rs.getString("role").trim();
				
			    System.out.println("User Type: " + userType);

			    if ("gestionnaire".equals(userType)) {
			        session.setAttribute("login", login);
			        response.sendRedirect("index.jsp");
			    }else if ("Bibliothecaire".equals(userType)) {
			        session.setAttribute("login", login);
			        response.sendRedirect("Bibliothecaire.jsp");
			    }else {
			        response.sendRedirect("accueil.jsp");
			    }
			    
				}else {
					response.sendRedirect("accueil.jsp");

			    }
				
			
			
			rs.close();
			pst.close();
			con.close();
		}catch(Exception e) {
			System.out.print(e);
		}
	}
}
