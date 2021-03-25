package VO;

public class MemberVO {

	//필요한 Data
	//ID
	private String sMID;
	//PW
	private String sPW;
	//NAME
	private String sName;
	//Email
	private String sEmail;
	
	
	//getter && setter

	public String getsPW() {
		return sPW;
	}
	public String getsMID() {
		return sMID;
	}
	public void setsMID(String sMID) {
		this.sMID = sMID;
	}
	public void setsPW(String sPW) {
		this.sPW = sPW;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsEmail() {
		return sEmail;
	}
	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}

	//toString
	@Override
	public String toString() {
		return "MemberVO [sID=" + sMID + ", sPW=" + sPW + ", sName=" + sName + ", sEmail=" + sEmail + "]";
	}
}
