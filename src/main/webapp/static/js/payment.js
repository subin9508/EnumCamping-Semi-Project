document.addEventListener('DOMContentLoaded', function() {
    const btnPayment = document.querySelector('button#btnPayment');
	
    btnPayment.addEventListener('click', async () => { // 비동기적 함수 
        const resKey = document.querySelector("input[name=resKey]").value;
        
        console.log(resKey);
        if (!resKey) {
            alert("예약 키 값이 있어야 합니다.");
            return;
        }

        try {
            // 서버에서 결제에 필요한 정보를 가져옵니다.
            const paymentInfo = await getPaymentInfo(resKey);

            const IMP = window.IMP;
            IMP.init('imp45647302'); // 가맹점 식별코드 설정

            IMP.request_pay({ // 결제 요청을 보냄.
                pg: 'kakaopay',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: paymentInfo.name,
                amount: paymentInfo.amount,
                buyer_email: paymentInfo.email,
                buyer_name: paymentInfo.buyerName,
                buyer_tel: paymentInfo.phoneNumber
            }, async function(rsp) { // 비동기적 함수, 반환되는 값을 rsp에 넣는다.
                console.log(rsp);

                if (rsp.success) { // 반환 값이 success이면 await 메서드를 실행하여 유저에게 결제 완료 알림.
                    try {
                        await verifyAndSavePayInfo(rsp.imp_uid, resKey);
                        alert('결제가 완료되었습니다.');
                    } catch (error) {
                        console.error("결제 검증 및 저장 중 오류:", error);
                        alert('결제 검증 중 오류가 발생했습니다. 고객센터에 문의해 주세요.');
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
    const getPaymentInfo = async (resKey) => { 
        try { // resKey를 매개로 서버에 GET 요청을 보내 결제 정보를 가져옴.
            const response = await $.ajax({ 
                type: "GET",
                url: "/semiproject/reservation/paymentInfo?resKey=" + resKey, // 요청 URL, resKey를 쿼리 파라미터로 전달.
                dataType: 'json'
            });
            // 성공적으로 데이터를 받아오면 응답 반환.
            return response;
        } catch (error) { // 오류 발생 시 콘솔에 에러 로그 출력, 에러 다시 throw
            console.error("결제 정보 조회 실패:", error);
            throw error;
        }
    };

    // 결제 검증 후 db 업데이트
    const verifyAndSavePayInfo = async (imp_uid, resKey) => {
        try {// imp_uid와 resKey를 이용해 서버에 POST 요청을 보내 결제 정보 검증 및 저장.
            const response = await $.ajax({
                type: "POST",
                url: "/semiproject/reservation/verifyIamport/" + imp_uid + "?resKey=" + resKey
              
            });

            console.log(response);

            if (response.result === "SUCCESS") { // 결제 정보 성공 응답을 받으면, 결제 완료창으로 넘어감.
                location.href = "/semiproject/reservation/succeeded/" + response.data.orderNum;
            } else {
                throw new Error("서버에서 성공 응답을 받지 못했습니다.");
            }
        } catch (error) {
            console.error("결제 정보 저장 실패:", error);
            throw error;
        }
    };
});
