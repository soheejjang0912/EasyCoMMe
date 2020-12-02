<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="cart.CartDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	/* request.setCharacterEncoding("UTF-8");
	int productID = 0;
	productID = Integer.parseInt(request.getParameter("productID"));
	System.out.println(productID);
	 */
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
	 
	int productID = 0;
	int cartCount = 0;
	int cartPrice = 0; 
	int cartTotalPrice = 0;
	
	if(request.getParameter("productID") != ""){
		try{
			productID = Integer.parseInt(request.getParameter("productID"));
			}catch(Exception e){
			System.out.println("productID 오류");
		} 
	}
	
	if(request.getParameter("cartCount") != ""){
		try{
			cartCount = Integer.parseInt(request.getParameter("cartCount"));
			System.out.println(cartCount);
		}catch(Exception e){
			System.out.println("cartCount 오류");
		} 
	}
	
	if(request.getParameter("cartPrice") != ""){
		try{
			cartPrice = Integer.parseInt(request.getParameter("cartPrice"));
			}catch(Exception e){
			System.out.println("cartPrice 오류");
		} 
	}
	
	if(cartCount == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('구입 수량을 입력해 주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return; 
	}
	 
	CartDAO cartDAO = new CartDAO();
	int result = cartDAO.cartRegister(new CartDTO(0, userID, productID, cartCount, cartPrice, cartPrice*cartCount));
	
	if(result == 1){   
		PrintWriter script = response.getWriter();
		script.println("<script>"); 
		script.println("alert('장바구니 담기에 성공했습니다.');");
		script.println("location.href = 'cart.jsp'");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('장바구니 등록이 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return; 
	}
	
%>