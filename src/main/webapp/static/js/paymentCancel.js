/**
 * payment.jsp에 포함.
 */

 
 
// document.addEventListener('DOMContentLoaded', function() {
//    const btnPayCancel = document.querySelector('button#btnPayCancel');
//	
//	
//	    // 서버에서 결제 ID를 가져오는 함수
//    const getPayIdByResId = async (resId) => {
//        try {
//            const response = await $.ajax({
//                type: "GET",
//                url: "/semiproject/user/reservation_details/getPayId/" + resId,
//                dataType: 'json'
//            });
//            return response;
//        } catch (error) {
//            console.error("결제 ID 조회 실패:", error);
//            throw error;
//        }
//    };
//    
////    axios.
////    get(url, data)
////    .then((response) => {})
////    .catch((error) => {});
//
//    // 결제 취소 버튼 이벤트 리스너
//    btnPayCancel.addEventListener('click', async () => {
//        const resId = document.querySelector("input[name=resId]").value;
//
//        if (!resId) {
//            alert("예약 아이디가 필요합니다.");
//            return;
//        }
//
//        try {
//            const payId = await getPayIdByResId(resId); // 서버에서 결제 ID를 가져옴
//            console.log("결제 취소 시도: payId=" + payId);
//
//            if (!payId) {
//                alert("결제 아이디가 필요합니다.");
//                return;
//            }
//
//            if (!confirm("정말로 결제를 취소하시겠습니까?")) {
//                console.log("결제 취소 확인 단계에서 사용자가 취소함");
//                return;  // 사용자가 취소를 확인하지 않은 경우, 함수 실행을 중지합니다.
//            }
//			
//            //const response = await fetch(`/semiproject/user/reservation_details/cancel/${payId}`, {
//            //    method: 'POST'
//            //});
//			
//			const response = await $.ajax({
//                method: "POST",
//                url: `/semiproject/user/reservation_details/cancel/${payId}`
//            }); 
//			
//            const result = await response.text();
//            if (response.ok) {
//                console.log("결제 취소 성공: ", result);
//                alert('결제가 성공적으로 취소되었습니다.');
//                // window.location.reload();  // 페이지를 새로고침하여 최신 상태를 반영합니다.
//            } else {
//                console.error("서버 응답 오류: ", result);
//                throw new Error(result || "결제 취소 처리 중 알 수 없는 오류가 발생했습니다.");
//            }
//        } catch (error) {
//            console.error("결제 취소 실패:", error);
//            alert('결제 취소 중 오류가 발생했습니다: ' + error.message);
//        }
//    });
//});

//-----------------------여기부터 axios the catch 문법
document.addEventListener('DOMContentLoaded', function() {
    const btnPayCancel = document.querySelector('button#btnPayCancel');

	// 서버에서 결제 ID를 가져오는 함수, axios를 사용하여 구현
    const getPayIdByResId = (resId) => {
        return axios.get(`/semiproject/user/reservation_details/getPayId/${resId}`)
            .then(response => response.data)
            .catch(error => {
                console.error("결제 ID 조회 실패:", error);
                throw error;
            });
    };

	
    // 결제 취소 버튼 이벤트 리스너
    btnPayCancel.addEventListener('click', (e) => {
		e.preventDefault();
		
        const resId = document.querySelector("input[name=resId]").value;
        const userId = document.querySelector("input[name=userId]").value; // userId 추가

        if (!resId) {
            alert("예약 아이디가 필요합니다.");
            return;
        }

        getPayIdByResId(resId).then(payId => {
            console.log("결제 취소 시도: payId=" + payId);

            if (!payId) {
                alert("결제 아이디가 필요합니다.");
                return;
            }

            if (!confirm("정말로 결제를 취소하시겠습니까?")) {
                console.log("결제 취소 확인 단계에서 사용자가 취소함");
                return; // 사용자가 취소를 확인하지 않은 경우, 함수 실행을 중지합니다.
            }

            axios.post(`/semiproject/user/reservation_details/cancel/${payId}`)
                .then(response => {
                    console.log("결제 취소 성공: ", response.data);
                    alert('결제가 성공적으로 취소되었습니다.');
                    // 결제 취소 후 예약 내역 페이지로 리다이렉트
                    window.location.href = `/semiproject/user/reservation_list?userId=${encodeURIComponent(userId)}`; 
                    //window.location.reload(); // 페이지를 새로고침하여 최신 상태를 반영합니다.
                })
                .catch(error => {
                    console.error("서버 응답 오류: ", error);
                    alert('결제 취소 중 오류가 발생했습니다: ' + error.message);
                });
        })
        .catch(error => {
            console.error("결제 ID 조회 과정에서 오류 발생:", error);
            alert('결제 ID 조회 중 오류가 발생했습니다: ' + error.message);
        });
    });
   
});