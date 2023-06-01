package context;


import java.sql.*;


public class DBContext {
    
    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
    /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
     public Connection getConnection()throws Exception {
        Class.forName("net.sourceforge.jtds.jdbc.Driver");
            String dbUrl = "jdbc:jtds:sqlserver://CAOTUANKIET:1433/Nhom16_ThietBiXayDung1;instance=MSSQLSERVER01";
            String user="sa";
            String password="123456789";
            return DriverManager.getConnection(dbUrl,user,password);
    }   
     
     public  void thucThiSQL(String sql) throws Exception{
		Connection connect =getConnection();
		Statement stmt = connect.createStatement();
		stmt.executeUpdate(sql);
	}
	public ResultSet chonDuLieu(String sql) throws Exception{
		Connection connect =getConnection();
		Statement stmt = connect.createStatement();
		ResultSet rs=	stmt.executeQuery(sql);
		return rs;
	}
    /*Insert your other code right after this comment*/
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    
    
}
 