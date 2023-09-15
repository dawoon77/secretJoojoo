<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="starlight"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="admin/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>상품 관리</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="admin/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="admin/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="admin/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="admin/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="admin/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet"
	href="admin/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="admin/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="admin/assets/js/config.js"></script>
</head>

<body>

	<!-- 관리자 메뉴 -->
	<starlight:admin />

	<!-- Hoverable Table rows -->

	<!-- Content wrapper -->
	<div class="content-wrapper">
		<!-- Content -->

		<div class="container-xxl flex-grow-1 container-p-y">
			<h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light"> 상품 관리/</span> 상품 목록
			</h4>
			<button id="registerButton" type="button" class="btn btn-primary">상품
				등록</button>
			<!-- Basic Bootstrap Table -->
			<div class="card">
				<h5 class="card-header">[상품 목록]</h5>
				<div class="table-responsive text-nowrap">

					<table class="table table-hover">
						<thead>
							<tr>
								<th>상품 명</th>
								<th>상품 가격</th>
								<th>남은 재고</th>
								<th>상품 상태</th>
								<th>상품 삭제 / 편집</th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0">
						
							<c:forEach items="${ pdatas}" var="v">
								<tr>
									<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
										<strong>${v.pName }</strong></td>
									<td>${v.pPrice }</td>
									<td>
										<ul
											class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
											${v.pCnt }
										</ul>
									</td>
									<c:if test="${v.pCnt > 0 && v.pCnt <= 20}">
										<td><span class="badge bg-label-warning">부족</span></td>
									</c:if>
									<c:if test="${v.pCnt > 20}">
										<td><span class="badge bg-label-primary">충분</span></td>
									</c:if>
									<c:if test="${v.pCnt == 0}">
										<td><span class="badge bg-label-danger">품절</span></td>
									</c:if>
									<td>
										<div class="dropdown">
											<button type="button"
												class="btn p-0 dropdown-toggle hide-arrow"
												data-bs-toggle="dropdown">
												<i class="bx bx-dots-vertical-rounded"></i>
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item"
													href="adminProductUpdatePage.do?pNum=${v.pNum}"><i
													class="bx bx-edit-alt me-1"></i> 편집</a> <a
													class="dropdown-item"
													href="adminProductDelete.do?pNum=${v.pNum}"><i
													class="bx bx-trash me-1"></i> 삭제</a>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
			<!--/ Hoverable Table rows -->

			<!-- Footer -->
			<footer class="content-footer footer bg-footer-theme">
				<div
					class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
					<div class="mb-2 mb-md-0">
						©
						<script>
							document.write(new Date().getFullYear());
						</script>
						, made with ❤️ by <a href="https://themeselection.com"
							target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
					</div>
					<div>
						<a href="https://themeselection.com/license/"
							class="footer-link me-4" target="_blank">License</a> <a
							href="https://themeselection.com/" target="_blank"
							class="footer-link me-4">More Themes</a> <a
							href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
							target="_blank" class="footer-link me-4">Documentation</a> <a
							href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
							target="_blank" class="footer-link me-4">Support</a>
					</div>
				</div>
			</footer>
			<!-- / Footer -->

			<div class="content-backdrop fade"></div>
		</div>
		<!-- Content wrapper -->
	</div>
	<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<!-- 버튼 클릭 -->
	<script>
		// 버튼 요소를 가져옵니다.
		var registerButton = document.getElementById("registerButton");

		// 버튼 클릭 시 실행될 함수를 정의합니다.
		function redirectToOtherURL() {
			// 원하는 URL로 이동합니다.
			window.location.href = "adminProductInsertPage.do";
		}

		// 버튼 클릭 이벤트에 함수를 연결합니다.
		registerButton.addEventListener("click", redirectToOtherURL);
	</script>

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="admin/assets/vendor/libs/jquery/jquery.js"></script>
	<script src="admin/assets/vendor/libs/popper/popper.js"></script>
	<script src="admin/assets/vendor/js/bootstrap.js"></script>
	<script
		src="admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="admin/assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script src="admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

	<!-- Main JS -->
	<script src="admin/assets/js/main.js"></script>

	<!-- Page JS -->
	<script src="admin/assets/js/dashboards-analytics.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>