package egovframework.board.service;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QBoardVO {
	
	private int rnum;
	private int no;
	private QBoardCategory category;
	private String title;
	private String content;
	private String users;
	private Date regDate;
	private int readCount;
	private boolean secret;
	
	private String fileName;
	private MultipartFile uploadFile;
	
	private int groupId;		//글 그룹 번호
	private int groupOrder;		//그룹 내 순서 (원글=0)
	private int layer;			//글 계층 (원글=0)

	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public QBoardCategory getCategory() {
		return category;
	}
	public void setCategory(QBoardCategory category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public boolean isSecret() {
		return secret;
	}
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public int getGroupOrder() {
		return groupOrder;
	}
	public void setGroupOrder(int groupOrder) {
		this.groupOrder = groupOrder;
	}
	public int getLayer() {
		return layer;
	}
	public void setLayer(int layer) {
		this.layer = layer;
	}
	
	@Override
	public String toString() {
		return "QBoardVO [no=" + no + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", users=" + users + ", regDate=" + regDate + ", readCount=" + readCount + ", secret=" + secret
				+ ", fileName=" + fileName + ", uploadFile=" + uploadFile + ", groupId=" + groupId + ", groupOrder="
				+ groupOrder + ", layer=" + layer + "]";
	}
	

	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
}
