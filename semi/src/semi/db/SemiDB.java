package semi.db;

import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;



public class SemiDB {//DBCP를 이용하여 데이터베이스를 연결해주는 모듈
	static DataSource ds; //프로그램이 실행될때 한번만 실행시키기 위해 스태틱변수로 만든다.
	static{
		try{
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static Connection getConn() 
	throws Exception{
		return ds.getConnection();//db에서 가져온 정보를 저장한 ds에서 연결정보를 가져온다.
	}
}
