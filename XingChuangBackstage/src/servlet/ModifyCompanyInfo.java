package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.StudentData;
import database.CompanyData;
import mode.Student;
import mode.Worker;

/**
 * Servlet implementation class ModifyCompanyInfo
 */
@WebServlet("/ModifyCompanyInfo")
public class ModifyCompanyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCompanyInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String peopleName =request.getParameter("peopleName");
		String companyName =request.getParameter("companyName");
		String companyPhone =request.getParameter("companyPhone");
		String companyAddress =request.getParameter("companyAddress");
		String userName =request.getParameter("userName");
		Worker work =new Worker();
		work.setPeopleName(peopleName);
		work.setCompanyName(companyName);
		work.setCompanyPhone(companyPhone);
		work.setCompanyAddress(companyAddress);
		work.setUserName(userName);
		new CompanyData().updateWorkerInformation(work);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
