package pro;

import java.security.spec.RSAKeyGenParameterSpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBean {
    //1) 자신을 객체화한다
	private static  MemberDBBean  instance=new MemberDBBean();
	//2) 객체화를 리턴하기 위한 메소드
	public static MemberDBBean getInstance() {  //자신을 객체화하여 리턴하기 위한 메소드
		return instance;
	}
	//3) DB연결을 위한 메소드
	public Connection getConnection() throws Exception {  //DB연결을 하여 커넥션을 리턴하기 위한 메소드
		Context ctx=new InitialContext();  //톰캣의 server.xml의 context를 가져오기 위한 클래스 
		DataSource ds=(DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
			                                    //context태그에서 "jdbc/myoracle"이름을 찾는것
		return ds.getConnection();
	}
	//4) DB에 insert하는 메소드
	public int insertMember(MemberBean member) throws Exception {  //sql삽입
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into memberT values(?,?,?,?,?,?)";
		int re=-1;
		con=getConnection();  //db연결
		pstmt=con.prepareStatement(sql); //준비된통
		pstmt.setString(1, member.getMem_uid());    //준비된통에 ?파라메타에 값을 셋팅
		pstmt.setString(2, member.getMem_pwd());
		pstmt.setString(3, member.getMem_name());
		pstmt.setString(4, member.getMem_email());
		pstmt.setTimestamp(5, member.getMem_regdate());  //시간
		pstmt.setString(6, member.getMem_addr());
		re=pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return re;  //삽입성공시 1 리턴됨, 실패시 -1리턴
	}
	//5) 회원가입시 아이디 중복을 확인하는 메소드
	public int confirmID(String mem_uid) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select mem_uid from memberT where mem_uid=?";
		int re=-1;
		con=getConnection();  //DB연결메소드 호출
		pstmt=con.prepareStatement(sql); //준비된통
		pstmt.setString(1,mem_uid);
		rs=pstmt.executeQuery();
		if(rs.next()) re=1; //값이 존재하면 re=1
		else re=-1;
		return re; 
	}
	//6)★ 아이디가 일치하는 멤버의 모든 정보를 얻어오는 메소드
	public MemberBean getMember(String mem_uid) throws Exception {
		MemberBean member=null;   //갯터세터 임시메모리
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from memberT where mem_uid=?";
		con=getConnection();  //DB연결메소드 호출
		pstmt=con.prepareStatement(sql); //준비된통
		pstmt.setString(1,mem_uid);  //1번?파라메타에 전달받은 mem_uid을 셋팅
		rs=pstmt.executeQuery(); //결과통에 select된 결과가 저장되어 있음
		if(rs.next()) {
			member=new MemberBean();  //임시메모리
			member.setMem_uid(rs.getString(1));
			member.setMem_pwd(rs.getString(2));
			member.setMem_name(rs.getString(3));
			member.setMem_email(rs.getString(4));
			member.setMem_regdate(rs.getTimestamp(5));
			member.setMem_addr(rs.getString(6));
		}
		rs.close();	pstmt.close();	con.close();
		return member;
	}
	
	//7)★  데이터수정 update
	public int updateMember(MemberBean member) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		int re=-1;
		String sql="update memberT set mem_pwd=?, mem_email=?, mem_addr=? where mem_uid=?";
		con=getConnection();
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,member.getMem_pwd());
		pstmt.setString(2,member.getMem_email());
		pstmt.setString(3,member.getMem_addr());
		pstmt.setString(4,member.getMem_uid());
		re=pstmt.executeUpdate();  //executeUpdate()는 insert,update,delete
		
		pstmt.close();
		con.close();
		return re;
	}
	//8) 데이터삭제 delete (delete from memberT where mem_uid='111')
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
	//9) 사용자 인증을 위한 메소드
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
		if(rs.next()) {  //아이디가 일치해서 비번을 존재하면 
			String str_pwd=rs.getString(1);  
			if(str_pwd.equals(mem_pwd))	re=1;   //비번이 일치할때
			else re=0;   //비번이 일치하지 않을때
		}
		else re=-1;  //아이디 일치하는게 없다
		rs.close();		pstmt.close();		con.close();
		return re;
	}
}








