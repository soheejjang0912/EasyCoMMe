<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@include file="header.jsp" %>

	<section>
		<div class="container">
			<div class="row"> 
				<%@include file="sidebar.jsp" %>

				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">전체보기</h2>
						<% 
						ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>(); 
						String productType = null;  
						if (request.getParameter("productType")!=null){
							productType = request.getParameter("productType"); 
						}
						productList = new ProductDAO().getCategoryList(productType);
						if(productList != null){ 
							for(int i = 0; i< productList.size(); i++){
								ProductDTO product = productList.get(i);
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">    
										<img src="./images/product-details/<%= product.getProductImg()%>" width="200px" height="200px" alt="이미지를 불러올 수 없습니다." />
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
							}  %> 
					</div><!--features_items-->
										
				</div>
			</div>
		</div>
	</section>
	
<%@include file="footer.jsp" %> 