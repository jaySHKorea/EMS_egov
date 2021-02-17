/**
 * 이벤트 처리 js
 */
$(document).ready(function(){
	/*  index.jsp의 체크박스의 선택된 사원번호 배열 전송
	--------------------------------------------------------*/
	$("#btn-cond-del").on('click',function(){ 

	var chkarr = [];
	var checkbox = $("input[name=empChkBx]:checked");
	var chkstr = "";
  
	// 체크박스 정보 가져오기
	$("input[name=empChkBx]:checked").each(function(i){
		var chk = $(this).val();
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		chkarr.push(chk);
		chkstr += "- "+chk+" "+td.eq(3).text()+" "+td.eq(4).text()+" "+td.eq(7).text()+"\n"
	});
	chkstr += "\n";
	
	// 체크박스에 선택된 직원이 없을 경우
	if ( !chkarr.length ){
		alert("선택된 직원이 없습니다.");
		xhr.abort();
	}
	
	// 체크리스트 삭제 url로 전송
	$.ajax({
        url: "api/v1/delete",
        type: "POST",
        beforeSubmit: del_confirm(chkstr), // confirm 창
        data: {"empChkList":chkarr}, // ex) ['2021001','2021002']
        success: function(data) {
        	alert("삭제가 완료되었습니다.");
        	location.href="index";
        },
        error: function(msg, error) {
        	alert("삭제에 실패했습니다.");
        }
    });   
	});

//========================= index.jsp 클릭 이벤트 ===========================
	/* index.jsp - 회원 테이블 tr 클릭시 detail.jsp로 form(emp_num)값 전송후 이동
	-------------------------------*/
	$("#emp_table").on('click','tr ',function(){
		var empNum = $(this).attr('value');
		
		var form = document.createElement('form');
		form.name = 'empForm';
		form.method = 'get';
		form.action = 'update/'+empNum;
		
		/*
		var input = document.createElement('input');
		input.setAttribute("name","emp_num");
		input.setAttribute("value",empNum);
		input.setAttribute("type","hidden")
		
		form.appendChild(input);
		*/
		document.body.appendChild(form);
		form.submit(); // form 전송
	});

	/*  index.jsp - 초기화 버튼 누를 경우 검색기능란 (이름,사번,부서명) 초기화
	-------------------------------*/
    //btn_reset 을 클릭했을때의 함수
    $( "#btn-reset").on('click',function () {
    	document.getElementById("name").value = "";
    	document.getElementById("empNum").value = "";
    	var sel = document.getElementById("deptNum");
    	sel[0].selected=true;
    });

    /*  index.jsp - table의 th의 체크박스 클릭으로 전체 체크/전체 체크 해제 
	-------------------------------*/
	$("#chkBx-checkAll").on('click',function(){
    //체크 했을때
		if($("#chkBx-checkAll").prop("checked")){
			$("input[name=empChkBx]").prop("checked",true);
    //체크 해제했을때
		}else{
			$("input[name=empChkBx]").prop("checked",false);
		}
	});
});

//========================= functions ============================
/* 폼 초기화 함수 ( register.jsp, detail.jsp )
-------------------------------*/
function reset_form(formname){
	$(formname).each(function() {
		this.reset();
	});
}

/*  직원 삭제시 confirm 창 생성 함수
-------------------------------*/
function del_confirm(chkstr) {
	 if ( confirm(chkstr+"해당 직원을 삭제하시겠습니까?") ) {
		 return true;
	 }
	 else {
		 xhr.abort();
		 return false;
	 }
}

/* 다음 주소  api
-----------------------------------*/
function execDaumAddr(){
	daum.postcode.load(function(){
		new daum.Postcode({
			oncomplete: function(data){

				var fullAddr = '';
				var extraAddr = '';
				
				// 도로명주소
				if ( data.userSelectedType == 'R'){
					fullAddr = data.roadAddress;
				} else { // 지번주소
					fullAddr = data.jibunAddress;
				}
				
				// 도로명주소인경우
				if ( data.userSelectedType == 'R'){
					//법정동명
					if (data.bname !== ''){
						extraAddr += data.bname;
					}
					//건물명
					if (data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ? ', '+data.buildingName : data.buildingName);
					}
					//최종주소
					fullAddr += (extraAddr !== '' ? ' ('+extraAddr +')':'');
				}
				
				// 필드
				document.getElementById("addr").value = fullAddr;
				document.getElementById("addr_detail").focus();
			}
		}).open();
	});
}

//========================= validation ===========================
/*  register.jsp 직원 등록시 상세정보 유효성 검사
-------------------------------*/
function validateForRegister() {
	var re2 = /^[0-9]{10,11}$/ // 전화번호(휴대폰,전화번호) 검사 정규식
	var re3 = /^[가-힣]+$/ // 이름,직급 검사 정규식
	var reSsm = /^[0-9]{13}$/ // 주민번호 검사 정규식
	var ssmArr = new Array(); // 주민번호 유효성 검사용 배열
    var iden = [2,3,4,5,6,7,8,9,2,3,4,5]; // 주민번호 유효성 검사용 값

	//성명
	var name = document.getElementById("name");
	//주민번호
	var ssm = document.getElementById("ssm");
	//휴대폰
	var phone_num = document.getElementById("phoneNum");
	//직급
	var rank = document.getElementById("rank");
	//전화번호(자택)
	var home_num = document.getElementById("homeNum");
	//부서명
	var dept = document.getElementById("deptNum");
	//입사일자
	var join_date = document.getElementById("joinDate");
	//주소
	var addr = document.getElementById("addr");
	
	if(!check(re3,name,"성명란에 한글만 입력해주십시오.")) {
		return false;
	}

	if(!check(reSsm,ssm,"주민등록번호에 13자리 숫자 이외의 문자를 입력할 수 없습니다.")) {
		return false;
	}
	
	/*
    // ------------------ 주민번호 유효성 검사 --------------------
    for (var i=0; i<ssm.value.length ; i++) {
    	ssmArr[i] = ssm.value.charAt(i);
    } 

    var tempSum=0;

    for (var i=0; i<ssm.value.length-1; i++) {
    	tempSum += ssmArr[i] * iden[i];
    }

    if((11-(tempSum%11))%10!=ssmArr[12]) {
    	alert("유효한 주민번호가 아닙니다.");
    	ssm.value = "";
    	ssm.value = "";
    	ssm.focus();
    	return false;
    }*/
		    	
	if(!check(re2,phone_num,"휴대폰 번호는 -없이 숫자만 입력해주십시오.")) {
		return false;
	}
	    
	if(!check(re3,rank,"직급은 한글만 입력해주십시오.")) {
		return false;
	}

	if( home_num.value != "" ){
		if(!check(re2,home_num,"전화번호(자택)은 -없이 숫자만 입력해주십시오.")) {
			return false;
		}
	}
		
	if ( dept[0].selected == true){
		alert("부서를 선택해주십시오.");
		dept.focus();
		return false;
	}
	
	if( join_date.value == ""){
		alert("입사일자를 입력해주십시오.")
		return false;
	}
	
    if( addr.value == "" ) {
    	alert("주소를 입력해주십시오.");
    	return false;
    }
		
	// 취미 / 학점 / 상세주소는 유효성 검사 제외
	//---------------- 모두 유효하면 form 전송 ------------------
	var $form = $('#register-form');
	$form.submit();	
}

/*  detail.jsp 직원 수정시 상세정보 유효성 검사
-------------------------------*/
function validateForUpdate() {
	var re = /^[a-zA-Z0-9]{4,12}$/ // passwd 검사 정규식
	var re2 = /^[0-9]{10,11}$/ // 전화번호(휴대폰,전화번호)
	var re3 = /^[가-힣]+$/ // 이름,직급 유효성 검사
	var reSsm = /^[0-9]{13}$/ // 주민번호 검사 정규식
	
	//passwd
	var passwd = document.getElementById("passwd");
	//passwdVal - 재입력 필드
	var passwdVal = document.getElementById("passwdVal");
	//passOrg - 원래 비밀번호
	var passwdOrg = document.getElementById("passwdOrg");
	//휴대폰
	var phone_num = document.getElementById("phoneNum");
	//직급
	var rank = document.getElementById("rank");
	//전화번호(자택)
	var home_num = document.getElementById("homeNum");
	//부서명
	var dept = document.getElementById("deptNum");
	//주소
	var addr = document.getElementById("addr");
	
	if( passwd.value != "" ){ // 비밀번호를 입력했을 때
		if ( passwd.value == passwdVal.value ){ // 비밀번호와 비밀번호 재입력 필드가 일치할 때
			if (!check(re,passwd,"비밀번호는 4~12자리의 영어 대소문자와 숫자만 입력할 수 있습니다.")) {
			    passwdVal.value = "";
				return false;
			}
		}else{ // 재입력 필드와 값이 다를 때
		    passwd.value = "";
		    passwdVal.value = "";
		    passwd.focus();
			alert("비밀번호와 재입력 필드가 일치하지 않습니다.");
			return false;
		}
	}
	else if ( passwdVal.value != ""){ // 비밀번호는 입력하지 않고 재입력 필드만 입력했을 때
	    passwdVal.value = "";
	    passwd.focus();
		alert("비밀번호와 재입력 필드를 모두 입력해 주십시오");
		return false;
	}
	else{ // 둘다 비었을때 - 원래 비밀번호로 그대로
		document.getElementById("passwd").value = passwdOrg.value;
	}
	
    if(!check(re2,phone_num,"휴대폰 번호는 -없이 숫자만 입력해주십시오.")) {
    	return false;
    }
    
    if(!check(re3,rank,"직급은 한글만 입력해주십시오.")) {
    	return false;
    }

    if(home_num.value != "")
    	if(!check(re2,home_num,"전화번호(자택)은 -없이 숫자만 입력해주십시오.")) {
    	return false;
    }
    
	if ( dept[0].selected == true){
    	alert("부서를 선택해주십시오.");
        dept.focus();
        return false;
    }
	
    if( addr.value == "" ) {
    	alert("주소를 입력해주십시오.");
    	return false;
    }

	
    // 취미/학점/상세주소는 유효성 검사 제외
	//---------------- 모두 유효하면 form 전송 ------------------
	var $form = $('#update-form');
	$form.submit();
}

/* input값 value가 re(정규식)에 부합하는지 체크
 -----------------------------------*/
function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
}