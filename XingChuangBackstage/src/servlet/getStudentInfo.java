package servlet;

import java.io.IOException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.StudentData;
import mode.Student;

/**
 * Servlet implementation class getStudentInfo
 */
@WebServlet("/getStudentInfo")
public class getStudentInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getStudentInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String pageNumber =request.getParameter("pageNumber");
		String pageSize =request.getParameter("pageSize");
		String searchString =request.getParameter("searchString");
		PrintWriter pw =response.getWriter();
		List<Student> studentList = new StudentData().queryStudentInformation(pageNumber, pageSize,searchString);
		JSONArray jsonArray =JSONArray.fromObject(studentList);
		JSONObject jsonObject =new JSONObject();
		int allDataNumber =new StudentData().getTotalDataNumber();
		jsonObject.put("listInformation", jsonArray);
		jsonObject.put("allDataNumber", allDataNumber);
		pw.write(jsonObject.toString());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
