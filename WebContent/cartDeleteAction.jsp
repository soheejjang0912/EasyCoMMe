<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="cart.CartDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<% 
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
		
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	 
	int cartID = 0;
	 
	if(request.getParameter("cartID") != ""){
		try{
			cartID = Integer.parseInt(request.getParameter("cartID"));
			}catch(Exception e){
			System.out.println("cartID 오류");
		} 
	}
	
	//CartDAO cartDAO = new CartDAO();
	//int result = cartDAO.cartDelete(cartID);
	int result = new CartDAO().cartDelete(cartID);
	
	if(result == 1){   
		PrintWriter script = response.getWriter();
		script.println("<script>"); 
		script.println("alert('삭제가 완료되었습니다.');");
		script.println("location.href = 'cart.jsp'");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터 베이스 오류가 발생했습니다..');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return; 
	}
	
%>