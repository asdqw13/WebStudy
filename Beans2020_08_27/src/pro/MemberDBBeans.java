package pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBeans {
	// 1. 자신을 객체화
	private static MemberDBBeans instance=new MemberDBBeans();
	// 2. 객체화를 리턴하기 위한 메소드
	public static MemberDBBeans getInstance() { // 자신을 객체화하여 리턴하기 위한 용도
		return instance;
	}
	// 3. DB연결을 위한 메소드
	public Connection getConnection() throws Exception { // DB연결을 하여 커넥션을 리턴하기 위한 메소드
		Context ctx=new InitialContext(); // 톰캣의 sever.xml의 내용의 context를 가져오기 위한 클래스
		DataSource ds=(DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
		// context태그에서 "jdbc/myoracle"이름을 찾음
		return ds.getConnection();
	}
	// 4. DB에 insert하는 메소드
	public int insertMember(MemberBeans member) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into memberT values(?,?,?,?,?,?)";
		int re=-1;
		
		con=getConnection(); // DB연결
		pstmt=con.prepareStatement(sql); // 준비된 통
		
		pstmt.setString(1, member.getMem_uid()); //준비 된 통의 ?파라메터에 값을 세팅
		pstmt.setString(2, member.getMem_pwd());
		pstmt.setString(3, member.getMem_name());
		pstmt.setString(4, member.getMem_email());
//		pstmt.setString(5, member.getMem_regdate());
		pstmt.setTimestamp(5, member.getMem_regdate());
		pstmt.setString(6, member.getMem_addr());
		
		re=pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
		return re; // 삽입성공 시 1 리턴, 실패 시 -1 리턴
	}
	// 5. 회원가입 시 아이디 중복을 확인하는 메소드
	public int confirmID(String mem_uid) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select mem_uid from memberT where mem_uid=?";
		int re=-1;
		con=getConnection(); // DB연결 메소드 호출
		pstmt=con.prepareStatement(sql); // 준비 된 통
		pstmt.setString(1, mem_uid);
		rs=pstmt.executeQuery();
		if(rs.next()) re=1;
		else re=-1;
		return re;
	}
	// 6. 아이디가 일치하는 멤버의 모든 정보를 얻어오는 메소드
	public MemberBeans getMember(String mem_uid) throws Exception {
		MemberBeans member=null; // 게터, 세터 임시메모리 역할
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from memberT where mem_uid=?";
		con=getConnection(); // DB연결 메소드 호출
		pstmt=con.prepareStatement(sql); // 준비 된 통
		pstmt.setString(1, mem_uid); // 1번 ?파라메터에 전달받은 mem_uid를 세팅
		rs=pstmt.executeQuery(); // 결과통에 select된 결과가 저장되어 있음
		if(rs.next()) {
			member=new MemberBeans();
			member.setMem_uid(rs.getString(1));
			member.setMem_pwd(rs.getString(2));
			member.setMem_name(rs.getString(3));
			member.setMem_email(rs.getString(4));
			member.setMem_regdate(rs.getTimestamp(5));
			member.setMem_addr(rs.getString(6));
		}
		rs.close();
		pstmt.close();
		con.close();
		return member;
	}
	
	// 7. 데이터 수정 update
	public int updateMember(MemberBeans member) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		int re=-1;
		String sql="update memberT set mem_pwd=?, mem_email=?, mem_addr=? where mem_uid=?";
		con=getConnection();
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, member.getMem_pwd());
		pstmt.setString(2, member.getMem_email());
		pstmt.setString(3, member.getMem_addr());
		pstmt.setString(4, member.getMem_uid());
		re=pstmt.executeUpdate(); // executeUpdate()는 insert, update, delete
		
		pstmt.close();
		con.close();		
		return re;
	}
	
	// 8. 데이터 삭제 delete
	public int deleteMember(String mem_uid) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		int re=-1;
		String sql="delete from memberT where mem_uid=?";
		con=getConnection();
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, mem_uid);
		re=pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return re;
	}
	// 9. 사용자 인증을 위한 메소드
	public int userCheck(String mem_uid, String mem_pwd) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int re=-1;
		String sql="select mem_pwd from memberT where mem_uid=?";
		con=getConnection();
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, mem_uid);
		rs=pstmt.executeQuery();
		
		if(rs.next()) { // 아이디가 일치하고 비밀번호가 존재하면
			String str_pwd=rs.getString(1);
			if(str_pwd.equals(mem_pwd)) re=1;
			else re=0;
		}
		else re=-1;
		
		rs.close();
		pstmt.close();
		con.close();
		
		return re;
	}
}