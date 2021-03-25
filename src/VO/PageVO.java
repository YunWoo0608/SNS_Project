package VO;

public class PageVO {

	//필요한 Data
	
	//NO
	private int nNo;
	//TITLE
	private String sTitle;
	//CONTENT
	private String sContent;
	//GID -> Guest ID 
	private String sGID;
	//날짜 정보
	private String sDate;
	
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String content) {
		sContent = content;
	}
	public String getsGID() {
		return sGID;
	}
	public void setsGID(String sGID) {
		this.sGID = sGID;
	}
	@Override
	public String toString() {
		return "PageVO [nNo=" + nNo + ", sTitle=" + sTitle + ", Content=" + sContent + ", sGID=" + sGID + "]";
	}
	
	
}
