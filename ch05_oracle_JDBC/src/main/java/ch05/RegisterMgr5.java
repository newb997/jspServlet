package ch05;

import java.sql.*;
import java.util.ArrayList;
//231220
public class RegisterMgr5 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "aie";
	private final String PASS = "aie";
	
	public RegisterMgr5() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//내가 필요한 select, insert, delete, upadate등을 메소드로 정의
	public ArrayList<EmployeeBean5> getEmpList() {
		ArrayList<EmployeeBean5> alist = new ArrayList<EmployeeBean5>();
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			Statement st = con.createStatement();
			//String query = "select emp_id, emp_name, email, phone, salary, hire_date from employee";
			String query = "select * from employee";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				EmployeeBean5 bean = new EmployeeBean5();
				bean.setEmail(rs.getString("email"));
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setHire_date(rs.getString("hire_date"));
				bean.setSalary(rs.getInt("salary"));
				bean.setPhone(rs.getString("phone"));
				// String query = "select * from employee"; 이렇게 쓰면 순서 상관없음
							
				/*				
				bean.setEmp_id(rs.getString(1));
				bean.setEmp_name(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setPhone(rs.getString(4));
				bean.setSalary(rs.getInt(5));
				bean.setHire_date(rs.getString(6));
				이렇게 하려면 String query = "select emp_id, emp_name, email, phone, salary, hire_date from employee";
				이부분 순서랑 맞게 해줘야함
				*/
				alist.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return alist;
	}
	
	
}
