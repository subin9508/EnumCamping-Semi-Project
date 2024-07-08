document.addEventListener('DOMContentLoaded', function() {
    const btnPayment = document.querySelector('button#btnPayment');
	
    btnPayment.addEventListener('click', async () => { // 비동기적 함수 
        const resId = document.querySelector("input[name=resId]").value;
        
        console.log(resId);
        if (!resId) {
            alert("예약 아이디 값이 있어야 합니다.");
            return;
        }

        try {
            // 서버에서 결제에 필요한 정보를 가져옵니다. (예약 아이디를 매개로)
            const paymentInfo = await getPaymentInfo(resId);

            const IMP = window.IMP;
            IMP.init('imp45647302'); // 가맹점 식별코드 설정

            IMP.request_pay({ // 결제 요청을 보냄.
                pg: 'kakaopay',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: paymentInfo.name, // 상품명
                amount: paymentInfo.amount, // 결제 금액
                buyer_email: paymentInfo.email,
                buyer_name: paymentInfo.buyerName,
                buyer_tel: paymentInfo.phoneNumber
            }, async function(rsp) { // 비동기적 함수, 반환되는 값을 rsp에 넣는다.
                console.log(rsp);
				
				// 결제 성공 시 처리 로직
                if (rsp.success) { // 반환 값이 success이면 await 메서드를 실행하여 유저에게 결제 완료 알림.
                    console.log("결제 성공, 검증 시작");
                    try {
                       const result = await verifyAndSavePayInfo(rsp.imp_uid, resId);
                        console.log("검증 결과:", result);
                        if(result && (result.result === "SUCCESS" || result.status === "success")) {
                        alert('결제가 완료되었습니다.');
                        location.href = "/semiproject/reservation/succeeded/" + result.orderNum;
                        } else {
							throw new Error("서버 검증 실패");
						}
                    } catch (error) {
                        console.error("결제 검증 및 저장 중 오류:", error, error.stack);
                        alert('결제 검증 중 오류가 발생했습니다. 오류 내용: ' + error.message);
                    }
                } else {
                    alert('결제에 실패했습니다. 다시 시도해 주세요.');
                }
            });
        } catch (error) {
            console.error("결제 정보 조회 중 오류:", error);
            alert('결제 정보를 가져오는 중 오류가 발생했습니다. 다시 시도해 주세요.');
        }
    })

    // 결제정보를 서버에서 가져오는 비동기 함수
    const getPaymentInfo = async (resId) => { 
        try { // resId를 매개로 서버에 GET 요청을 보내 결제 정보를 가져옴.
            const response = await $.ajax({ 
                type: "GET",
                url: "/semiproject/reservation/paymentInfo?resId=" + resId, // 요청 URL, resId를 쿼리 파라미터로 전달.
                dataType: 'json'
            });
            // 성공적으로 데이터를 받아오면 응답 반환.
            return response;
        } catch (error) { // 오류 발생 시 콘솔에 에러 로그 출력, 에러 다시 throw
            console.error("결제 정보 조회 실패:", error);
            throw error;
        }
    };

  // verifyAndSavePayInfo 함수 설정
    const verifyAndSavePayInfo = async (imp_uid, resId) => {
        try {// imp_uid와 resId를 이용해 서버에 POST 요청을 보내 결제 정보 검증 및 저장.
            const response = await $.ajax({
                type: "POST",
                url: "/semiproject/reservation/verifyIamport/" + imp_uid + "?resId=" + resId
              
            });
            console.log("서버 응답:", response);
             
            if (response.status === 200 && response.data && response.data.result === "SUCCESS") { 
                return response.data; // 성공 시 data 객체 반환
               // location.href = "/semiproject/reservation/succeeded/" + response.data.orderNum;
            } else {
                throw new Error("서버 응답이 예상과 다릅니다: " + JSON.stringify(response));
            }
            	
        } catch (error) {
            console.error("결제 정보 저장 실패:", error.message, error.stack);
            throw error;
        }
    };
});
