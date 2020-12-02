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
						<h2>Login to your account</h2>
						<form method="post" action="./userRegisterAction.jsp">
							<div class="form-group">
								<label>아이디</label>
								<input type="text" name ="userID" placeholder="아이디를 입력하세요." />
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" name ="userPassword" placeholder="비밀번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label>이메일</label>
								<input type="email" name ="userEmail" placeholder="비밀번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label>주소</label>
								<input type="text" name ="userAdress" placeholder="주소를 입력하세요." />
							</div>
							<div class="form-group">
								<label>핸드폰 번호</label>
								<input type="text" name ="userPhone" placeholder="핸드폰번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label>성별</label>
								<input type="text" name ="userGender" placeholder="성별을 입력하세요." />
							</div>
							<div class="form-group">
								<label>생년월일</label>
								<input type="text" name ="userBirthday" placeholder="생년월일 입력하세요." />
							</div>
							<div class="form-group">
								<label>회원유형</label> 
								<select name="userType" class="form-group" style="font-size:22px">
										<option value="customer" selected> 일반고객 </option>
										<option value="seller"> 판매자 </option>
										<option value="manager"> EasyCoMMe 관리자 </option> 
								</select> 
							</div>
							<button type="submit" class="btn btn-default">회원가입</button>
						</form>
					</div><!--/login form-->
				</div> 
			</div>
		</div>
	</section><!--/form-->
	
<%@include file="footer.jsp" %> 