package VO;

import java.util.ArrayList;
import java.util.List;

public class MemberList {
	
	//GuestVO를 담을 리스트
	private List<MemberVO> guestList;

	public MemberList(){}
	
	//getter && setter
	public List<MemberVO> getGuestList() {
		return guestList;
	}

	public void setGuestList(List<MemberVO> guestList) {
		this.guestList = guestList;
	}
	
		
}
