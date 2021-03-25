<%@page import="Service.DeleteService"%>
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
	//넘어 오는 값을 받아서 해당 값에 맞는 페이지를 삭제 한다.
	request.setCharacterEncoding("UTF-8");
	
	int pageNO = Integer.parseInt(request.getParameter("pageNO"));
	
	out.println(""+pageNO);
	DeleteService.getInstance().deletePage(pageNO);
%>
<script>
	alert("삭제 성공!");
	location.href="main.jsp";
</script>
</body>
</html>