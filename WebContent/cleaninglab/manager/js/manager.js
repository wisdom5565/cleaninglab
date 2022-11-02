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
	var emailTag = joinForm.manageremail;
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
	if (resultTag.innerHTML != "사용할 수 있는 아이디입니다!") {
		alert("중복된 이메일이 있습니다!");
		emailTag.focus();
		return false;
	}

	var pwTag = joinForm.managerpw;
	var pw_reTag = joinForm.managerpw_re;

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

	var nameTag = joinForm.managername;
	if (nameTag.value == "") {
		alert("이름을 입력해주세요!");
		nameTag.focus();
		return false;
	}
	var birthTag = joinForm.managerbirth;
	if (birthTag.value == "") {
		alert("주민등록번호 앞자리를 입력해 주세요!");
		birthTag.focus();
		return false;
	}
	var genderTag = joinForm.managergender;
	if (genderTag.value == "") {
		alert("주민등록번호 뒷자리 하나를 입력해 주세요!");
		genderTag.focus();
		return false;
	}
	var gender = parseInt(genderTag.value);
	if (gender == 1 || gender == 3) {
		alert("여성분들만 가입이 가능합니다!");
		return false;
	}

	// 나이계산함수 호출
	var age = calcAge();

	if (age < 30) {
		alert("30세 이상부터 가입이 가능합니다!");
		return false;
	}
	if (age > 67) {
		alert("67세 이하까지 가입이 가능합니다!");
		return false;
	}

	var phoneTag = joinForm.managerphone;
	if (phoneTag.value == "") {
		alert("핸드폰 번호를 입력해 주세요!");
		phoneTag.focus();
		return false;
	}
	var phone_reg = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
	if (!phone_reg.test(phoneTag.value)) {
		alert("핸드폰 번호을 양식에 맞춰서 작성 해 주세요!");
		phoneTag.focus();
		return false;
	}
	var bankTag = joinForm.managerbank;
	if (bankTag.value == "") {
		alert("은행을 입력해 주세요!");
		bankTag.focus();
		return false;
	}
	var accountTag = joinForm.manageraccount;
	if (accountTag.value == "") {
		alert("계좌번호를 입력해주세요!");
		accountTag.focus();
		return false;
	}
	var account_reg = /[0-9,\-]{3,6}\-[0-9,\-]{2,6}\-[0-9,\-]/;
	if (!account_reg.test(accountTag.value)) {
		alert("계좌번호를 양식에 맞춰서 작성 해 주세요!")
		accountTag.focus();
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

	return true;
}
// 나이계산함수
function calcAge() {
	var birth = document.getElementById("managerbirth").value;
	var gender = document.getElementById("managergender").value;
	var tmpAge = 0; // 임시나이

	var current = new Date(); // 날짜 Object 생성
	var year = current.getFullYear(); // 현재년도
	var month = (current.getMonth() + 1); // 현재월
	var day = current.getDate(); // 현재일

	if (month < 10)
		month = "0" + month; // 현재 월이 10보다 작을경우 '0' 문자 합한다
	if (day < 10)
		day = "0" + day; // 현재 일이 10보다 작을경우 '0' 문자 합한다

	var today = year + month + day; // 현재 날짜
	var genType = parseInt(gender);

	if (genType <= 2) {
		tmpAge = year - (1900 + parseInt(birth.substring(0, 2)));
		// 1, 2 일경우, 1900년대생
	} else {
		tmpAge = year - (2000 + parseInt(birth.substring(0, 2)));
		// 3,4일 경우, 2000년대생
	}

	var tmpBirthday = birth.substring(2, 6); // 주민번호 4자리 생일문자 추출
	// 0101
	if (today < (String(year) + tmpBirthday)) {
		tmpAge += 1;
	}

	return tmpAge;
}

var modifyForm = document.modifyForm;
function pwmodify() {
	var pwTag = modifyForm.managerpw;
	var pw_reTag = modifyForm.managerpw_re;

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
	return true;
}
function modifybank() {
	var bankTag = modifyForm.managerbank;
	if (bankTag.value == "") {
		alert("은행을 입력해 주세요!");
		bankTag.focus();
		return false;
	}
	var accountTag = modifyForm.manageraccount;
	if (accountTag.value == "") {
		alert("계좌번호를 입력해주세요!");
		accountTag.focus();
		return false;
	}

	var account_reg = /[0-9,\-]{3,6}\-[0-9,\-]{2,6}\-[0-9,\-]/;
	if (!account_reg.test(accountTag.value)) {
		alert("계좌번호를 양식에 맞춰서 작성 해 주세요!")
		accountTag.focus();
		return false;
	}

	return true
}
function modifyaddr() {
	var zipcodeTag = modifyForm.zipcode;
	if (zipcodeTag.value == "") {
		alert("주소를 입력해주세요!");
		sample6_execDaumPostcode();
		return false;
	}
	var addrdetailTag = modifyForm.addrdetail;
	if (addrdetailTag.value == "") {
		alert("주소를 마저 입력해주세요!");
		addrdetailTag.focus();
		return false;
	}

	return true;
}
function modifyphone() {
	var phoneTag = modifyForm.managerphone;
	if (phoneTag.value == "") {
		alert("핸드폰 번호를 입력해주세요!");
		phoneTag.focus();
		return false;
	}
	var phone_reg = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
	if (!phone_reg.test(phoneTag.value)) {
		alert("핸드폰 번호을 양식에 맞춰서 작성 해 주세요!");
		phoneTag.focus();
		return false;
	}
	return true;
}

function workspacemodify() {
	var newTag = modifyForm.workspace;
	if (newTag.value == "" || replaceTag == "") {
		alert("변경할 근무지를 입력 해 주세요!")
		newTag.focus();
		return false;
	}
	return true;

}
function deleteit() {
	var deleteForm = document.deleteForm;
	var textTag = deleteForm.delete_text;
	if (textTag.value == "") {
		alert("탈퇴 사유를 적어주세요!")
		textTag.focus();
		return false;
	}
	var checkboxTag = deleteForm.checkbox;
	if (!checkboxTag.checked) {
		alert("주의사항을 확인하시고, 아래 동의 버튼을 눌러주세요!")
		return false;
	}
	return true;
}
function checkEmail() {
	var manageremail = document.joinForm.manageremail.value;
	var email_reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (!email_reg.test(manageremail)) {
		alert("이메일 형식에 맞춰서 작성 해 주세요 ! 예)cleanlab17@cleaninglab.com")
		manageremail.focus();
		return false;
	}

	var resultTag = document.getElementById("result");
	var xhr = new XMLHttpRequest();
	// 통신할 곳과의 연결 통로 열기
	xhr.open("GET", cp + "/manager/CheckEmailOk.ma?manageremail="
			+ manageremail, true);

	// xhr의 상태가 변할 때 호출될 함수 미리 설정
	xhr.onreadystatechange = function() {
		if (xhr.readyState == XMLHttpRequest.DONE) {
			if (xhr.status == 200 || xhr.status == 201) {
				let txt = xhr.responseText;
				// 문자열.trim() : 문자열의 양쪽에 있는 공백 제거
				txt = txt.trim();

				if (txt == "O") {
					// 중복체크 통과
					resultTag.innerHTML = "사용할 수 있는 아이디입니다!";
				} else {
					// 중복체크 실패
					resultTag.innerHTML = "이미 존재하는 아이디입니다!";
				}
			}

		}
	}
	// 통신하기
	xhr.send();
}