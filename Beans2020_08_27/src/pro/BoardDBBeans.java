package pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBeans {
	// 1. 클래스 객체 생성
	private static BoardDBBeans instance=new BoardDBBeans();

	public static BoardDBBeans getInstance() {
		return instance;
	}
	
	// 2. DB커넥션
	public Connection getConnection() throws Exception {
			Context ctx=new InitialContext();
			DataSource ds=(DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
			return ds.getConnection();
	}
	
	// 3. insert into board(,,,) values(?,?,?,?,...)
	public int InsertBoard(BoardBeans board) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		int re=-1;
		
		int b_id=board.getB_id(); // 아이디
		int b_ref=board.getB_ref(); // 자기자신의 번호를 참조
		int b_step=board.getB_step(); // 단계 답변
		int b_level=board.getB_level(); // 답변에 답변
		int num=0; // 카운트
		
		con=getConnection();
		
		sql="select max(b_id) from board"; // b_id의 최대 값 찾기
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery(); // 최대 값의 b_id 1개만 출력
		if(rs.next()) {
			num=rs.getInt(1)+1; // num=2
		}
		else
			num=1;
		if(b_id!=0) { // b_id 값이 있다면, 전달 된 값이 있다.(답변 글이 됨)
			sql="update board set b_step=b_step+1 where b_ref=? and b_step > ?"; // 나중에 고민
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, b_ref);
			pstmt.setInt(2, b_step);
			pstmt.executeUpdate();
			
			b_step++;
			b_level++;
		}
		else { // 답변 글이 아니면 새 글 쓰기
			b_ref=num;
			b_step=0;
			b_level=0;
		}
		sql="insert into board(b_id, b_name, b_email, b_title, b_content, b_pwd, b_date,";
		sql+="b_ip, b_ref, b_step, b_level) values(?,?,?,?,?,?,?,?,?,?,?)";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num); // no
		pstmt.setString(2, board.getB_name()); //이름
		pstmt.setString(3, board.getB_email()); //
		pstmt.setString(4, board.getB_title());
		pstmt.setString(5, board.getB_content());
		pstmt.setString(6, board.getB_pwd());
		pstmt.setTimestamp(7, board.getB_date()); // 날짜
		pstmt.setString(8, board.getB_ip()); //ip
		pstmt.setInt(9, b_ref); // 글 그룹번호
		pstmt.setInt(10, b_step); // 글 위치
		pstmt.setInt(11, b_level); // 답변 레벨
		
		re=pstmt.executeUpdate(); // re=1저장
		
		rs.close();
		pstmt.close();
		con.close();
		
		return re;
	}
	// select * from board
	public void ListBoard(String pagenumber) throws Exception { // List.jsp에서 page번호가 전달될 수 있음
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null; // 결과통
		ResultSet pageset=null; // 
		String sql="select count(b_id) from board"; // 총 레코드 수	
		int absolute_page=1;
		int dbcount=0; // DB의 글의 수=0
		
		con=getConnection(); // DB연결(2)
		pstmt=con.prepareStatement(sql);
		pageset=pstmt.executeQuery(); // pageset=1
		if(pageset.next()) {
			dbcount=pageset.getInt(1); // 총 갯수
			pstmt.close();
			pageset.close();
		}
		// 생략
		
		String strsql="select * from board order by b_ref desc, b_step asc";
		pstmt=con.prepareStatement(strsql);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			rs.absolute(absolute_page);
			int count=0;
			
		}
	}
	// update board set ___ where ___
	
	// 7. delete from board where ___
	public int DeleteBoard(int b_id, String b_pwd) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int re=-1;
		 
		String sqldel="delete from board where b_id=?";
		String sqlsel="select b_pwd from board where b_id=?";
		
		con=getConnection();
		pstmt=con.prepareStatement(sqlsel);
		pstmt.setInt(1, b_id);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			String pwd=rs.getString(1);
			if(!pwd.equals(b_pwd)) re=0; // pwd 틀림
			else { // pwd 일치
				pstmt=con.prepareStatement(sqldel);
				pstmt.setInt(1, b_id);
				re=pstmt.executeUpdate(); // 삭제성공시 re=1 저장
			}
		}
		pstmt.close();
		con.close();
		return 0;
	}
}