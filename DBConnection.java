package book;
import java.sql.*;


public class DBConnection {
	   	private static final String URL ="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_skimistry";
	   	private static final String USER = "jn2mx5251k";
	   	private static final String PWD = "z3mm2kikhy13kl1lx30h42hyzj0ih2350lm024k1";
	   	//private static final String URL ="jdbc:mysql://localhost:3306/bookdb";
	   	//private static final String USER = "root";
	   	//private static final String PWD = "547783544";
	   	private  Connection con = null;
	   	public DBConnection(){
	  	try {
	  		Class.forName("com.mysql.jdbc.Driver");
	  		con = DriverManager.getConnection(URL,USER,PWD);
	  		System.out.println("database connecting succeed");
	  	} catch (SQLException e) {
	  		System.out.println("database connecting failed");
	  		// TODO Auto-generated catch blo-QWAwaaAck
	  		e.printStackTrace();
	  	} catch (ClassNotFoundException e) {
	  		// TODO Auto-generated catch block
	  		System.out.println("driver load failed");
	  		e.printStackTrace();
	  	}
	   }
	   public Connection getConnection(){
		   return con;
	   }
	   public void close(){
		   try {
	    		this.con.close();
	    		System.out.println("database closing succeed");
	    		} catch (SQLException e) {
	    		// TODO Auto-generated catch block
	    		System.out.println("database closing failed");
	    		e.printStackTrace();
	    	}
	   }
}
