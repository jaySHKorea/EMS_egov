<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ===================================== 로그인 세션 확인 =========================================== -->
<%			String id = (String) session.getAttribute("id");
%> 
<!-- ========================================== 메뉴바 =========================================== -->
<div class="grid">
			<form id="logout" method="post" action="logout.do">
				<div class="grid_item">
					<input type="submit" class="form-control submit" value="로그아웃">
				</div>
			</form>
<%	
			// admin 계정일때 직원 등록/직원 삭제 버튼이 보임
			if ( id.equals("admin")){
%>     
				<div class="grid_item">
					<input type="submit" class="form-control submit" value="선택 삭제" id="btn-cond-del">
				</div>
			
			
			<form id="add-form" method="get" action="register">
            	<div class="grid_item">
					<input type="submit" class="form-control submit" value="직원 등록" id="emp_add">
				</div>
			</form>
			
			<%}%>
			</div>
		

