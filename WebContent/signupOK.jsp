<%@page import="Service.WriteService"%>
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
	//data 받기	
	String sID = request.getParameter("id");
	String sPW = request.getParameter("pw");
	String sName = request.getParameter("name");
	String sEmail = request.getParameter("email");
	
	//login 클릭시 DB에 아이디와 비밀번호가 맞는지 확인합니다.
	
	//있다면 회원가입 하지 않고 로그인으로
	if(SelectService.getInstance().CompareTo_ID(sID) == true)
	{
		%>
		<script>
			alert("회원가입 실패(이미 존재하는 ID)!");
			location.href="login.jsp";
		</script>
		<%
	}
	//없다면 DB에 회원정보 쓰기
	else
	{
		WriteService.getInstance().writeMeber(sID, sPW, sName, sEmail);
	%>
		<script>
		alert("회원가입 성공!");
		location.href="login.jsp";
		</script>
	<%
		//쓰면 script씹히고 바로 넘어가진다.
		//pageContext.forward("login.jsp");	
	}
%>
</body>
</html>