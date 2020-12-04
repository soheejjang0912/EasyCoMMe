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
								<li><a href="#reviews" data-toggle="tab">Reviews</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="details" >
								<div class="col-sm-12"> 
									<p><%= product.getProductExplanation()%></p>
											 
								</div> 
							</div> 
							<!-- 리뷰 -->
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
										<br/>
										<button type="submit" class="btn btn-default pull-right">
											작성하기
										</button> 
									</form>
									<%}%>
									
								</div>
							</div>
							<!-- /리뷰 -->
						</div>
					</div><!--/category-tab-->
				</div> 
			</div>
		</div>
	</section>
	
<%@include file="footer.jsp" %> 