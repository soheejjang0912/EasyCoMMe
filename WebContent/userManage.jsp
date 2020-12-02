<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>

<%@include file="header.jsp" %>

	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>계정관리</h2>
						<form method="post" action="./userManageAction.jsp">
							<%    
							
							//UserDTO csList = new UserDTO();
							String userID =session.getAttribute("userID").toString();
							//(String)session.getAttribute("userID");
							System.out.println(userID);
							UserDTO userInfo = new UserDAO().getUser(userID);
							 
							/* 
						 	if ((String)session.getAttribute("userID")!=null){
								String userID =  (String)session.getAttribute("userID");
							}else{ 
								PrintWriter script = response.getWriter();
								script.println("<script>");
								script.println("alert('오류');");
								script.println("history.back();");
								script.println("</script>");
								script.close();
							}  
						 	String id = (String)session.getAttribute("userID");
							UserDTO user = new UserDAO().getUser(id); */
						//	CustomerServiceDTO cs = new CustomerServiceDAO().getCsDetail(csID); 
							
							%>
							<div class="form-group">
								<label>아이디</label>
								<input type="text" name ="userID" value ="<%= userInfo.getUserID()%>" readonly />
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" name ="userPassword" value ="<%= userInfo.getUserPassword()%>" />
							</div>
							<div class="form-group">
								<label>이메일</label>
								<input type="email" name ="userEmail" value ="<%= userInfo.getUserEmail()%>" />
							</div>
							<div class="form-group">
								<label>주소</label>
								<input type="text" name ="userAdress" value ="<%= userInfo.getUserAdress()%>" />
							</div>
							<div class="form-group">
								<label>핸드폰 번호</label>
								<input type="text" name ="userPhone" value ="<%= userInfo.getUserPhone()%>" />
							</div>
							<div class="form-group">
								<label>성별</label>
								<input type="text" name ="userGender" value ="<%= userInfo.getUserGender()%>" />
							</div>
							<div class="form-group">
								<label>생년월일</label>
								<input type="text" name ="userBirthday" value ="<%= userInfo.getUserBirthday()%>" />
							</div>
							<div class="form-group">
								<label>회원유형</label> 
								<select name="userType" class="form-group" style="font-size:22px">
										<option value="customer" selected> 일반고객 </option>
										<option value="seller"> 판매자 </option>
										<option value="manager"> EasyCoMMe 관리자 </option> 
								</select> 
							</div>
							<button type="submit" class="btn btn-default">정보수정</button>
						</form>
					</div><!--/login form-->
				</div> 
			</div>
		</div>
	</section><!--/form-->
	
<%@include file="footer.jsp" %> 