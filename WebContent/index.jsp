<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@include file="header.jsp" %>

	<!--index 슬라이더-->
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol> 
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>EASY</span>CoMMe</h1>
									<h2>어서오세요. EasyCoMMe에</h2>
									<p>누구나 쉽게(Easy) 즐길 수 있는 <br> 커머셜(CoMMercial)사이트 입니다! </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl1.jpg" class="girl img-responsive" alt="" />
									<img src="images/home/pricing.png"  class="pricing" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>EASY</span>CoMMe</h1>
									<h2>100% 정품만을 취급합니다.</h2>
									<p>믿고 주문해주세요!</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl2.jpg" class="girl img-responsive" alt="" />
									<img src="images/home/pricing.png"  class="pricing" alt="" />
								</div>
							</div> 
							<div class="item">
								<div class="col-sm-6">
									<h1><span>EASY</span>CoMMe</h1>
									<h2>믿을 수 있는 상품평!</h2>
									<p>EasyCoMMe은 인증받은 유저만 상품평을 등록할 수 있습니다! </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl3.jpg" class="girl img-responsive" alt="" />
									<img src="images/home/pricing.png" class="pricing" alt="" />
								</div>
							</div> 
						</div> 
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div> 
				</div>
			</div>
		</div>
	</section>
	<!--슬라이더 끝-->
	
	<section>
		<div class="container">
			<div class="row"> 
				<%@include file="sidebar.jsp" %>

				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">최신 상품</h2>
						
						<% 
						ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
						productList = new ProductDAO().getList();
						if(productList != null){ 
							for(int i = 0; i< productList.size(); i++){ 
								if(i==6) break; //최신 상품 6개만 보여주기
								ProductDTO product = productList.get(i);
						%>

						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<!--<img src="images/home/product1.jpg" alt="" />  
										<h2><%= product.getProductImg()%></h2>-->
										<img src="./images/product-details/<%= product.getProductImg()%>" width="200px" height="200px" alt="" />
										
										<h2><%= product.getProductName()%></h2>
										<p><%= product.getProductPrice()%>원</p> 
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2><%= product.getProductName()%></h2>
											<p><%= product.getProductPrice()%>원</p>
											<a href="productDetail.jsp?productID=<%= product.getProductID() %>" class="btn btn-default add-to-cart"><i class="fa fa-plus-square"></i>자세히 보기</a>
										</div>
									</div>
								</div> 
							</div>
						</div>
						<%
								}
							} 
						%>
					</div><!--features_items-->
					
				</div>
			</div>
		</div>
	</section>
	
<%@include file="footer.jsp" %> 