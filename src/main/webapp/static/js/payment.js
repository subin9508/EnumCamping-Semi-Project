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
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '바베큐 세트',
		amount: '100', // 결제 금액
		buyer_email: 'test@test.com',
		buyer_name: '홍길동',
		buyer_tel: '010-1234-5678',
		
	}, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/semiproject/verifyIamport/" + rsp.imp_uid, 
	        	dataType: "json"
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	alert("결제 및 결제검증완료");
	        	} else {
	        		alert("결제 실패");
	        	}
	        }).fail(function(jqXHR, textStatus, errorThrown) {
				console.error("응답 정보 로드 실패:", textStatus, errorThrown);
				alert("결제 검증 실패");
			}
	        )
		});
	})