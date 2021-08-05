package Model;

public class boardReDTO {
	
	private int commentsNumber;
	private String boardNum;
	private String memberID;
	private String commentsPw;
	private String commentsContents;
	private String commentsDate;
	
	
	
	public boardReDTO(int commentsNumber, String boardNum, String memberID, String commentsPw,
			String commentsContents, String commentsDate) {
		super();
		this.commentsNumber = commentsNumber;
		this.boardNum = boardNum;
		this.memberID = memberID;
		this.commentsPw = commentsPw;
		this.commentsContents = commentsContents;
		this.commentsDate = commentsDate;
	}
	
	
	public int getCommentsNumber() {
		return commentsNumber;
	}
	public void setCommentsNumber(int commentsNumber) {
		this.commentsNumber = commentsNumber;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getCommentsPw() {
		return commentsPw;
	}
	public void setCommentsPw(String commentsPw) {
		this.commentsPw = commentsPw;
	}
	public String getCommentsContents() {
		return commentsContents;
	}
	public void setCommentsContents(String commentsContents) {
		this.commentsContents = commentsContents;
	}
	public String getCommentsDate() {
		return commentsDate;
	}
	public void setCommentsDate(String commentsDate) {
		this.commentsDate = commentsDate;
	}
	

	
	

}
