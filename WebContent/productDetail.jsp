<%@page import="review.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="review.ReviewDTO"%> 

<%@include file="header.jsp" %> 
	<section>
		<div class="container">
			<div class="row">  
			<%@include file="sidebar.jsp" %>	
			
			<!-- starts -->				
				<% 
				ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
				
				int productID = 0;  
				if (request.getParameter("productID")!=null){
					productID = Integer.parseInt(request.getParameter("productID")); 
				} 
				ProductDTO product = new ProductDAO().productDetail(productID);   
				%>
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<!-- <img src="images/product-details/1.jpg" alt="" /> -->
								<img src="./images/product-details/<%= product.getProductImg()%>" width="200px" height="200px" alt="" />  
							</div>
							<!--이미지 여러장 추가예정 --> 
						</div>
						
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information--> 
								<form method="post" action="./cartAction.jsp">
									<h2><%= product.getProductName()%></h2>  
									<p>상품번호: <%= product.getProductID()%></p>
									<input type="hidden" name="productID" value="<%= product.getProductID()%>"> 
									<span>
										<span><%= product.getProductPrice()%>원</span> 
										<input type="hidden" name="cartPrice" value="<%= product.getProductPrice()%>" required> 
										<label>Quantity:</label>
										<input type="number" name ="cartCount" value="1" min="1" max="<%= product.getProductInventory()%>"/>
										<button type="submit" class="btn btn-fefault cart">
											<i class="fa fa-shopping-cart"></i>
											Add to cart
										</button>
									</span>
									<p><b>재고:</b> <%= product.getProductInventory()%></p> 
									<p><b>Brand:</b> <%= product.getProductBrand()%></p>  
								</form>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#details" data-toggle="tab">Details</a></li>
								<li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li> 
								<li><a href="#reviews" data-toggle="tab">Reviews</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="details" >
								<div class="col-sm-12"> 
									<p><%= product.getProductExplanation()%></p>
											 
								</div> 
							</div> 
							<div class="tab-pane fade" id="companyprofile" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div> 
							</div> 
							<div class="tab-pane fade" id="reviews" >
								<div class="col-sm-12">
								<!-- 작성된 리뷰  -->
									<% 
									
									ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();  
									reviewList = new ReviewDAO().getReviewList(productID);
									if(reviewList != null){ 
										for(int i = 0; i< reviewList.size(); i++){
											ReviewDTO review = reviewList.get(i);
									%> 
									
									<ul>
										<li><i class="fa fa-user"></i><%= review.getUserID()%></a></li> 
										<li><i class="fa fa-calendar-o"></i><%= review.getDate() %></a></li>
									</ul>
									<p><%= review.getContents() %></p> <hr/>
									<% 
										} 
									}
									%>
									
								<!-- 리뷰작성  -->  
								
									<%if(session.getAttribute("userID")!=null){%>
									<form method="post" action="./reviewAction.jsp">
										<p><b>리뷰를 작성해주세요</b></p>
										<span> 
											<% String sessionUserID = session.getAttribute("userID").toString(); %>
											<input type="text" name ="userID" placeholder="<%=sessionUserID%>" readonly/>
										
											<input type="text" name="contents" value=""/>
										</span>
										<input type="hidden" name="productID" value="<%= productID%>">  
										<button type="submit" class="btn btn-default pull-right">
											작성하기
										</button> 
									</form>
									<%}%>
									
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->
					
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					
				</div> 
			</div>
		</div>
	</section>
	
	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>e</span>-shopper</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe1.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe3.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe4.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Online Help</a></li>
								<li><a href="">Contact Us</a></li>
								<li><a href="">Order Status</a></li>
								<li><a href="">Change Location</a></li>
								<li><a href="">FAQâs</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Quock Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">T-Shirt</a></li>
								<li><a href="">Mens</a></li>
								<li><a href="">Womens</a></li>
								<li><a href="">Gift Cards</a></li>
								<li><a href="">Shoes</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terms of Use</a></li>
								<li><a href="">Privecy Policy</a></li>
								<li><a href="">Refund Policy</a></li>
								<li><a href="">Billing System</a></li>
								<li><a href="">Ticket System</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Company Information</a></li>
								<li><a href="">Careers</a></li>
								<li><a href="">Store Location</a></li>
								<li><a href="">Affillate Program</a></li>
								<li><a href="">Copyright</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Get the most recent updates from <br />our site and be updated your self...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright Â© 2013 E-SHOPPER Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>

<!-- 이미지 여러장 보는 기능 추가! 
	<div id="similar-product" class="carousel slide" data-ride="carousel">
		  Wrapper for slides
		    <div class="carousel-inner">
				<div class="item active">
				  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
				  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
				  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
				</div>
				<div class="item">
				  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
				  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
				  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
				</div>
				<div class="item">
				  <a href=""><img src="images/product-details/similar1.jpg" alt=""></a>
				  <a href=""><img src="images/product-details/similar2.jpg" alt=""></a>
				  <a href=""><img src="images/product-details/similar3.jpg" alt=""></a>
				</div>
			</div>
		  Controls
		  <a class="left item-control" href="#similar-product" data-slide="prev">
			<i class="fa fa-angle-left"></i>
		  </a>
		  <a class="right item-control" href="#similar-product" data-slide="next">
			<i class="fa fa-angle-right"></i>
		  </a>
	</div> -->