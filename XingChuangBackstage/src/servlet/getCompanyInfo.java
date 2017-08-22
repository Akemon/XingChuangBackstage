package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.StudentData;
import database.CompanyData;
import mode.Student;
import mode.Worker;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class getCompanyInfo
 */
@WebServlet("/getCompanyInfo")
public class getCompanyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getCompanyInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String pageNumber =request.getParameter("pageNumber");
		String pageSize =request.getParameter("pageSize");
		String searchString =request.getParameter("searchString");
		PrintWriter pw =response.getWriter();
		List<Worker> companyList = new CompanyData().queryWorkerInformation(pageNumber, pageSize,searchString);
		JSONArray jsonArray =JSONArray.fromObject(companyList);
		JSONObject jsonObject =new JSONObject();
		int allDataNumber =new CompanyData().getTotalDataNumber();
		jsonObject.put("listInformation", jsonArray);
		jsonObject.put("allDataNumber", allDataNumber);
		pw.write(jsonObject.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
