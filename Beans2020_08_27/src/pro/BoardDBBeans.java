package pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	// 4. select * from board
	// ArrayList<String> a=new ArrayList<String>();
	// a.add("대한민국");
	// a.add("홍길동");
	// 출력(a.get(0)); // 대한민국
	// 출력(a.get(1)); // 홍길동
	public ArrayList<BoardBeans> ListBoard() throws Exception { // List.jsp에서 page번호가 전달될 수 있음
		Connection con=null;
		PreparedStatement pstmtsel=null;
		ResultSet rssel=null; // 결과통
		String sqlsel="select * from board order by b_ref desc, b_step asc";
		
		ArrayList<BoardBeans> BoardList=new ArrayList<BoardBeans>(); // 배열명
		BoardBeans board;
		
		con=getConnection();
		pstmtsel=con.prepareStatement(sqlsel);
		rssel=pstmtsel.executeQuery();
		while(rssel.next()) {
			board=new BoardBeans();
			board.setB_id(rssel.getInt(1));
			board.setB_name(rssel.getString(2));
			board.setB_email(rssel.getString(3));
			board.setB_title(rssel.getString(4));
			board.setB_content(rssel.getString(5));
			board.setB_pwd(rssel.getString(6));
			board.setB_date(rssel.getTimestamp(7));
			board.setB_hit(rssel.getInt(8));
			board.setB_ip(rssel.getString(9));
			board.setB_ref(rssel.getInt(10));
			board.setB_step(rssel.getInt(11));
			board.setB_level(rssel.getInt(12));
			BoardList.add(board); // BoardList배열에 추가(board레코드를)
		}
		return BoardList; // 배열자체를 리턴
	}
	// 5. select * from board b_id=___(View.jsp)
	public BoardBeans getBoard(String b_id) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int re=-1;
		String sql="select * from board where b_id=?";
		
		BoardBeans board=new BoardBeans();
		
		con=getConnection();
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, Integer.valueOf(b_id));
		rs=pstmt.executeQuery();
		if(rs.next()) {
			board.setB_id(rs.getInt(1));
			board.setB_name(rs.getString(2));
			board.setB_email(rs.getString(3));
			board.setB_title(rs.getString(4));
			board.setB_content(rs.getString(5));
			board.setB_pwd(rs.getString(6));
			board.setB_date(rs.getTimestamp(7));
			board.setB_hit(rs.getInt(8));
			board.setB_ip(rs.getString(9));
			board.setB_ref(rs.getInt(10));
			board.setB_step(rs.getInt(11));
			board.setB_level(rs.getInt(12));
		}
		pstmt.close();
		con.close();
		return board;
	}
	// 6. update board set ___ where ___(EditOK.jsp)
	public int EditBoard(BoardBeans board) {
		
		Connection con=null;
		PreparedStatement pstmtsel=null;
		PreparedStatement pstmtup=null;
		ResultSet rs=null;
		int re=-1;
		String sqlsel="select b_pwd from board where b_id=?";
		String sqlup="update board set b_name=?, b_email=?, ";
		sqlup+="b_title=?, b_content=? where b_id=?";
		
		try {
			con=getConnection();
			pstmtsel=con.prepareStatement(sqlsel);
			pstmtsel.setInt(1, board.getB_id());
			rs=pstmtsel.executeQuery();
			if(rs.next()) {
				String pwd=rs.getString(1);
				if(!pwd.equals(board.getB_pwd())) re=0; // 실패시 re=0
				else {
					pstmtup=con.prepareStatement(sqlup);
					pstmtup.setString(1, board.getB_name());
					pstmtup.setString(2, board.getB_email());
					pstmtup.setString(3, board.getB_title());
					pstmtup.setString(4, board.getB_content());
					pstmtup.setInt(5, board.getB_id());
					re=pstmtup.executeUpdate(); // 성공시 re=1
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				pstmtsel.close();
				pstmtup.close();
				con.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return re;
	}
	
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