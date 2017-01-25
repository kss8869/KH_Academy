package course;

import java.sql.*;
import java.util.*;

public class ImgDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ImgDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**본문사진리스트 관련 메서드*/
	public ArrayList<ImgDTO> showImg(String localname_s, int idx_s){
		try{
			conn=semi.db.SemiDB.getConn();
			String sql="select * from Img where localname=? and localnum=? order by idx asc";
			ps=conn.prepareStatement(sql);
			ps.setString(1, localname_s);
			ps.setInt(2, idx_s);
			rs=ps.executeQuery();
			ArrayList<ImgDTO> arr=new ArrayList<ImgDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				int localnum=rs.getInt("localnum");
				String localname=rs.getString("localname");
				String filename=rs.getString("filename");
				
				ImgDTO dto=new ImgDTO(idx, localnum, localname, filename);
				arr.add(dto);
			}
			return arr;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
}


















