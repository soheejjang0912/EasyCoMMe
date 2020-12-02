<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@page import="cart.CartProductDTO"%>
<%@page import="cart.CartDTO"%>
<%@page import="cart.CartDAO"%>


<%@include file="header.jsp" %>

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody> 
						 
						<%
						ArrayList<CartProductDTO> cartList = new ArrayList<CartProductDTO>();
						String userID = (String)session.getAttribute("userID");
						cartList = new CartDAO().getList(userID);
						if(cartList != null){ 
							for(int i = 0; i< cartList.size(); i++){ 
								CartProductDTO cart = cartList.get(i);
						%>
					
						<tr>
							<td class="cart_product">
								<a href=""><img src="./images/product-details/<%= cart.getProductImg()%>" alt="" width="140px"></a>
							</td>
							<td class="cart_description">
								<h4><a href="productDetail.jsp?productID=<%= cart.getProductID() %>"> <%= cart.getProductName() %></a></h4>
								<p>Web ID: <%= cart.getProductID() %> </p>
							</td>
							<td class="cart_price">
								<p><%= cart.getCartPrice() %></p>
							</td>
							<td class="cart_quantity">
								<p><%= cart.getCartCount() %></p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><%= cart.getCartTotalPrice() %></p>
							</td>
							<form method="post" action="./cartDeleteAction.jsp">
							<td class="cart_delete">
								<button type="submit" class="cart_quantity_delete"><i class="fa fa-times"></i></button>
								<input type="hidden" name="cartID" value="<%= cart.getCartID()%>">  
							</td>
							</form>
						</tr>
						
						<%
								}
							} 
						%>
					 
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

<%@include file="footer.jsp" %> 