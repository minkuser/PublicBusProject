package egovframework.board.service;

import java.sql.Date;

public class BoardVO {
		
	private int rnum;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	private Integer board_id;
	private String user_id;
	private String board_title;
	private Date board_regdate;
	private String board_content;
	private Integer board_viewcount;
	
	public Integer getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Integer getBoard_viewcount() {
		return board_viewcount;
	}
	public void setBoard_viewcount(Integer board_viewcount) {
		this.board_viewcount = board_viewcount;
	}
}
