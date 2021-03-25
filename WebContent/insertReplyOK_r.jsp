<%@page import="VO.ReplyList"%>
<%@page import="java.util.List"%>
<%@page import="Service.SelectService"%>
<%@page import="Service.ModifyService"%>
<%@page import="VO.PageVO"%>
<%@page import="Service.WriteService"%>
<%@page import="VO.ReplyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//넘어오는 값 받기
	request.setCharacterEncoding("UTF-8");
	
	//pageData
	String pageContent = request.getParameter("pageContent");
	int pageNO = Integer.parseInt(request.getParameter("pageNO"));
	String date = request.getParameter("date");
	String title = request.getParameter("title");
	
	PageVO page_vo = new PageVO();
	page_vo.setsContent(pageContent);
	page_vo.setnNo(pageNO);
	page_vo.setsDate(date);
	page_vo.setsTitle(title);
	
	
	//content 받기 ,PageNo 받기, date 받기
	String content = request.getParameter("content");
	//int pageNO = Integer.parseInt(request.getParameter("pageNO"));
	ReplyVO vo = new ReplyVO();
	
	//부모 댓글 번호 얻어오기
	int nPreReplyNO = Integer.parseInt(request.getParameter("preReplyNO"));
	//int nPreReplyNO = (int)session.getAttribute("preReplyNO");
	int reorder = Integer.parseInt(request.getParameter("reorder"))+1;
	int depth = Integer.parseInt(request.getParameter("depth"))+1;
	vo.setnPageNO(pageNO);
	vo.setsReplyContent(content);
	vo.setsMemberId((String)session.getAttribute("ID"));
	vo.setnDepth(depth);
	vo.setnReorder(reorder);
	vo.setnPre_ReplyNO(nPreReplyNO);
	
	out.println(vo);
	//DB에 쓰기
	WriteService.getInstance().writeReply_r(vo);
	
	//세션에 정보 저장(insertReplyOK.jsp에서 사용)
	//session.setAttribute("reorder", reorder);
	//out.println(nPreReplyNO);
	
	//부모 깊이 얻어오기
	//int preDepth = SelectService.getInstance().selectReplyDepth(nPreReplyNO) + 1;
	
	//부모 깊이 변경
	//ModifyService.getInstance().modifyDepth(nPreReplyNO,preDepth);
	
	
%>
<script>
	alert("test!");	
	var html = 'detail.jsp?no=<%=page_vo.getnNo()%>&title=<%=page_vo.getsTitle()%>&content=<%=page_vo.getsContent()%>&date=<%=page_vo.getsDate()%>';
	location.href=html;
</script>
</body>
</html>