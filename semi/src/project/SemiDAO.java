package project;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import java.util.*;


public class SemiDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**가이드 신청 목록*/
	public ArrayList<requestDTO> guiderequest(){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="select * from guiderequest";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<requestDTO> arr=new ArrayList<requestDTO>();
			
			while(rs.next()){
				int idx=rs.getInt("idx");
				int touridx=rs.getInt("touridx");
				String id=rs.getString("id");
				String guidelocal=rs.getString("guidelocal");
				String content=rs.getString("content");
				java.sql.Date requestdate=rs.getDate("requestdate");
				java.sql.Date comdate=rs.getDate("comdate");
				
				requestDTO dto=new requestDTO(idx, touridx, id, guidelocal, content, requestdate, comdate);
				arr.add(dto);		
			}
			return arr;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
			
		}
		
	}
	/**가이드 신청서 작성메소드*/
	public int tourrequest(requestDTO dto){
		 
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="insert into guiderequest values(guiderequest_idx.nextval,?,?,?,?,sysdate,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,dto.getTouridx() );
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getGuidelocal());
			ps.setString(4, dto.getContent());
			
			int count =ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}	
	}//end method
	/**1:1문의 게시판 메소드*/
	public ArrayList<boardDTO> board(int start, int end, String userid){
		
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="select * from(select rownum as rnum,a.* from(select * from guideboard where id=? order by idx desc)a) where rnum between "+start+" and	"+end;
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			
			ArrayList<boardDTO> arr=new ArrayList<boardDTO>();
			
			while(rs.next()){
				int rnum=rs.getInt("rnum");
				int idx=rs.getInt("idx");
				int requestidx=rs.getInt("requestidx");
				String id=rs.getString("id");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				String guideid=rs.getString("guideid");
				int readnum=rs.getInt("readnum");
				java.sql.Date comdate=rs.getDate("comdate");
		
		
				
				boardDTO bdto=new boardDTO(readnum,rnum, idx, requestidx, id, subject, content, guideid, comdate);
				arr.add(bdto);
			}
			return arr;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		
	}//end method
	/**1:1문의게시판 총게시물 구하기*/
	public int datacount(){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="select count(*) from guideboard";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int count=0;
			while(rs.next()){
				count=rs.getInt("count(*)");
			}
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		
	}//end method
	/**본문 가져오기*/
	public boardDTO boardcontent(int useridx){
		
		
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="select * from guideboard where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, useridx);
			rs=ps.executeQuery();
			
			boardDTO dto=new boardDTO();
			
			if(rs.next()==true){
				
				
				
				dto.setIdx(rs.getInt("idx"));
				dto.setRequestidx(rs.getInt("requestidx"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setGuideid(rs.getString("guideid"));
				dto.setComdate(rs.getDate("comdate"));
			}
			
			return dto;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}//end method
	/**1:1문의 게시글 삭제 메소드*/
	public int board_delete(int useridx){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="delete from guideboard where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,useridx);
			int count=ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		
	}
	/**1:1문의 게시판 글작성*/ /**학원컴퓨터 테이블과 */
	public int board_insert(String id,String subject,String content,String guideid){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="insert into guideboard values(guideboard_idx.nextval,0,?,?,?,?,0,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, subject);
			ps.setString(3, content);
			ps.setString(4, guideid);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}//end method
	/**댓글적용 메소드*/
	public int commentUpdate(int boardidx,String id,String content){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="insert into boardcomment values(boardcomment_idx.nextval,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, boardidx);
			ps.setString(2, id);
			ps.setString(3, content);
			
			int count=ps.executeUpdate();
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}
	/**코멘트 리스트 불러오기 */
	public ArrayList<commentDTO> commentList(int start,int end){
		
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="select * from(select rownum as rnum,a.* from(select * from boardcomment order by idx asc)a) where rnum between "+start+" and "+end;
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<commentDTO> arr=new ArrayList<commentDTO>();
			
			while(rs.next()){
				
			int rnum=rs.getInt("rnum");
			int idx=rs.getInt("idx");
			int boardidx=rs.getInt("boardidx");
			String id=rs.getString("id");
			String content=rs.getString("content");
			java.sql.Date comdate=rs.getDate("comdate");
			
			commentDTO cdto=new commentDTO(rnum, idx, boardidx, id, content, comdate);
			arr.add(cdto);
			}
			return arr;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}	
	}//end method
	/**게시글 수정 메소드*/
	public int board_update(String id,String subject,String content){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="update guideboard set subject=?,content=? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, subject);
			ps.setString(2, content);
			ps.setString(3, id);
			
			int count=ps.executeUpdate();
			
			return count;
			
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}//end method
	/**1:1문의 게시판 조회수 하는메소드*/
	public int readcount(int useridx){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="update guideboard set readnum=readnum+1 where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, useridx);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}//end method
	/**가이드 아이디를 통해 질문목록가져오기*/
		public ArrayList<boardDTO> guideboard(int start, int end, String userid){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="select * from(select rownum as rnum,a.* from(select * from guideboard where guideid=? order by idx desc)a) where rnum between "+start+" and	"+end;
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			
			ArrayList<boardDTO> arr=new ArrayList<boardDTO>();
			
			while(rs.next()){
				int rnum=rs.getInt("rnum");
				int idx=rs.getInt("idx");
				int requestidx=rs.getInt("requestidx");
				String id=rs.getString("id");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				String guideid=rs.getString("guideid");
				int readnum=rs.getInt("readnum");
				java.sql.Date comdate=rs.getDate("comdate");
				
				boardDTO bdto=new boardDTO(readnum,rnum, idx, requestidx, id, subject, content, guideid, comdate);
				arr.add(bdto);
			}
			return arr;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}//end method
	/**관리자용 1:1문의 게시판*/
	public ArrayList<boardDTO> adminboard(int start, int end){
		
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="select * from(select rownum as rnum,a.* from(select * from guideboard order by idx desc)a) where rnum between "+start+" and	"+end+"";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<boardDTO> arr=new ArrayList<boardDTO>();
			
			while(rs.next()){
				int rnum=rs.getInt("rnum");
				int idx=rs.getInt("idx");
				int requestidx=rs.getInt("requestidx");
				String id=rs.getString("id");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				String guideid=rs.getString("guideid");
				int readnum=rs.getInt("readnum");
				java.sql.Date comdate=rs.getDate("comdate");
		
				boardDTO bdto=new boardDTO(readnum,rnum, idx, requestidx, id, subject, content, guideid, comdate);
				arr.add(bdto);
			}
			return arr;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}		
	}//end method
	/**댓글 삭제 메소드*/
	public int commentdelete(int idx){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="delete from boardcomment where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
				
			}
		}
	}//end method
	/**상품소개 조회수*/
	public int tourlistcount(int localidx){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="update tour set readnum=readnum+1 where idx=?";
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, localidx);
			
			int count =ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}//end method
	/**tour 컬럼조회*/
	public ArrayList<tourlistDTO> tourlist(){
		try{
			conn=dbcp.Dbcp.getConn();
			String sql="select * from tour";
			ps=conn.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			ArrayList<tourlistDTO> arr=new ArrayList<tourlistDTO>();
			
			while(rs.next()){
				
				int idx=rs.getInt("idx");
				String localname=rs.getString("localname");
				int readnum=rs.getInt("readnum");
	
				tourlistDTO dto=new  tourlistDTO(idx, localname, readnum);
			
				arr.add(dto);
			}
		
			return arr;
		
			}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}//end method
}//end class
