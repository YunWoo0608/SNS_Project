<%@page import="VO.PageVO"%>
<%@page import="Service.ModifyService"%>
<%@page import="Service.WriteService"%>
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
	String content = request.getParameter("contentText");
	out.println(""+request.getParameter("pageNO"));
	out.println(""+request.getParameter("date"));
	int pageNO = Integer.parseInt(request.getParameter("pageNO"));
	String date = request.getParameter("date");
	String title = request.getParameter("titleText");
	
	PageVO vo = new PageVO();
	vo.setsContent(content);
	vo.setnNo(pageNO);
	vo.setsDate(date);
	vo.setsTitle(title);
	
	//title = title.replaceAll("\r\n","<br/>");
	content = content.replaceAll("\r\n","<br/>");
	//content = content.replace("\n","<br/>");
	
	out.println(content);
	out.println(title);
	//넘어온 값을 DB에 쓴다.
	ModifyService.getInstance().modifyPage(vo);
	
%>
<script>
	alert("test!");	
	var html = 'main.jsp';
	location.href=html;
</script>
</body>
</html>