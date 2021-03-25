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
<%
	//넘어오는 값을 받고
	int pageNO = Integer.parseInt(request.getParameter("pageNO"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String date = request.getParameter("date");
	
	request.setAttribute("pageNO", pageNO);
	//수정 후 ok 누르면 
	//ModifyPageOK.jsp 에서 db에 써준다.
%>
    <section id="service" class="board-section color-dark bg-gray">
      <header>
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="animatedParent">
					<div class="section-heading text-center animated bounceInDown">
					<h2 class="h-bold">edit</h2>
					<div class="divider-header"></div>
					</div>
					</div>
				</div>
			</div>
		</div>
  </header>

		<div class="container">
      <!-- left part : 친구 관리 부분
            가로 12칸 중 2칸 차지 -->
            <div class="col-xs-2 col-sm-2 col-md-2" id="section1">
            </div>

            <!-- Middle part : 게시글 나열 부분
                  가로 12칸 중 8칸 차지 -->
			<div class="col-xs-8 col-sm-8 col-md-8">
          		<div class="board-box">
					<div class="brief-article">
              <!-- 작성자 ID -->      	
 		      <!-- 게시물 내용 받아오는 부분 -->
			              <form method="post" action="ModifyOK.jsp">
			              	<div class="divider-header marginbot-20"  style="float: left;"></div>
			            	<br />
			            	<div class="edit-article-content ellipsis">
			              	<h6 class="subject"><textarea class="edit-sbj-textarea" name="titleText" cols="20" rows="1"><%=title%></textarea></h6>
				              <input type="hidden" name="pageNO" value="<%=pageNO %>"/>
				              <input type="hidden" name="title" value="<%=title %>"/>
				              <input type="hidden" name="date" value="<%=date %>"/>
				              <textarea class="edit-textarea" name="contentText" rows="10" cols="100"><%=content %></textarea>
				              <div>
			            		  <input type="submit" onlick="loation.href='ModifyOK.jps'" class="btn btn-skin margintop-20" value="완료" style="margin-left:45%">
			            	  </div>
			             </div>
			            </form>             
				</div>
         	</div>
          </div>

          <!--Right part : 게시글 추가 버튼 부분
                가로 12칸 중 2칸 차지 -->
        <!--Right part : 게시글 추가 버튼 부분
                가로 12칸 중 2칸 차지 -->
			<div class="col-xs-2 col-sm-2 col-md-2" id="section2">
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
  						<a href="index.jsp">HOME</a>
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
</body>


</html>