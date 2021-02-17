<!-- 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	< 직원등록 페이지 register.jsp >
	- index.jsp의 직원등록 버튼을 누르면  IndexController에 의해 페이지에 들어옵니다.
	- 인풋박스에 원하는 값들을 입력한 뒤 등록을 누르면 데이터가 EmpController에 의해 등록됩니다. 
				작업이 완료되면 index.jsp로 이동합니다.
				
	< 프로그램 >
	EMS_ADD : 직원 등록

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/static/common/header.jsp" %>
<%@ include file="/resources/static/common/nav_detail.jsp" %>
<!-- --------------------------------초기화 버튼------------------------------------- -->
<section id="contact">
	<div class="grid3">
		<div class="grid_item3">		
			<input type="submit" class="form-control submit" value="초기화" onclick="reset_form('#register-form')">
		</div>
	</div>
<!-- ================================= 등록폼 ================================== -->
   <div class="container">
      <div class="row">
			<h1>직원 등록</h1>
			<div class="contact-form">
				<form id="register-form" name="register-form" method="post" action="${path }/api/v1/emp">
					<h3>필수 정보</h3>
<!-- --------------------------------- 필수정보 좌측------------------------------------- -->				
				    <div class="wow fadeInUp col-md-6 col-sm-12">
				    	<p>성명</p>
						<input id="name" name="name" type="text" class="form-control" placeholder="성명" maxlength="6" required>
						<p>주민등록번호</p>
						<input id="ssm" name="ssm" type="text" class="form-control" placeholder="주민등록번호(-없이 입력)" maxlength="13" required>					
    					<p>휴대폰</p>
						<input id="phoneNum" name="phoneNum" type="text" class="form-control" placeholder="전화번호(이동전화) (-없이 입력)" maxlength="11" required>
    					<p>주소</p>
						<input id="addr" name="addr" type="text" class="form-control" placeholder="주소" maxlength="20" onclick='execDaumAddr()' readonly required>
						<input id="addrDetail" name="addrDetail" type="text" class="form-control" placeholder="상세 주소(있는 경우)" maxlength="20">
					</div>	
<!-- --------------------------------- 필수정보 우측------------------------------------- -->								
					<div class="wow fadeInUp col-md-6 col-sm-12">
						<p>성별</p>
						<select name="gender" style="padding: 1em .5em; width: 100%">
    						<option value="1">남</option>
    						<option value="2">여</option>
    					</select>
						<p>부서명</p>
						<select id="deptNum" name="deptNum" style="padding: 1em .5em;width: 100%;" required>
    						<option value="all">부서명</option>
    						<c:set var="count" value="${fn:length(deptList)}" />
    						<c:forEach items="${deptList }" var="dept" varStatus="status" >
    							<option value="${dept.deptNum }">${dept.deptName}</option>
							</c:forEach>				
						</select>
						<p>직급</p>
						<input id="rank" name="rank" type="text" class="form-control" placeholder="직급" maxlength="4" required>
						<p>입사일자</p>
						<input id="joinDate" name="joinDate" type="date" class="form-control" placeholder="입사일자(YYYY-MM-DD)" required>					
					</div>
					<p>______________________________________________________________________</p>
					<h3>선택 정보</h3>
<!-- --------------------------------- 선택정보 좌측------------------------------------- -->		
					<div class="wow fadeInUp col-md-6 col-sm-12">
				    	<p>취미</p>
						<input id="hobby" name="hobby" type="text" class="form-control" placeholder="취미" maxlength="6">
						<p>학점</p>
						<input id="grade" name="grade" type="text" class="form-control" placeholder="학점" maxlength="4">
					</div>
<!-- --------------------------------- 선택정보 우측------------------------------------- -->		
					<div class="wow fadeInUp col-md-6 col-sm-12">					
    					<p>전화번호(자택)</p>
						<input id="homeNum" name="homeNum" type="text" class="form-control" placeholder="전화번호(자택) (-없이 입력)" maxlength="12">
    				</div>
<!-- --------------------------------- 등록버튼------------------------------------- -->			
			</form>
				<div class="reg-submit">
					<input id= "btn-reg" type="submit" class="form-control submit" value="등록하기" onclick="validateForRegister()">
				</div>
			</div>
      </div>
   </div>
</section>

<!-- =================================================================== -->
<%@ include file="/resources/static/common/footer.jsp" %>
</body>
</html>