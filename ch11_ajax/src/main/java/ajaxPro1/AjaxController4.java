package ajaxPro1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

public class AjaxController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> alist = new MemberDao().getAllMember();
		
		// JSONArray [{key:value},{key:value},{key:value},...] 
//		JSONArray jArr = new JSONArray();
//		for(Member m : alist) {
//			JSONObject jobj = new JSONObject();
//			jobj.put("id", m.getId());
//			jobj.put("name", m.getName());
//			jobj.put("gender", m.getGender());
//			jobj.put("email", m.getEmail());
//			jArr.add(jobj);
//		}
//		
//		response.setContentType("application/json; charset=utf-8");
//		response.getWriter().print(jArr);
		
		
		// GSON을 사용하면 코드를 2줄로 만들 수 있음
		
//		JSONArray jArr = new JSONArray();
//		for(Member m : alist) {
//			JSONObject jobj = new JSONObject();
//			jobj.put("id", m.getId());
//			jobj.put("name", m.getName());
//			jobj.put("gender", m.getGender());
//			jobj.put("email", m.getEmail());
//			jArr.add(jobj);
//		}
		
		//위의 과정을 자동으로 처리해줌		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(alist, response.getWriter());
		
	}

}
