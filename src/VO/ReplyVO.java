package VO;

public class ReplyVO {
	
	//필요 Data
	private int nReplyNO;
	private String sMemberId;
	private String sReplyContent;
	private int nPageNO;
	private int rReplyNO;
	private int rReplyCount;
	private String sDate;
	private int nReorder;
	private int nDepth;
	private int nPre_ReplyNO;
	
	
	public int getnPre_ReplyNO() {
		return nPre_ReplyNO;
	}
	public void setnPre_ReplyNO(int nPre_ReplyNO) {
		this.nPre_ReplyNO = nPre_ReplyNO;
	}
	public int getnReorder() {
		return nReorder;
	}
	public void setnReorder(int nReorder) {
		this.nReorder = nReorder;
	}
	public int getnDepth() {
		return nDepth;
	}
	public void setnDepth(int nDepth) {
		this.nDepth = nDepth;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getrReplyCount() {
		return rReplyCount;
	}
	public void setrReplyCount(int rReplyCount) {
		this.rReplyCount = rReplyCount;
	}
	public int getnReplyNO() {
		return nReplyNO;
	}
	public void setnReplyNO(int nReplyNO) {
		this.nReplyNO = nReplyNO;
	}
	public String getsMemberId() {
		return sMemberId;
	}
	public void setsMemberId(String sMemberId) {
		this.sMemberId = sMemberId;
	}
	public String getsReplyContent() {
		return sReplyContent;
	}
	public void setsReplyContent(String sReplyContent) {
		this.sReplyContent = sReplyContent;
	}
	public int getnPageNO() {
		return nPageNO;
	}
	public void setnPageNO(int nPageNO) {
		this.nPageNO = nPageNO;
	}
	
	public int getrReplyNO() {
		return rReplyNO;
	}
	public void setrReplyNO(int rReplyNO) {
		this.rReplyNO = rReplyNO;
	}
	@Override
	public String toString() {
		return "ReplyVO [nReplyNO=" + nReplyNO + ", sMemberId=" + sMemberId + ", sReplyContent=" + sReplyContent
				+ ", nPageNO=" + nPageNO + ", rReplyNO=" + rReplyNO + ", rReplyCount=" + rReplyCount + ", sDate="
				+ sDate + ", nReorder=" + nReorder + ", nDepth=" + nDepth + ", nPre_ReplyNO=" + nPre_ReplyNO + "]";
	}	
	
}
