<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDTO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	int reviewID = 0;
	int productID = 0; 
	String contents = null;
	String date = null;
	 
	if(request.getParameter("productID") != ""){
		try{
			productID = Integer.parseInt(request.getParameter("productID"));
			System.out.println(productID);
		}catch(Exception e){
			System.out.println("productID 오류");
		} 
	}
	if(request.getParameter("contents") != ""){
		contents = request.getParameter("contents");
		System.out.println(contents);
	} 
	if(userID == null || productID == 0 || contents == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	 
	ReviewDAO reviewDAO = new ReviewDAO();
	int result = reviewDAO.register(new ReviewDTO(0, productID, userID, contents, date));
	  
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시물 등록에 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else{
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시물 등록에 성공했습니다.');"); 
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return; 
	}
%>