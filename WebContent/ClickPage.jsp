<%@page import="java.util.List"%>
<%@page import="VO.ReplyVO"%>
<%@page import="Service.SelectService"%>
<%@page import="VO.ReplyList"%>
<%@page import="VO.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
	}

	#wrapper{
		margin:0 auto;
		width:100%;
		border: 1px solid black;
	}
	header{
	 width: 100%;
     height: 60px;
	 margin: 0;
	 border: 1px solid black;
	}
	section{    
		position: relative;
	    width:100%;
	    height:100%;
	    padding:5px 5px 5px 5px;
	    overflow: hidden;
	}
	section #side-left{		
	    width: 20%;
	    float: left;
		margin-left:1%;
		margin-right:1%;
	    border: 1px solid black;
	    overflow: hidden;

	}
	section #main{
		
	    width: 50%;
	    float: left;
	    margin: 0;
	    border: 1px solid black;
	    margin-left:1%;
	    margin-top:1%;
	}
	
	#main .page:ACTIVE{
		
	}

	section #side_right{
		
	    width: 20%;
	    float: left;
	    margin: 0;
	    border: 1px solid black;
	    margin-left:1%;
	    margin-top:1%;
	    overflow: hidden;
	}
	.page{
		width:100%;
		border:1px solid black;
	}
	footer{
		width:100%;
		border: 1px solid black;

	}
</style>
</head>
<body>
<%
	//넘어오는 data 받기
	request.setCharacterEncoding("UTF-8");

	PageVO p = new PageVO(); 
	
	p.setnNo(Integer.parseInt(request.getParameter("no")));
	p.setsTitle(request.getParameter("title"));
	p.setsContent(request.getParameter("content"));
	p.setsDate(request.getParameter("date"));
	
	out.println(p.getnNo());
	//해당 글을 출력
%>
			<div class="page">
				<h1><%=p.getsTitle()%></h1>
				<p align="center"><%=p.getsContent()%></p>
				<p align="right"><%=p.getsDate()%><p>
			</div>

<%
	//댓글 출력
	//페이지 번호 주고 댓글 리스트 가져오기
	ReplyList replyList = new ReplyList();
	replyList.setReplyList(SelectService.getInstance().getReplyList(p.getnNo()).getReplyList());
	if(replyList.getReplyList() != null){
		for(ReplyVO r : replyList.getReplyList()){
			
			out.println(""+ r +"<br/>");
		}
	}
	
%>
</body>
</html>