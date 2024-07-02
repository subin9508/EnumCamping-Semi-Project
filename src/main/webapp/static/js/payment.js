/**
 * /user/myPage.jsp에 포함.
 */

 
 
 const btnPayment = document.querySelector('button#btnPayment');
 
 // 결제하기 버튼의 클릭 이벤트 리스너:
 btnPayment.addEventListener('click', () => {
	
	var IMP = window.IMP;
	IMP.init('imp45647302'); // 내 식별코드
	IMP.request_pay({
		pg: 'html5_inicis', // PG사
		pay_method: 'card', // 결제방식
		name: '바베큐 세트',
		amount: '100', // 결제 금액
		buyer_email: 'test@test.com',
		buyer_name: '홍길동',
		buyer_tel: '010-1234-5678',
		
	},
	function (rsp) {
		console.log(rsp);
		if(rsp.success) { // 백엔드 api에 결제완료 처리
			var msg = '결제가 완료되었습니다.';
			alert(msg);
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
	}
	)
 });