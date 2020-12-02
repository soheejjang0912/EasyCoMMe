<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="user.UserDAO" %>

<%@include file="header.jsp" %>

	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1"> 
					<div class="login-form"><!--login form-->
						<h2>상품 등록하기</h2>
						<form method="post" action="./productRegisterAction.jsp">
							<div class="form-group">
								<label>상품 카테고리</label> 
								<select name="productCategory" class="form-group">
										<option value="옷" selected>옷</option>
										<option value="신발">신발</option>
										<option value="가전제품">가전제품</option>
										<option value="식품">식품</option>
								</select>
							</div>
							<div class="form-group">
								<label>상품종류 </label>
								<select name="productType" class="form-group">
										<option value="티셔츠" selected>티셔츠</option>
										<option value="바지">바지</option>
										<option value="원피스">원피스</option>
										<option value="운동화">운동화</option> 
										<option value="구두">구두</option> 
										<option value="컴퓨터">컴퓨터</option> 
										<option value="TV">TV</option>  
										<option value="신선식품">신선식품</option> 
										<option value="즉석식품">즉석식품</option> 
								</select>
							</div>
							<div class="form-group">
								<label>브랜드</label>
								<select name="productBrand" class="form-group">
										<option value="나이키" selected>나이키</option>
										<option value="아디다스">아디다스</option>
										<option value="폴햄">폴햄</option>
										<option value="LG">LG</option> 
										<option value="SAMSUNG">SAMSUNG</option> 
										<option value="APPLE">APPLE</option> 
										<option value="EMART">EMART</option> 
										<option value="LOTTEMART">LOTTE MART</option>  
								</select> 
							</div>
							<div class="form-group">
								<label>상품명</label>
								<input type="text" name ="productName" placeholder="상품명을 입력하세요." />
							</div>
							<div class="form-group">
								<label>설명</label>
								<input type="text" name ="productExplanation" placeholder="상품의 설명을 입력하세요." />
							</div>
							<div class="form-group">
								<label>상품 이미지</label>
								<input type="file" name="productImg">
							</div>
							<div class="form-group">
								<label>가격</label>
								<input type="text" name ="productPrice" placeholder="가격을 입력하세요." />
							</div>
							<div class="form-group">
								<label>재고</label>
								<input type="text" name ="productInventory" placeholder="재고수를 입력하세요." />
							</div>
							<button type="submit" class="btn btn-default">상품 등록하기</button>
						</form>
					</div><!--/login form-->
				</div> 
			</div>
		</div>
	</section><!--/form-->
	
<%@include file="footer.jsp" %> 