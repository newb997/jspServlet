package board;
// 231227
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BoardPostServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Board board = new Board();
		//board.setName(request.getParameter("name"));	//생성자가 없으면 이렇게 하나하나 만들면됨
		
		// 필요한 생성자를 만들어놓으면 한번에 만들 수 있음
		Board board = new Board(request.getParameter("name"),
							    request.getParameter("subject"),
							    request.getParameter("content"),
							    request.getParameter("pass"),
							    request.getParameter("ip"));
		
//			BoardDao bd = new BoardDao();
//			bd.insertBoard(board);
//			한줄로 바꾸기
		new BoardDao().insertBoard(board);
		response.sendRedirect("list.jsp");
		
	}

}














