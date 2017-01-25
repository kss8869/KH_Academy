package course;

import java.sql.*;
import java.util.*;

public class YongsanFoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public YongsanFoodDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**ref의 최고값 구하기*/
	public int getMaxRef(){
		try{
			String sql="select max(ref) from yongsan_food";
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
			String sql="select count(*) from yongsan_food";
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
	public ArrayList<YongsanFoodDTO> courseList(int cp, int ls){
		try{
			conn=semi.db.SemiDB.getConn();
			String sql="select * from (select rownum as rnum, a.* from (select * from yongsan_food order by idx desc)a)b where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<YongsanFoodDTO> arr=new ArrayList<YongsanFoodDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String rname=rs.getString("rname");
				String menu=rs.getString("menu");
				String addr=rs.getString("addr");
				String tel=rs.getString("tel");
				
				YongsanFoodDTO dto=new YongsanFoodDTO(idx, rname, menu, addr, tel);
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
	public YongsanFoodDTO foodContent(int idx){
		try{
			conn=semi.db.SemiDB.getConn();
			String sql="select * from yongsan_food where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			YongsanFoodDTO dto=null;//미리 초기화해놓으면 유효성검사시 else를 할필요가 없다.
			if(rs.next()){
				String rname=rs.getString("rname");
				String menu=rs.getString("menu");
				String addr=rs.getString("addr");
				String tel=rs.getString("tel");
				dto=new YongsanFoodDTO(idx, rname, menu, addr, tel);
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
