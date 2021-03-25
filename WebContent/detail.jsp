<%@page import="Service.ModifyService"%>
<%@page import="java.util.Iterator"%>
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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 게시물 상세 페이지 -->
    <title>EPLANE - POST</title>

    <!-- css -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  	<link href="css/animations.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet"/>
 	<link href="color/default.css" rel="stylesheet"/>
  
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
	
	//해당 글을 출력
%>
	<!-- Section: services -->
    <section class="board-section color-dark bg-gray">
    <header>
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
          <div class="animatedParent">
          <div class="section-heading text-center animated bounceInDown">
					<h2 class="h-bold">POST</h2>
					<div class="divider-header"></div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</header>

		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12">
            <div class="board-box">
            <div class="original-article" style="padding: 5%">
				<h5><%=p.getsTitle()%></h5>
					<div class="divider-header marginbot-20" style="float: left;" ></div>
					<br/>
				<p><%=p.getsContent()%></p><p align="right"><%=p.getsDate()%><p>
			</div>
				<a href="ModifyPage.jsp?pageNO=<%=p.getnNo()%>&title=<%=p.getsTitle()%>&content=<%=p.getsContent()%>&date=<%=p.getsDate()%>" class="btn btn-skin" style="float: right; margin-left:5px" >수정</a>
             	<a href="DeletePageOK.jsp?pageNO=<%=p.getnNo()%>" class="btn btn-skin" style="float: right;">삭제</a>
				<br/>
          		<hr />
          
          		<div class="service-desc">
            	<div class="comment_view">
  <%
	//댓글 출력
	//페이지 번호 주고 댓글 리스트 가져오기
	ReplyList replyList = new ReplyList();
	replyList.setReplyList(SelectService.getInstance().getReplyList(p.getnNo()).getReplyList());
	//out.println(""+replyList.getReplyList().size());
	if(replyList.getReplyList() != null){
		
			
			//깊이 만큼 타고 올라가 조상 찾기
			int count = 0;
			for(ReplyVO r : replyList.getReplyList()){
				for(int i = 1;i<r.getnDepth() - r.getnPre_ReplyNO(); i++)
				{
					
					if(r.getnPre_ReplyNO() > 1)
					{
						int preReplyNO = SelectService.getInstance().selectReply_PreNO(r.getnPre_ReplyNO());
						r.setnPre_ReplyNO(preReplyNO);
						out.println("("+r.getnReplyNO()+","+preReplyNO+")");
						ModifyService.getInstance().modifyPreReplyNO(r.getnReplyNO(),preReplyNO);
					}
					
					
				}
				
			}
			//순회
			for(ReplyVO pre : replyList.getReplyList()){
				for(ReplyVO c : replyList.getReplyList()){		
						//out.println("("+pre.getnReplyNO() + "," + c.getnReplyNO() + ")");
					//부모와 자식의 NO가 같고 자식의 조상이 있따면,
						if(pre.getnReplyNO() == c.getnPre_ReplyNO() && c.getnDepth() != 1){
							
							//out.println(c);
							//count++;
							
					%>
					 <div class="row" style="padding-left:<%=c.getnDepth()*20 -15%>px">
								<div class="col-xs-2 col-sm-2 col-md-2">
		              <p><%=SelectService.getInstance().getReplyName(c.getsMemberId()) %></p>
		            </div>

		            <div class="col-xs-10 col-sm-10 col-md-10">
		              <%=c.getsReplyContent() %><br />
		              <!--대댓글-->
		              <label for="checkbox">답글달기</label>

		            
		                 <!--댓글 남기는 부분 -->
	            <input id="checkbo" checked="checked" type="checkbox">
	            <div class="reply_write">
	              <div class="row">
	            <div class="col-xs-2 col-sm-1 col-md-1">
	              <p><%=SelectService.getInstance().getMemberID((String)session.getAttribute("ID"))%></p>
	            </div>
	
	            <!-- 내용 넘어가야 함-->
	            <div class="col-xs-9 col-sm-9 col-md-9">
	            	<form method="get" action="insertReplyOK_r.jsp">
		          		<input type="hidden" name="pageNO" value="<%=p.getnNo()%>"/>
		          		<input type="hidden" name="pageContent" value="<%=p.getsContent()%>"/>
		          		<input type="hidden" name="preReplyNO" value="<%=c.getnReplyNO()%>"/> 
		          		<input type="hidden" name="title" value="<%=p.getsTitle()%>"/>
		          		<input type="hidden" name="reorder" value="<%=c.getnReorder()%>"/>
		          		<input type="hidden" name="depth" value="<%=c.getnDepth()%>"/>
		          		<input type="hidden" name="date" value="<%=p.getsDate()%>"/>		          		      		
		                   		
		            	<textarea name="content"></textarea>
		            	<input type="submit" class="btn btn-skin" style="float: right;" value="등록" onclick="insertReplyOK.jsp"/>
		          	</form>
	            </div>
	          </div>
	          </div>
	            </div>
	                 </div>
				<%	
					//부모와 자식간의 관계도 아니고, 자기 자신일 경우 출력.
				}else if(pre.getnReplyNO() == c.getnReplyNO() && pre.getnDepth() == 1){			
					
					//out.println(count);
					//count++;
				%>
								 <div class="row" style="padding-left:<%=c.getnDepth()*20 -15%>px">
								<div class="col-xs-2 col-sm-2 col-md-2">
		              <p><%=SelectService.getInstance().getReplyName(pre.getsMemberId()) %></p>
		            </div>

		            <div class="col-xs-10 col-sm-10 col-md-10">
		              <%=pre.getsReplyContent() %><br />
		              <!--대댓글-->
		              <label for="checkbox">답글달기</label>

		            
		                 <!--댓글 남기는 부분 -->
	            <input id="checkbo" checked="checked" type="checkbox">
	            <div class="reply_write">
	              <div class="row">
	            <div class="col-xs-2 col-sm-1 col-md-1">
	              <p><%=SelectService.getInstance().getMemberID((String)session.getAttribute("ID"))%></p>
	            </div>
	
	            <!-- 내용 넘어가야 함-->
	            <div class="col-xs-9 col-sm-9 col-md-9">
	            	<form method="get" action="insertReplyOK_r.jsp">
		          		<input type="hidden" name="pageNO" value="<%=p.getnNo()%>"/>
		          		<input type="hidden" name="pageContent" value="<%=p.getsContent()%>"/>
		          		<input type="hidden" name="preReplyNO" value="<%=pre.getnReplyNO()%>"/> 
		          		<input type="hidden" name="title" value="<%=p.getsTitle()%>"/>
		          		<input type="hidden" name="reorder" value="<%=pre.getnReorder()%>"/>
		          		<input type="hidden" name="depth" value="<%=pre.getnDepth()%>"/>
		          		<input type="hidden" name="date" value="<%=p.getsDate()%>"/>		          		      		
		                   		
		            	<textarea name="content"></textarea>
		            	<input type="submit" class="btn btn-skin" style="float: right;" value="등록" onclick="insertReplyOK.jsp"/>
		          	</form>
	            </div>
	          </div>
	          </div>
	            </div>
	                 </div>
				<%
				}
			}
		}
	}
%>
             
     
          </div>
          <hr />
          <div class="comment_write">
            <div class="row">
          <div class="col-xs-2 col-sm-2 col-md-2">
            <p><%=SelectService.getInstance().getMemberID((String)session.getAttribute("ID"))%></p>
          </div>

          <!--댓글 남기는 부분 댓글 내용 넘어가야 함-->
          <div class="col-xs-10 col-sm-10 col-md-10">
          	<form method="get" action="insertReplyOK.jsp">
          		<input type="hidden" name="pageNO" value="<%=p.getnNo()%>"/>
          		<input type="hidden" name="pageContent" value="<%=p.getsContent()%>"/>
          		<input type="hidden" name="date" value="<%=p.getsDate()%>"/>
          		<input type="hidden" name="title" value="<%=p.getsTitle()%>"/>         		
            	<textarea name="content"></textarea>
            	<input type="submit" class="btn btn-skin" style="float: right;" value="등록" onclick="insertReplyOK.jsp"/>
          	</form>
          </div>
        </div>
        </div>
					</div>

                </div>

            </div>

		</div>
	</section>
	<!-- /Section: services -->




	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<ul class="footer-menu">
						<li><a href="#">Home</a></li>
						<li><a href="#">Press release</a></li>
					</ul>
				</div>
				<div class="col-md-6 text-right">
					<p>&copy;Copyright 2014 - Bocor. <a href="http://bootstraptaste.com/">Bootstrap Themes</a> by BootstrapTaste</p>
                    <!--
                        All links in the footer should remain intact.
                        Licenseing information is available at: http://bootstraptaste.com/license/
                        You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=Bocor
                    -->
				</div>
			</div>
		</div>
	</footer>

  <!-- Core JavaScript Files -->
  <script src="js/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="js/css3-animate-it.js"></script>

</body>

</html>