package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.UserData;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		String name =new String (request.getParameter("userName").getBytes("ISO-8859-1"));
		String pass =new String (request.getParameter("pass").getBytes("ISO-8859-1"));
		
		boolean flag =new UserData().check(name, pass);
		System.out.println(flag);
	
		
		
		if(flag){
			String number =request.getParameter("numberCheck");
			HttpSession session =request.getSession();
			String correctNumber =(String) session.getAttribute("rand");
			if(correctNumber.equals(number)){
				session.setAttribute("user",name);
				RequestDispatcher disPatcher =request.getRequestDispatcher("index.jsp");
				  disPatcher.forward(request, response);
			}else{
				 RequestDispatcher disPatcher =request.getRequestDispatcher("adminLogin.jsp?login=false");
				  disPatcher.forward(request, response);
				
			}
		}else{
			 RequestDispatcher disPatcher =request.getRequestDispatcher("adminLogin.jsp?login=false");
			  disPatcher.forward(request, response);
		}
		
	}

	/**                      
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
