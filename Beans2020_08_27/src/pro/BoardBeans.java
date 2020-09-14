package pro;

import java.sql.Timestamp;

public class BoardBeans {
	private int b_id;
	private String b_name;
	private String b_email;
	private String b_title;
	private String b_content;
	private String b_pwd;
	private Timestamp b_date;
	private int b_hit;
	private String b_ip;
	private int b_ref;
	private int b_step;
	private int b_level;
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public Timestamp getB_date() {
		return b_date;
	}
	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	public int getB_ref() {
		return b_ref;
	}
	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}
	public int getB_step() {
		return b_step;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	public int getB_level() {
		return b_level;
	}
	public void setB_level(int b_level) {
		this.b_level = b_level;
	}
	
	public static int pagesize=5; // 현 페이지당 10개 출력
	public static int pagecount=1; // 페이지 개수 지정 변수
	public static int pagenum=1; // 페이지 번호
	
	public static String pageNumber(int limit) { // 시작 페이지
		String str="";
		int temp=(pagenum-1) % limit;
		int startPage=pagenum-temp;
		// [이전] 링크 추가
		if((startPage=limit)>0) {
			str="<a href='List.jsp?pagenum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		// 페이지 번호 나열
		for(int i=startPage; i<(startPage+limit); i++) {
			if(i==pagenum) {
				str+="["+i+"]&nbsp;&nbsp;";
			}
			else {
				str+="<a href='List.jsp?pagenum="+i+"'>["+i+"]</a>&nbsp;&nbsp;'";
			}
			if(i>=pagecount) break;
		}	
		// for문 끝
		// [다음] 링크 추가
		if((startPage+limit)<=pagecount) {
			str+="<a href='List.jsp?pagenum="+(startPage+limit)+"'>[다음]</a>";
		}
		return str;
	}
}