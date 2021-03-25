<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EPLANE</title>

    <!-- css -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="css/animations.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
	<link href="color/default.css" rel="stylesheet">

</head>

<body>

   <!-- Sign-up Page -->
    <section class="home-section nopadd-bot color-dark bg-gray text-center">
      <header>
      <div class="container marginbot-50">
         <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <div class="animatedParent">
             <div class="section-heading text-center animated bounceInDown">
               <h2 class="h-bold">SIGN UP</h2>
               <div class="divider-header"></div>
               </div>
               </div>
            </div>
         </div>
      </div>
    </header>

    <!-- 회원 가입 입력 form -->
      <div class="container">
         <div class="row marginbot-80"> <!-- 한줄 차지, 아래 마진 80 -->
            <div class="col-md-8 col-md-offset-2">
                  <form id="contact-form" action="signupOK.jsp" method="get">
						<div class="row marginbot-20">
							<div class="col-md-6 xs-marginbot-20">
								<input type="text" class="form-control input-lg" id="id" name="id" placeholder="Id" required="required" />
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control input-lg" id="pw" name="pw" placeholder="Passward" required="required" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
										<input type="text" class="form-control input-lg" id="name" name="name" placeholder="User Name" required="required" />
								</div>
								<div class="form-group">
									<input type="email" class="form-control input-lg" id="email" name="email" required="required" placeholder="E-mail" />
          						</div>
								<button type="submit" class="btn btn-skin btn-lg btn-block" id="btnContactUs">
									Sign Up</button>
							</div>
						</div>
					</form>
            	</div>
         	</div>


      </div>
   </section>
   <!-- /Section: contact -->


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
 					<p>EPLANE</p>
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