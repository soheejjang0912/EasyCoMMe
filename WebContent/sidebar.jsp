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
		</div>
	</div>