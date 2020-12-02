<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="product.ProductDTO" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	int productID = 0;
	String productCategory = null;
	String productType = null;
	String productBrand = null;
	String productName = null;
	String productExplanation = null;
	String productImg = null;
	int productPrice = 0;
	int productInventory = 0;
	
	if(request.getParameter("productCategory") != ""){
		productCategory = request.getParameter("productCategory");
	}
	if(request.getParameter("productType") != ""){
		productType = request.getParameter("productType");
	}
	if(request.getParameter("productBrand") != ""){
		productBrand = request.getParameter("productBrand");
	}
	if(request.getParameter("productName") != ""){
		productName = request.getParameter("productName");
	}
	if(request.getParameter("productExplanation") != ""){
		productExplanation = request.getParameter("productExplanation");
	}
	if(request.getParameter("productImg") != ""){
		productImg = request.getParameter("productImg");
	}
	if(request.getParameter("productPrice") != ""){
		try{
			productPrice = Integer.parseInt(request.getParameter("productPrice"));
		}catch(Exception e){
			System.out.println("productPrice오류");
		} 
	} 
	if(request.getParameter("productInventory") != ""){
		try{
			productInventory = Integer.parseInt(request.getParameter("productInventory"));
		}catch(Exception e){
			System.out.println("productInventory오류");
		} 
	}  
	if(productCategory == null || productType == null || productBrand == null || productName == null || productExplanation == null || productImg == null || productInventory == 0 || productPrice == 0 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	ProductDAO productDAO = new ProductDAO();
	int result = productDAO.productRegister(new ProductDTO(productID, productCategory, productType, productBrand, productName, productExplanation, productImg, productPrice, productInventory));
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('등록에 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else{
		//session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("alert('게시물 등록에 성공했습니다!');");
		script.println("</script>");
		script.close();
		return; 
	}
%>