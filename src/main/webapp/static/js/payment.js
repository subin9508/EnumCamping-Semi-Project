document.addEventListener('DOMContentLoaded', function() {
    const btnPayment = document.querySelector('button#btnPayment');
    
    btnPayment.addEventListener('click', handlePaymentClick);

    async function handlePaymentClick() {
        const resId = document.querySelector("input[name=resId]").value;
        
        console.log(resId);
        if (!resId) {
            alert("예약 아이디 값이 있어야 합니다.");
            return;
        }

        try {
            const paymentInfo = await getPaymentInfo(resId);
            console.log("결제 금액 확인",paymentInfo.amount);
            requestPayment(paymentInfo, resId);
        } catch (error) {
            console.error("결제 정보 조회 중 오류:", error);
            alert('결제 정보를 가져오는 중 오류가 발생했습니다. 다시 시도해 주세요.');
        }
    }

    function requestPayment(paymentInfo, resId) {
        const IMP = window.IMP;
        IMP.init('imp53143455');

        IMP.request_pay({
            pg: 'html5_inicis',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: paymentInfo.name,
            amount: paymentInfo.amount,
            buyer_email: paymentInfo.email,
            buyer_name: paymentInfo.buyerName,
            buyer_tel: paymentInfo.phoneNumber
        }, function(rsp) {
            handlePaymentResponse(rsp, resId);
        });
    }

    async function handlePaymentResponse(rsp, resId) {
        console.log('Payment Response:', rsp);
        if (rsp.success) {
            console.log("결제 성공, 검증 시작");
            try {
                const result = await verifyAndSavePayInfo(rsp.imp_uid, resId);
                console.log("검증 결과:", result);
                if (result && (result.status === "paid")) {
                    alert('결제가 완료되었습니다.');
                    const orderNum = result.merchant_uid || (result.payment && result.payment.merchantUid) || 'unknown';
                    console.log("이동할 주문번호:", orderNum);
                    window.location.href = `/semiproject/reservation/succeeded/${orderNum}`;
                } else {
                    throw new Error("서버 검증 실패" + (result.fail_reason || "알 수 없는 오류"));
                }
            } catch (error) {
                console.error("결제 검증 및 저장 중 오류:", error);
                alert('결제 검증 중 오류가 발생했습니다. 오류 내용: ' + error.message);
            }
        } else {
            console.log('Payment Failed:', rsp);
            alert('결제에 실패했습니다. 다시 시도해 주세요.');
        }
    }

    async function getPaymentInfo(resId) {
        try {
            const response = await $.ajax({
                type: "GET",
                url: "/semiproject/reservation/paymentInfo?resId=" + resId,
                dataType: 'json'
            });
            return response;
        } catch (error) {
            console.error("결제 정보 조회 실패:", error);
            throw error;
        }
    }

    async function verifyAndSavePayInfo(imp_uid, resId) {
        try {
            const response = await $.ajax({
                type: "POST",
                url: "/semiproject/reservation/verifyIamport/" + imp_uid + "?resId=" + resId,
                dataType: 'json'
            });
            console.log("서버 응답:", response);
            return response;
            
            
        } catch (error) {
            console.error("결제 정보 저장 실패:", error);
            throw error;
        }
    }
});