package xx;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDB
{
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pwd = "123456";
	
	public static Connection conn = null;
	
	public JDB()
	{
		try
		{
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}	
	
	public static JDB getDB()
	{
		return new JDB();
	}
}