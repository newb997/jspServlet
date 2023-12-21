package ch05;

import java.sql.Connection;
import java.sql.DriverManager;
//231220
public class OracleDBTest1 {

	public static void main(String[] args) {
		
		//231220
		Connection con;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			//Class.forName("com.mysql.jdbc.Driver");		//mysql
			//Class.forName("org.mariaDB.jdbc.Driver");		//mariaDB
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "aie", "aie");
			System.out.println("Success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
