/**
 * succeeded.jsp에 포함
 */

 document.addEventListener("DOMContentLoaded", function() {
	
	// 로컰 스토리지에서 결제 응답 정보를 가져와서 콘솔에 출력
	const paymentResponse = localStorage.getItem('paymentResponse');
	if(paymentResponse) {
		const parsedResponse = JSON.parse(paymentResponse);
		console.log('Retrieved Payment Response: ' , parsedResponse);
	}
	
 });