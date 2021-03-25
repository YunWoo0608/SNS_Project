<%@page import="VO.PageVO"%>
<%@page import="Service.SelectService"%>
<%@page import="VO.PageList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 게시물 page -->
    <title>SNS - board</title>

    <!-- css -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
   	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
 	<link href="css/animations.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
  	<link href="color/default.css" rel="stylesheet">


</head>

<body>

      <section id="board" class="board-section color-dark bg-gray">
      <header>
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
          <div class="animatedParent">
					<div class="section-heading text-center animated bounceInDown">
					<h2 class="h-bold">board</h2>
					<div class="divider-header"></div>
					</div>
					</div>
				</div>
			</div>
      <div class="low">
        <a href="#"><img id="mb-add" src="img/button_add.png" width="10%" /></a>
      </div>
		</div>
  </header>

		<div class="container">
      <!-- left part : 친구 관리 부분
            가로 12칸 중 2칸 차지 -->
            <div class="col-xs-2 col-sm-2 col-md-2" id="friend-section">
                <div class="board-box">
					<div class="friend">
						<h5>Friends</h5>
						<div class="divider-header marginbot-20" style="float: left;"></div>
           				 <br />
						<a href="#" class="btn btn-skin add-btn">Add</a>
					</div>
                </div>
            </div>

            <!-- Middle part : 게시글 나열 부분
                  가로 12칸 중 8칸 차지 -->
			<div class="col-xs-12 col-sm-8 col-md-8">
			<%
			//UTF-8로 받아야 한글이 안깨진다.
			request.setCharacterEncoding("UTF-8");
			//이전 페이지부터 오는 ID를 받는다. session로 받으면 된다.
			String sID = (String)session.getAttribute("ID");
			
			//page 한번에 보일 개수
			int pageCount = 0;
			//sID가 정상적으로 받아지면, 
			PageList pageList = SelectService.getInstance().getPageList(sID);
			
			for(PageVO p : pageList.getPageList())
			{
				if(pageCount >= 5)
				{
					//break;
				}
				pageCount++;
			%>
			<!-- html code 구간 -->
			<!-- 클릭시 detail.jsp으로 값들을 넘긴다. -->	
			
          <div class="board-box" onclick="location.href='detail.jsp?no=<%=p.getnNo()%>&title=<%=p.getsTitle()%>&content=<%=p.getsContent()%>&date=<%=p.getsDate()%>'">
					<div class="brief-article">
              <!-- 작성자 ID -->
						<h6><%=p.getsTitle()%> </h6>
						<div class="divider-header marginbot-20"  style="float: left;"></div>
            <br />
            <div class="brief-article-content ellipsis">
              <!-- 게시물 내용 받아오는 부분 -->
						<p><%=p.getsContent()%></p>
						<p align="right"><%=p.getsDate()%><p>
            </div>
            <!--
						<a href="#" class="btn btn-skin" style="float: right; margin-left:5px" >수정</a>
            <a href="#" class="btn btn-skin" style="float: right;">삭제</a>-->
					</div>
         </div>
         
         	<%
				request.setAttribute("PaveVO", p);
				request.setAttribute("PageList", pageList);
			} 
			%>
          </div>

          <!--Right part : 게시글 추가 버튼 부분
                가로 12칸 중 2칸 차지 -->
			<div class="col-xs-2 col-sm-2 col-md-2" id="add-section">
           <!-- 게시물 추가 버튼 -->
        		<div class="board-box">
        			<div class="friend">
					  	<h5>UPLOAD</h5>
					    <div class="divider-header marginbot-20" style="float: left;"></div>
					    <br />
					      <a href="newPage.jsp" class="btn btn-skin add-btn">Add</a>
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
              <!-- 첫 화면으로 돌아가는 링크 -->
  						<a href="main.jsp">HOME</a>
  					</ul>
  				</div>
  				<div class="col-md-6 text-right">
  					<p>OUR SNS</p>
  				</div>
  			</div>
  		</div>
  	</footer>

    <!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>
   	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="js/css3-animate-it.js"></script>

		<!-- User Define Script -->
	
</body>

</html>