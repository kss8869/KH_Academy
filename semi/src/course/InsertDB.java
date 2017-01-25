package course;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
public class InsertDB {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public InsertDB() {
		// TODO Auto-generated constructor stub
	}
	
	/**db입력 관련 메서드*/
	public int dbInsert(int localnum, String localname, String img_num){
		try{
			conn=semi.db.SemiDB.getConn();
			String sql="insert into img values(img_idx.nextval, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, localnum);
			ps.setString(2, localname);
			ps.setString(3, img_num);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
}
