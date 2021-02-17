<!-- 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	< 메인 페이지 index.jsp >
	- 로그인이 성공하면 LoginController에 의해 들어옵니다.
	- 직원 현황을 표로 볼 수 있습니다
	
	<Navbar>
	- 직원 등록 버튼 : IndexController를 통해 직원 등록 페이지(register.jsp)로 이동합니다.
	- 선택 삭제 버튼 : admin 계정에게만 보이며, 테이블의 체크박스 선택을 통해 회원을 삭제합니다.
					confirm창 응답에 따라 ajax로 선택된 사번 리스트를 EmpController가 처리합니다.
	- 로그아웃 버튼 : LoginController에 의해 로그아웃되어 login페이지로 이동합니다.
	
	< 검색 >
	- 검색 버튼 : 이름 사번 input창과 셀렉트박스의 부서명 선택을 통해 조건 검색을 합니다.
	- 초기화 버튼 : 검색에 관련된 input과 셀렉트 박스를 초기화합니다.(비웁니다)
	
	< 테이블 > 
	- 테이블의 특정 직원 클릭 : IndexController를 통해 상세 페이지로 이동합니다.
		admin 계정이 아닌 경우, 본인의 상세 정보만 열람할 수 있습니다.
	
	< 프로그램 >
	EMS_LIST : 전체 직원 조회
	EMS_SEARCH : 직원 조건 검색
	EMS_DELETE : 직원 삭제

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/static/common/header.jsp" %>
<%@ include file="/resources/static/common/nav.jsp" %>
<!-- =================================== EMP_SEARCH =================================== -->
<div class="grid2">
	<form id="search-form" method="get" action="index">
		<div class="grid_item2">
			<input id="name" name="name" type="text" class="form-control" placeholder="이름" value="${searchName }">
		</div>
		<div class="grid_item2">
			<input id="empNum" name="empNum" type="text" class="form-control" placeholder="사번" value="${searchEmpNum }">
		</div>
					
		<select id="deptNum" name="deptNum" >
    		<option value="">부서명</option>
    		<c:set var="count" value="${fn:length(deptList)}" />
    		<c:forEach items="${deptList }" var="dept" varStatus="status" >
    			<option value="${dept.deptNum }" <c:if test="${searchDeptNum eq dept.deptNum}">selected</c:if>>${dept.deptName}</option>
			</c:forEach>
		</select>

		<div class="grid_button">		
			<input type="submit" class="form-control submit" value="검색">
		</div>
	</form>
		<div class="grid_button">		
			<input type="submit" class="form-control submit" value="초기화" id="btn-reset">
		</div>
</div>

<!-- =================================== EMP_LIST ==================================== -->
<div style="width:85%; height:700px; margin:0 auto; overflow:scroll">
	<table class="table table-bordered table-hover text-center" id="emp_table">
    	<thead>
    		<tr onclick="event.cancelBubble=true;">
        		<th class="text-center"><input type="checkbox" id="chkBx-checkAll"></th>
        		<th class="text-center">순번</th>
        		<th class="text-center">사원번호</th>
        		<th class="text-center">직급</th>
        		<th class="text-center">성명</th>
        		<th class="text-center">주민등록번호</th>
        		<th class="text-center">입사일자</th>
        		<th class="text-center">소속부서</th>
        		<th class="text-center">전화번호(이동전화)</th>
    		</tr>
    	</thead>
    	<c:set var="count" value="${fn:length(empList)}" />
    	<c:forEach items="${empList }" var="emp" varStatus="status" >
    	<tbody>
    		<tr value="${emp.empNum }" style="cursor:pointer;">
    			<td onclick="event.cancelBubble=true;"><input type="checkbox" name="empChkBx" value="${emp.empNum }"></td>
    			<td>${status.index+1 }</td>
    			<td>${emp.empNum }</td>
    			<td>${emp.rank }</td>
    			<td>${emp.name }</td>
    			<td>${emp.ssm }</td>
    			<td>${emp.joinDate }</td>
    			<td><c:forEach items="${deptList }" var="dept" varStatus="status" ><c:if test="${emp.deptNum eq dept.deptNum}">${dept.deptName }</c:if></c:forEach></td>
    			<td>${emp.phoneNum }</td>
    		</tr>
    	</tbody>
    	</c:forEach>
	</table>
</div>
<!-- =================================================================== -->
<%@ include file="/resources/static/common/footer.jsp" %>
</body>
</html>