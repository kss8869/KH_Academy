package semi.join;

import java.sql.*;

import java.util.*;



public class JoinDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	// 가입시 회원 등급 //////////////////////////
	private static final int GRADE_ADMIN = 1;
	private static final int GRADE_GUIDE = 2;
	private static final int GRADE_NOMAL = 3;
	/////////////////////////////////////////
	
	//로그인 결과 ///////////////////////////////
	public static final int LOGIN_OK=1; // 로그인 성공
	public static final int LOGIN_FAIL = -1; // 로그인 실패
	public static final int ERROR=-2; // 비밀번호 3회 실패
	
	public JoinDAO() throws Exception{
		conn = semi.db.SemiDB.getConn();
	
	}
	/*
	public void dbConnect(){
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String pwd = "1234";
			conn = DriverManager.getConnection(url, user, pwd);
			
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	*/
	/**회원가입 메서드*/
	public int join(JoinDTO dto ){
		
		try{ 
		
		String sql="insert into join values(join_idx.nextval,?,?,?,?,sysdate,?,1,?,?)";
		
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPwd());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getEmail());
		ps.setInt(5, GRADE_NOMAL);
		ps.setString(6, dto.getQuestion());
		ps.setString(7, dto.getAnswer());
		
		int result = ps.executeUpdate();
		
		return result;
		
		}catch(Exception e){
			e.printStackTrace();
			return -1;
			
		}finally{
			try{
				if(ps!=null)ps.close();
				
			}catch(Exception e2){
				
			}
		}
		
		
		
	}
	
	/**아이디 중복체크 */
	public boolean idCheck(String userid){
		try{
			
			String sql="select * from join where id=?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			return rs.next();// true:id중복    false: 중복아님
			
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				
				
			}catch(Exception e2){
				
			}
		}
	}
	/**사용자 이름 가져오기*/
	public String getUserInfo(String userid){
		String name ="";
		try{
		String sql = "select name from join where idx=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, userid);
		rs = ps.executeQuery();
		
		if(rs.next()){
			name = rs.getString("name");
			
		}
		return name;
		}catch(Exception e){
			e.printStackTrace();
			return name;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				
			}catch(Exception e2){
				
			}
		}
		
	}
	
	/**로그인 실패시 count 확인 관련*/
	public int getCount(String id){
		
		try{
			int count=0;
			String sql="select count from join where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs =ps.executeQuery();
			
			if(rs.next())
			{
				count = rs.getInt("count");
			}
			
			return count;
		}
		catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				
			}catch(Exception e2){
				
			}
		}
	}
	/**로그인 id pwd 체크관련 메서드*/
	public int loginCheck(String userid, String userpwd)
	{
		try{
			
			
			String sql="select * from join where id=?";
			String sql_temp="";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, userid);
			
			
			rs = ps.executeQuery();
			
			if(rs.next())
			{  //일단 id는 일치
				
				sql_temp ="select * from join where id=? and pwd=?";
				ps = conn.prepareStatement(sql_temp);
				
				ps.setString(1, userid);
				ps.setString(2, userpwd);
				
				rs = ps.executeQuery();
				
				if(rs.next()){ //id pwd 둘다 일치
					
					if(getCount(userid)>3){ //일치 했더라도 3회 실패시 
						
						return ERROR;
					}
					else{ // 로그인 ok 후 count 값 0으로 초기화
						sql_temp = "update join set count=0 where id=? and pwd=?";
												
						ps = conn.prepareStatement(sql_temp);
						ps.setString(1, userid);
						ps.setString(2, userpwd);
						
						ps.executeQuery();
					
						
					}
				}
				else // id는 일치 pwd는 불일치
				{
					int count = getCount(userid)+1;
					sql_temp = "update join set count=? where id=?";
					ps = conn.prepareStatement(sql_temp);
					ps.setInt(1, count);
					ps.setString(2, userid);
					
					ps.executeQuery();
					return LOGIN_FAIL;
				}
				
			}
			return LOGIN_OK;
		}	
		catch(Exception e){
			return ERROR;
		}
		finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			
			}
			catch(Exception e){
				
			}
		}
	}
	
	/**id 찾기 */
	public String findId(String name,String email){
		try {
			String id = "";
			String sql = "select id from join where name=? and email=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);

			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getString("id");

			}
			return id;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();

			} catch (Exception e2) {

			}
			
			
		}
		
	}
	
	/**PWD찾기 */
	public String findPwd(String id, String email, String question, String answer){
		try {
			String pwd = "";
			String sql = "select * from join where id=? and email=? and question=? and answer=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, email);
			ps.setString(3, question);
			ps.setString(4, answer);

			rs = ps.executeQuery();

			if (rs.next()) {
				pwd = rs.getString("pwd");
				String sql2 ="update join set count=0 where id=?";
				
				ps = conn.prepareStatement(sql2);
				ps.setString(1, id);
				
				ps.executeQuery();
				

			}
			return pwd;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();

			} catch (Exception e2) {

			}
			
			
		}
	}
	
	public int mkRandomNum()
	{
		int result=0;
		Random random = new Random();
		result = random.nextInt(10000) + 1000;
		
		if(result>10000){
			result = result - 1000;
		}
		
	
		
		return result; 
		
	}
	
}
