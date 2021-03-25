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
    <section id="service" class="board-section color-dark bg-gray">
        <header>
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
          <div class="animatedParent">
          <div class="section-heading text-center animated bounceInDown">
					<h2 class="h-bold">upload</h2>
					<div class="divider-header"></div>
					</div>
					</div>
				</div>
			</div>
		</div>
  </header>
  
			<div class="container">
            <div class="col-xs-2 col-sm-2 col-md-2" id="section1">
            </div>

            <!-- Middle part : 게시글 나열 부분
                  가로 12칸 중 8칸 차지 -->
			<div class="col-xs-12 col-sm-8 col-md-8">
        	  <div class="board-box">
				<div class="brief-article">
              <!-- 작성자 ID -->              			
						
			              <!-- 게시물 내용 받아오는 부분 -->
			              <form method="get" action="newPageOK.jsp">
			              	<h6 class="subject"><textarea class="edit-sbj-textarea" name="title" cols="20" rows="1">제목</textarea></h6>
							<div class="divider-header marginbot-20"  style="float: left;"></div>
	            			<br />
				            <div class="edit-article-content ellipsis">
			             	<textarea class="edit-textarea" name="content" rows="10" cols="100"> </textarea>
			             	<input type="submit" value="완료" class="btn btn-skin margintop-20" style="margin-left:45%">
			              	</div>
			              </form>
			          
        	     </div>
			  </div>
        	 </div>
           </div>

			<div class="col-xs-2 col-sm-2 col-md-2">
       </div>
	</section>


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
</body>

</html>