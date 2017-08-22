package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.StudentData;
import mode.Student;

/**
 * Servlet implementation class ModifyStudentInfo
 */
@WebServlet("/ModifyStudentInfo")
public class ModifyStudentInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyStudentInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String stuNickName =request.getParameter("stuNickName");
		String stuSex =request.getParameter("stuSex");
		String stuMail =request.getParameter("stuMail");
		String stuPhone =request.getParameter("stuPhone");
		String stuSchool =request.getParameter("stuSchool");
		String stuPoints =request.getParameter("stuPoints");
		String userName =request.getParameter("userName");
		Student student =new Student();
		student.setStuNickName(stuNickName);
		student.setStuSex(stuSex);
		student.setStuMail(stuMail);
		student.setStuPhone(stuPhone);
		student.setStuSchool(stuSchool);
		student.setStuPoints(stuPoints);
		student.setUserName(userName);
		new StudentData().updateStudentInformation(student);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
