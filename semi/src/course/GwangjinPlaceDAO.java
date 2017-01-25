package course;

import java.sql.*;
import java.util.*;

public class GwangjinPlaceDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public GwangjinPlaceDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**ref의 최고값 구하기*/
	public int getMaxRef(){
		try{
			String sql="select max(ref) from gwangjin_place";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0;
			if(rs.next()){
				max=rs.getInt(1);
			}
			return max;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2){}
		}
	}
	
	/**총게시물 수 관련 메서드*/
	public int getTotalCnt(){
		try{
			conn=semi.db.SemiDB.getConn();
			String sql="select count(*) from gwangjin_place";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			count=count==0?1:count;
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return 1;//오류가 나더라도 1을 돌려줘서 페이지가 나올 수 있도록한다.
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	/**추천코스리스트보기 관련 메서드*/
	public ArrayList<GwangjinPlaceDTO> courseList(int cp, int ls){
		try{
			conn=semi.db.SemiDB.getConn();
			String sql="select * from (select rownum as rnum, a.* from (select * from gwangjin_place order by idx desc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<GwangjinPlaceDTO> arr=new ArrayList<GwangjinPlaceDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String place=rs.getString("place");
				String addr=rs.getString("addr");
				
				GwangjinPlaceDTO dto=new GwangjinPlaceDTO(idx, place, addr);
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
	
	/**본문관련 메서드*/
	public GwangjinPlaceDTO courseContent(int idx){
		try{
			conn=semi.db.SemiDB.getConn();
			String sql="select * from gwangjin_place where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			GwangjinPlaceDTO dto=null;//미리 초기화해놓으면 유효성검사시 else를 할필요가 없다.
			if(rs.next()){
				String place=rs.getString("place");
				String addr=rs.getString("addr");
				dto=new GwangjinPlaceDTO(idx, place, addr);
			}
			return dto;
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


























