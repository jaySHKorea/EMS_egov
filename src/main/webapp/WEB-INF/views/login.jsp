<!-- 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	< 로그인 페이지 login.jsp >
	- 로그인폼 페이지
	- LoginController에 의해 들어오며, 로그인처리를 합니다.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/static/common/header.jsp" %>
<!-- ==================================== 로그인 폼 ======================================== -->
<section id="contact">
   <div class="container">
      <div class="row">
         <div class="wow fadeInUp col-md-6 col-sm-12" data-wow-delay="1.3s">
			<h1>로그인 Login</h1>
			<div class="contact-form">
				<form id="contact-form" method="post" action="loginCheck.do">
					<input id="id" name="id" type="text" class="form-control" placeholder="아이디" required>
					<input id ="passwd" name="passwd" type="password" class="form-control" placeholder="비밀번호" required>					
					<div class="contact-submit">
						<input type="submit" class="form-control submit" value="Login">
					</div>
				</form>
			</div>
		</div>
      </div>
   </div>
</section>
<c:if test="${msg == 'failed'}">
	<script>alert("유효하지 않은 정보입니다.")</script>
</c:if>
<!-- ======================================================================================== -->
<%@ include file="/resources/static/common/footer.jsp" %>
</html>