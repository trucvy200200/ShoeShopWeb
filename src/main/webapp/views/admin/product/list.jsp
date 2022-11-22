
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product" />
<c:url var="ProductURL" value="/admin-product" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of products</title>
<style>
.list__check{
display: none;}
</style>
</head>
<body>
	<div class="main-content">
		<form action="<c:url value='/admin-product'/>" id="formSubmit"
			method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty messageResponse}">
								<div class="alert alert-${alert}">${messageResponse}</div>
							</c:if>
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Add new product'
												href='<c:url value="/admin-product?type=edit"/>'> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Delete product'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="row">
									<table class="table">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkAll"></th>
												<th>ID</th>
												<th>Product Name</th>
												<th>Price</th>
												<th>Description</th>
												<th>Manipulation</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${model.list}">
												<tr>
													<td><input type="checkbox"
														id="checkbox_${item.productId}" value="${item.productId}"></td>
													<td>${item.productId}</td>
													<td>${item.productName}</td>
													<td>${item.price}</td>
													<td>${item.desciption}</td>
													<td><c:url var="editURL" value="/admin-product">
															<c:param name="type" value="edit" />
															<c:param name="productId" value="${item.productId}" />
														</c:url> <c:url var="importURL" value="/admin-product">
															<c:param name="type" value="import" />
															<c:param name="productId" value="${item.productId}" />
														</c:url>

														<div class="store" >
															<i class="fa fa-pencil-square-o" aria-hidden="true" style="14px"></i>
															<div class="list__check">
																<ul>
																	<li><a href='${editURL}'>Edit</a></li>
																	<li><a href='${importURL}'>Import</a></li>
																</ul>
															</div>
														</div></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<ul class="pagination" id="pagination"></ul>
									<input type="hidden" value="" id="page" name="page" /> <input
										type="hidden" value="" id="maxPageItem" name="maxPageItem" />
									<input type="hidden" value="" id="sortName" name="sortName" />
									<input type="hidden" value="" id="sortBy" name="sortBy" /> <input
										type="hidden" value="" id="type" name="type" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- /.main-content -->
	<script>
		var totalPages = $
		{
			model.totalPage
		};
		var currentPage = $
		{
			model.page
		};
		var limit = 6;
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 6,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#sortName').val('price');
						$('#sortBy').val('desc');
						$('#type').val('list');
						$('#formSubmit').submit();
					}
				}
			});
		});

		$("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function() {
				return $(this).val();
			}).get();
			data['ids'] = ids;
			deleteProduct(data);
		});
		function deleteProduct(data) {
			$
					.ajax({
						url : '${APIurl}',
						type : 'DELETE',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function(result) {
							window.location.href = "${ProductURL}?type=list&maxPageItem=6&page=1";
						},
						error : function(error) {
							console.log(error);
						}
					});
		}
	</script>
</body>
</html>