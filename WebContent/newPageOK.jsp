<%@page import="VO.PageVO"%>
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
	//값 받아오기
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	PageVO vo = new PageVO();
	vo.setsGID((String)session.getAttribute("ID"));
	vo.setsTitle(title);
	vo.setsContent(content);
	
	//DB에 쓰기
	WriteService.getInstance().writePage(vo);
%>
<script>
	alert("test!");	
	var html = 'main.jsp';
	location.href=html;
</script>
</body>

</html>