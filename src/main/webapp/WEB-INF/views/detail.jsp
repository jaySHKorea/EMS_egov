<!-- 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	< 직원 상세보기 페이지 detail.jsp >
	- 메인페이지(index.jsp)에서 특정 직원을 클릭했을 때 해당 직원에 대한 상세페이지입니다.
	- IndexController에 의해 들어옵니다.
	
	- 목록 버튼 : index.jsp로 이동
	- 삭제 버튼 : alert창의 응답에 따라 
				1. 삭제를 취소하거나 
				2. 삭제할 직원의 사원번호를 EmpController로 요청을 보냅니다.

	- 수정 버튼 : index.js의 validateForUpdate() 함수로 검사한 뒤, 수정할 form을 EmpController가 처리합니다.
	- 초기화(원래대로) 버튼 : 상세보기 폼의 모든 정보를 초기화합니다.
	
	< 프로그램 >
	EMS_DETAIL : 직원 상세 정보 조회
	EMS_DELETE : 직원 삭제
	EMS_UPDATE : 직원 상세 정보 수정

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/static/common/header.jsp" %>
<%@ include file="/resources/static/common/nav_detail.jsp" %>
<!-- ================================ 페이지 예외처리 ================================== -->
<c:if test="${empty empInfo}">
	<script>alert("해당직원의 정보가 없습니다.") location.href="../../index"</script>
</c:if>
<c:if test="${id != 'admin' && id != empInfo.empNum}">
	<script>alert("접근권한이 없습니다.") location.href="../../index"</script>
</c:if>
<section id="contact">
<!-- --------------------------------- 삭제 /초기화 버튼------------------------------------- -->
	<div class="grid3">
		<c:if test="${id eq 'admin'}">
			<div class="grid_item3">
				<form id="delete-form" method="post" action="${path }/api/v1/delete/${empInfo.empNum }" onsubmit="return confirm('- ${empInfo.empNum } ${empInfo.name } ${empInfo.rank }\n해당 직원을 삭제하시겠습니까?')">
					<input type="submit" class="form-control submit" value="삭제" id="btn-delete">
				</form>
			</div>
		</c:if>
		<div class="grid_item3">		
			<input type="submit" class="form-control submit" value="원래대로" onclick="reset_form('#update-form')">
		</div>
	</div>
<!-- ================================= 상세보기 폼 ================================== -->
   <div class="container">
      <div class="row">
			<h1>직원 상세</h1>
			<div class="contact-form">
				<form id="update-form" method="post" action="${path }/api/v1/update/${empInfo.empNum }">
					<h3>필수 정보</h3>
<!-- --------------------------------- 필수정보 좌측------------------------------------- -->				
				    <div class="wow fadeInUp col-md-6 col-sm-12">
				    	<p>사원번호</p>
				    	<input id= "empNum" name="empNum" type="text" class="form-control" value="${empInfo.empNum }" readonly onfocus="this.blur()">
						<p>성명</p>
						<input id="name" name="name" type="text" class="form-control" value="${empInfo.name }" readonly onfocus="this.blur()">
						<p>주민등록번호</p>
						<input id="ssm" name="ssm" type="text" class="form-control" value="${empInfo.ssm }" readonly onfocus="this.blur()">					
    					<p>휴대폰</p>
						<input id="phoneNum" name="phoneNum" type="text" class="form-control" placeholder="전화번호(이동전화) (-없이 입력)" value="${empInfo.phoneNum }" maxlength="11" required>
    					<p>주소</p>
						<input id="addr" name="addr" type="text" class="form-control" value="${empInfo.addr }" maxlength="20" onclick='execDaumAddr()' readonly required>
						<input id="addrDetail" name="addrDetail" type="text" class="form-control" value="${empInfo.addrDetail }" placeholder="상세 주소(있는 경우)" maxlength="20">
					</div>	
<!-- --------------------------------- 필수정보 우측------------------------------------- -->								
					<div class="wow fadeInUp col-md-6 col-sm-12">
						<p>성별</p>
						<select name="gender" style="padding: 1em .5em; width: 100%">
    						<option value="1" <c:if test="${empInfo.gender eq '1'}">selected</c:if>>남</option>
    						<option value="2" <c:if test="${empInfo.gender eq '2'}">selected</c:if>>여</option>
    					</select>
						<p>부서명</p>
						<select id="deptNum" name="deptNum" style="padding: 1em .5em;width: 100%;" required>
    						<option value="all">부서명</option>
    						<c:set var="count" value="${fn:length(deptList)}" />
    						<c:forEach items="${deptList }" var="dept" varStatus="status" >
    							<option value="${dept.deptNum }" <c:if test="${empInfo.deptNum eq dept.deptNum}">selected</c:if>>${dept.deptName}</option>
							</c:forEach>				
						</select>
						<p>직급</p>
						<input id="rank" name="rank" type="text" class="form-control" value="${empInfo.rank }" maxlength="4" required>
						<p>입사일자</p>
						<input id="joinDate" name="joinDate" type="date" class="form-control" value="${empInfo.joinDate }" required>					
						
						<p>비밀번호 수정 ( 숫자,영어 대소문자 4~12자리 )</p>
						<input id="passwd" name="passwd" type="password" class="form-control" placeholder="비밀번호" maxlength="12">
						<input id="passwdVal" name="passwdVal" type="password" class="form-control" placeholder="비밀번호 재입력" maxlength="12">
						<input id="passwdOrg" name="passwdOrg" type="hidden" class="form-control" value="${empInfo.passwd }">
					</div>
					<p>______________________________________________________________________</p>
					<h3>선택 정보</h3>
<!-- --------------------------------- 선택정보 좌측------------------------------------- -->		
					<div class="wow fadeInUp col-md-6 col-sm-12">
				    	<p>취미</p>
						<input id="hobby" name="hobby" type="text" class="form-control" value="${empInfo.hobby }" placeholder="취미" maxlength="6">
						<p>학점</p>
						<input id="grade" name="grade" type="text" class="form-control" value="${empInfo.grade }" placeholder="학점" maxlength="4">
					</div>
<!-- --------------------------------- 선택정보 우측------------------------------------- -->		
					<div class="wow fadeInUp col-md-6 col-sm-12">					
    					<p>전화번호(자택)</p>
						<input id="homeNum" name="homeNum" type="text" class="form-control" value="${empInfo.homeNum }" placeholder="전화번호(자택) (-없이 입력)" maxlength="12">
    				</div>
<!-- --------------------------------- 수정버튼------------------------------------- -->			
    		</form>
    		<div class="grid-item">
				<input id= "btn-update" type="submit" class="form-control submit" value="수정하기" onclick="validateForUpdate()">
			</div>
			</div>
      </div>
   </div>
</section>

<!-- =================================================================== -->
<%@ include file="/resources/static/common/footer.jsp" %>
</body>
</html>