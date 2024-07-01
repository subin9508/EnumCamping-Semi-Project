/**
 * sales.jsp 에 포함
 */
function addToCart(item_id) {
    var quantity = parseInt(document.querySelector(`input[name="quantity"][data-item="${item_id}"]`).value);
    // AJAX 요청을 사용하여 서버에 판매 정보를 전송할 수 있음
    // 예를 들어, fetch API를 사용하여 서버에 데이터 전송
    fetch('/add-to-cart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            item_id: item_id,
            quantity: quantity
        })
    }).then(response => {
        if (response.ok) {
            // 장바구니에 추가된 후의 처리 로직
            alert('Added to cart successfully!');
        } else {
            alert('Failed to add to cart.');
        }
    }).catch(error => {
        console.error('Error:', error);
    });
}