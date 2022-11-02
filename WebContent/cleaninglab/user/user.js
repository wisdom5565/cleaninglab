function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
						// 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
}

function sendit() {
	var joinForm = document.joinForm;
	var emailTag = joinForm.useremail;
	var resultTag = document.getElementById("result");
	if (emailTag.value == "") {
		alert("이메일을 입력하세요!");
		emailTag.focus();
		return false;
	}
	if (resultTag.innerHTML == "") {
		alert("이메일 중복검사를 진행해주세요!");
		emailTag.focus();
		return false;
	}
	if (resultTag.innerHTML != "사용할 수 있는 이메일입니다!") {
		alert("중복된 이메일이 있습니다!");
		emailTag.focus();
		return false;
	}

	var pwTag = joinForm.userpw;
	var pw_reTag = joinForm.userpw_re;
	if (pwTag.value == "") {
		alert("비밀번호를 입력해주세요!");
		pwTag.focus();
		return false;
	}

	var pw_reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8}/;
	if (!pw_reg.test(pwTag.value)) {
		alert("비밀번호는 8자 이상, 숫자, 영어, 특수문자를 모두 포함해야 합니다!");
		pwTag.focus();
		return false;
	} else if (/(\w)\1\1\1/.test(pwTag.value)) {
		alert("같은 문자를 4번 이상 사용하실 수 없습니다!")
		pwTag.focus();
		return false;
	} else if (pwTag.value.search(/\s/) != -1) {
		alert("비밀번호는 공백을 포함할 수 없습니다!");
		pwTag.focus()
		return false;
	}
	if (pw_reTag.value == "") {
		alert("비밀번호 확인을 해주세요!");
		pw_reTag.focus();
		return false;
	}
	if (pwTag.value != pw_reTag.value) {
		alert("비밀번호 확인을 다시 해주세요!");
		pwTag.focus();
		return false;
	}
	var nameTag = joinForm.username;
	if (nameTag.value == "") {
		alert("이름을 입력해주세요!");
		nameTag.focus();
		return false;
	}
	var phoneTag = joinForm.userphone;
	var phone_reg = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
	if (!phone_reg.test(phoneTag.value)) {
		alert("핸드폰 번호 양식에 맞춰서 작성해주세요!");
		phoneTag.focus();
		return false;
	}

	var zipcodeTag = joinForm.zipcode;
	if (zipcodeTag.value == "") {
		alert("주소를 입력해주세요!");
		sample6_execDaumPostcode();
		return false;
	}
	var addrdetailTag = joinForm.addrdetail;
	if (addrdetailTag.value == "") {
		alert("주소를 마저 입력해주세요!");
		addrdetailTag.focus();
		return false;
	}
	var areaTag = joinForm.area;
	if (areaTag.value == "") {
		alert("평수를 입력해 주세요!");
		areaTag.focus();
		return false;
	}

	return true;
}
function checkEmail() {
	var useremail = document.joinForm.useremail.value;
	var email_reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (!email_reg.test(useremail)) {
		alert("이메일 형식에 맞춰서 작성 해 주세요 ! 예)cleanlab17@cleaninglab.com")
		manageremail.focus();
		return false;
	}

	var resultTag = document.getElementById("result");
	var xhr = new XMLHttpRequest();
	// 통신할 곳과의 연결 통로 열기
	xhr.open("GET", cp + "/user/CheckEmailOk.us?useremail="
			+ useremail, true);

	// xhr의 상태가 변할 때 호출될 함수 미리 설정
	xhr.onreadystatechange = function() {
		if (xhr.readyState == XMLHttpRequest.DONE) {
			if (xhr.status == 200 || xhr.status == 201) {
				let txt = xhr.responseText;
				// 문자열.trim() : 문자열의 양쪽에 있는 공백 제거
				txt = txt.trim();

				if (txt == "O") {
					// 중복체크 통과
					resultTag.innerHTML = "사용할 수 있는 이메일입니다!";
				} else {
					// 중복체크 실패
					resultTag.innerHTML = "이미 존재하는 이메일입니다!";
				}
			}

		}
	}
	// 통신하기
	xhr.send();
}