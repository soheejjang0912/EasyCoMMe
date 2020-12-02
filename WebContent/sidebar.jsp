<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

	<div class="col-sm-3">
		<div class="left-sidebar">
			<h2>Category</h2>
			<div class="panel-group category-products" id="accordian"><!--category-productsr-->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
								<span class="badge pull-right"><i class="fa fa-plus"></i></span>
								옷
							</a>
						</h4>
					</div>
					<div id="sportswear" class="panel-collapse collapse">
						<div class="panel-body">
							<ul>
								<li><a href="producCategoryList.jsp?productType=티셔츠">티셔츠 </a></li>
								<li><a href="producCategoryList.jsp?productType=바지">바지 </a></li>
								<li><a href="producCategoryList.jsp?productType=원피스">원피스 </a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordian" href="#mens">
								<span class="badge pull-right"><i class="fa fa-plus"></i></span>
								신발
							</a>
						</h4>
					</div>
					<div id="mens" class="panel-collapse collapse">
						<div class="panel-body">
							<ul>
								<li><a href="producCategoryList.jsp?productType=운동화">운동화 </a></li>
								<li><a href="producCategoryList.jsp?productType=구두">구두 </a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordian" href="#sportswear2">
								<span class="badge pull-right"><i class="fa fa-plus"></i></span>
								가전제품
							</a>
						</h4>
					</div>
					<div id="sportswear2" class="panel-collapse collapse">
						<div class="panel-body">
							<ul>
								<li><a href="producCategoryList.jsp?productType=컴퓨터">컴퓨터 </a></li>
								<li><a href="producCategoryList.jsp?productType=TV">TV </a></li> 
							</ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordian" href="#mens2">
								<span class="badge pull-right"><i class="fa fa-plus"></i></span>
								식품
							</a>
						</h4>
					</div>
					<div id="mens2" class="panel-collapse collapse">
						<div class="panel-body">
							<ul>
								<li><a href="producCategoryList.jsp?productType=신선식품">신선식품 </a></li>
								<li><a href="producCategoryList.jsp?productType=즉석식품">즉석식품 </a></li> 
							</ul>
						</div>
					</div>
				</div>
				 
			</div><!--/category-products-->
		
		 <!-- 추가예정 카테고리
			<div class="brands_products">brands_products
				<h2>Brands</h2>
				<div class="brands-name">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="#">나이키 </a></li>
						<li><a href="#">아디다스 </a></li>
						<li><a href="#">폴햄 </a></li>
						<li><a href="#">LG </a></li>
						<li><a href="#">SAMSUNG </a></li>
						<li><a href="#">EMART </a></li>
						<li><a href="#">LOTTEMART </a></li>
					</ul>
				</div>
			</div>/brands_products
			
			<div class="price-range">price-range
				<h2>Price Range</h2>
				<div class="well text-center">
					 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
					 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
				</div>
			</div>/price-range
			
			<div class="shipping text-center">shipping
				<img src="images/home/shipping.jpg" alt="" />
			</div>/shipping
		 -->
		</div>
	</div>