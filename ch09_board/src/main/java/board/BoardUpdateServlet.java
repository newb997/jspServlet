package board;
// 231227
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		Board upBoard = new Board();
		upBoard.setSubject(request.getParameter("subject")); //넣어줘야하니까 setSubject
		upBoard.setContent(request.getParameter("content"));
		
		int num = Integer.parseInt(request.getParameter("num"));
		upBoard.setNum(num);
		
		String inputPass = request.getParameter("pass");	//사용자가 넣은 pass
		
		HttpSession session = request.getSession();
		Board dbBoard = (Board)session.getAttribute("bean");	//db에 있는 pass
		String dbPass = dbBoard.getPass();
		
		PrintWriter out = response.getWriter();
		if(inputPass.equals(dbPass)) {
			new BoardDao().updateBoard(upBoard);
			response.sendRedirect("read.jsp?num="+num);
		} else {
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않습니다');");
			out.print("history.back();");
			out.print("</script>");
		}
		
	}

}
