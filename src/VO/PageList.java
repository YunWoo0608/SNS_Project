package VO;

import java.util.List;

public class PageList {
	//GuestVO를 담을 리스트
		private List<PageVO> pageList;
		private int nStartNO;

		private int nEndNO;
		public PageList(){}	
		
		//getter && setter
		public List<PageVO> getPageList() {
			return pageList;
		}

		public void setPageList(List<PageVO> pageList) {
			this.pageList = pageList;
		}
		public int getnStartNO() {
			return nStartNO;
		}

		public void setnStartNO(int nStartNO) {
			this.nStartNO = nStartNO;
		}

		public int getnEndNO() {
			return nEndNO;
		}

		public void setnEndNO(int nEndNO) {
			this.nEndNO = nEndNO;
		}
}
