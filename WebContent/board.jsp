<%@page import="java.util.Iterator"%>
<%@page import="DAO.PageDAO"%>
<%@page import="VO.PageVO"%>
<%@page import="VO.PageList"%>
<%@page import="Service.SelectService"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
  <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
</head>
<body>
<div id ="wrapper">
	<header>제목
	</header>
	<section>	
		<div id="side-left">
			<div id="fixed">
				test
			</div> 
		</div>
	
		<div id="main">		
		<%
			//UTF-8로 받아야 한글이 안깨진다.
			request.setCharacterEncoding("UTF-8");
			//이전 페이지부터 오는 ID를 받는다. request로 받으면 된다.
			String sID = (String)request.getAttribute("ID");
			
			//page 한번에 보일 개수
			int pageCount = 0;
			//sID가 정상적으로 받아지면, 
			PageList pageList = SelectService.getInstance().getPageList(sID);
			Iterator iter;
			for(PageVO p : pageList.getPageList())
			{
				if(pageCount >= 11)
				{
					iter = pageList.getPageList().iterator();
					break;
				}
				pageCount++;
			%>
			<!-- html code 구간 -->
			<!-- 클릭시 ClickPage.jsp으로 값들을 넘긴다. -->
			<div class="page" onclick="location.href='ClickPage.jsp?no=<%=p.getnNo()%>&title=<%=p.getsTitle()%>&content=<%=p.getsContent()%>&date=<%=p.getsDate()%>'">
				<h1><%=p.getsTitle()%></h1>
				<p align="center"><%=p.getsContent()%></p>
				<p align="right"><%=p.getsDate()%><p>
			</div>
			<%
				request.setAttribute("PaveVO", p);
				request.setAttribute("PageList", pageList);
			} 
			%>
			
		
		</div>
		<div id="side_right">section3
		</div>
	</section>	
	<footer>footer
	</footer>
</div>
<script>
    $(document).ready(function(){
    	
        $(window).scroll(function(){
          var scrollHeight = $(window).scrollTop() + $(window).height();
          var documentHeight = $(document).height();

          if(scrollHeight == documentHeight){
    	
    		<%
    			int count = 0;
    			for(PageVO p : pageList.getPageList()){
    				
    				if(pageCount > count){
    				
    				}
    				else{ 		
    				
				    		%>
				    		$("#main").append("<div class='page' onclick='ClickPage.jsp'>");
				    		$("#main").append('<h1><%=p.getsTitle()%>');				    	
				    		$("#main").append('</h1>');
				    		$("#main").append("<p align='center'><%=p.getsContent()%>");			
				    		$("#main").append('</p>');
				    		$("#main").append("<p align='right'><%=p.getsDate()%>");
				    		$("#main").append('</p>');    		
				    		$("#main").append('</div>'); 
				    		<%
    					}
    				
    				count++;
    			}
    		%>
    		
          }   			   		
    	
        });
    });
  </script>
</body>
</html>