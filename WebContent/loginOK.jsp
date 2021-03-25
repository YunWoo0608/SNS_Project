<%@page import="Service.SelectService"%>
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
	request.setCharacterEncoding("UTF-8");
	
	String sID = request.getParameter("name");
	String sPW = request.getParameter("pw");
	
	//login 클릭시 DB에 아이디와 비밀번호가 맞는지 확인합니다.
	
	//있다면
	if(SelectService.getInstance().CompareTo_ID_PW(sID, sPW) == true)
	{
		//세션에 저장 전역적으로 쓰기위해서
		session.setAttribute("ID", sID);
		request.setAttribute("ID", sID);
		pageContext.forward("main.jsp");	
	}
	else
	{	
		%>
		<script>
			alert("로그인 실패(ID가 없거나 PW가 틀렸습니다.)!");
			location.href="login.jsp";
		</script>
		<%
		//pageContext.forward("login.jsp");
	}
	
%>
</body>
</html>