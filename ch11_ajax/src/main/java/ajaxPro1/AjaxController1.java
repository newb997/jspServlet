package ajaxPro1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AjaxController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("input");
		
		response.setContentType("text/html; charset=utf-8");
		
//		PrintWriter out = response.getWriter();
//		out.print("<html>");
		
		// 위에 두줄을 한줄로 줄이면
//		response.getWriter().print(str);
		
		String responseData = "입력된 값 : " + str + ", 길이" + str.length();
		response.getWriter().print(responseData);
	}

}
