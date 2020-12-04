<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="product.ProductDTO"%>
<%@ page import="product.ProductDAO"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Easy CoMMe</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		  
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
						</div> 
						<!-- 언어전환 기능 추가 예정
						<div class="btn-group pull-right clearfix">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									KOREA
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu"> 
									<li><a href="">JAPAN</a></li>
								</ul>
							</div>
						</div> -->
					</div>
					<div class="col-md-8 clearfix">
						<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav">
								 
								<%   
								if(session.getAttribute("userID")==null){
									out.println("<li><a href='userLogin.jsp'><i class='fa fa-lock'></i> 로그인</a></li>");
									out.println("<li><a href='userRegister.jsp'><i class='fa fa-user'></i> 회원가입</a></li>"); 
								}else{	
									out.println("<li><a href='userManage.jsp'><i class='fa fa-user'></i> 계정관리</a></li>");  
									if(session.getAttribute("userType").equals("customer")){ 
										out.println("<li><a href='cart.jsp'><i class='fa fa-shopping-cart'></i> 장바구니</a></li>");
										out.println("<li><a href='cart.jsp'><i class='fa fa-star'></i> 구매내역</a></li>");	
									}
									else if(session.getAttribute("userType").equals("seller")){ 
										out.println("<li><a href='productRegister.jsp'><i class='fa fa-crosshairs'></i> 상품등록</a></li>");	
									} 
									out.println("<li><a href='userLogout.jsp'><i class='fa fa-lock'></i> 로그아웃</a></li>");
								}
								%> 
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp">Home</a></li> 
								
								<li class="dropdown"><a href="#">옷<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="producCategoryList.jsp?productType=티셔츠">티셔츠</a></li>
										<li><a href="producCategoryList.jsp?productType=바지">바지</a></li>
										<li><a href="producCategoryList.jsp?productType=원피스">원피스</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">신발<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="producCategoryList.jsp?productType=운동화">운동화</a></li>
										<li><a href="producCategoryList.jsp?productType=구두">구두</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">가전제품<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="producCategoryList.jsp?productType=컴퓨터">컴퓨터</a></li>
										<li><a href="producCategoryList.jsp?productType=TV">TV</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">식품<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="producCategoryList.jsp?productType=신선식품">신선식품</a></li>
										<li><a href="producCategoryList.jsp?productType=즉석식품">즉석식품</a></li>
                                    </ul>
                                </li>   
							</ul>
						</div>
					</div> 
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->