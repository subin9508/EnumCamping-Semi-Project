document.addEventListener('DOMContentLoaded', function() {
    const btnPayment = document.querySelector('button#btnPayment');
	
    btnPayment.addEventListener('click', async () => {
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
            IMP.init('imp45647302');

            IMP.request_pay({
                pg: 'kakaopay',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: paymentInfo.name,
                amount: paymentInfo.amount,
                buyer_email: paymentInfo.email,
                buyer_name: paymentInfo.buyerName,
                buyer_tel: paymentInfo.phoneNumber
            }, async function(rsp) {
                console.log(rsp);

                if (rsp.success) {
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

    // 서버에서 결제 정보를 가져오는 함수
    const getPaymentInfo = async (resKey) => {
        try {
            const response = await $.ajax({
                type: "GET",
                url: "/semiproject/reservation/paymentInfo?resKey=" + resKey,
                dataType: 'json'
            });
            return response;
        } catch (error) {
            console.error("결제 정보 조회 실패:", error);
            throw error;
        }
    };

    // 결제 검증 후 db 업데이트
    const verifyAndSavePayInfo = async (imp_uid, resKey) => {
        try {
            const response = await $.ajax({
                type: "POST",
                url: "/semiproject/reservation/verifyIamport/" + imp_uid,
                data: { resKey: resKey
                		
                		
               
                
                 },
                dataType: 'json'
            });

            console.log(response);

            if (response.result === "SUCCESS") {
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
