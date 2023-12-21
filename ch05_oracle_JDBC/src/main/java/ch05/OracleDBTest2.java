package ch05;


import java.sql.*;
//231220

public class OracleDBTest2 {

	public static void main(String[] args) {
		Connection con;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "aie", "aie");
			System.out.println("Success");
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from department");	//쿼리문을 얻어와서 rs에 저장
			
			while(rs.next()) {	//얻어온 쿼리문 출력
				String id = rs.getString(1);	//데이터베이스 인덱스는 1부터시작
				String title = rs.getString(2);
				String location = rs.getString(3);
				System.out.println(id + ", " + title + ", " + location);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
