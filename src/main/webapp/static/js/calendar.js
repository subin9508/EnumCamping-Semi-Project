 /**
  *  /reservation/calendar.jsp에 포함
  */
 
 document.addEventListener("DOMContentLoaded", function() {
        selectedDate = null;
        buildCalendar();
        
        document.getElementById("btnPrevCalendar").addEventListener("click", function(event) {
            prevCalendar();
        });
        
        document.getElementById("nextNextCalendar").addEventListener("click", function(event) {
            nextCalendar();
        });
        
        addAreaRadioEventListeners();
    });

    var toDay = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 toDay에 Date 객체를 넣어줌
    var nowDate = new Date();  // @param 전역 변수, 실제 오늘날짜 고정값
    var selectedDate = null;
    var selectedArea= null;

    function prevCalendar() {
        this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() - 1, toDay.getDate());
        buildCalendar();    // @param 전월 캘린더 출력 요청
    }


    function nextCalendar() {
        this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() + 1, toDay.getDate());
        buildCalendar();    // @param 명월 캘린더 출력 요청
    }

    console.log('Initial selectedDate:', selectedDate);

    function buildCalendar() {

        let doMonth = new Date(toDay.getFullYear(), toDay.getMonth(), 1);
        let lastDate = new Date(toDay.getFullYear(), toDay.getMonth() + 1, 0);

        let tbCalendar = document.querySelector(".scriptCalendar > tbody");

        document.getElementById("calYear").innerText = toDay.getFullYear();                       // @param YYYY월
        document.getElementById("calMonth").innerText = autoLeftPad((toDay.getMonth() + 1), 2);   // @param MM월
        

        // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
        while(tbCalendar.rows.length > 0) {
            tbCalendar.deleteRow(tbCalendar.rows.length - 1);
        }

        // @param 첫번째 개행
        let row = tbCalendar.insertRow();

        // @param 날짜가 표기될 열의 증가값
        let dom = 1;

        // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
        //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
        let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

        // @param 달력 출력
        // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
        for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {

            let column = row.insertCell();

            // @param 평일( 전월일과 익월일의 데이터 제외 )
            if(Math.sign(day) == 1 && lastDate.getDate() >= day) {

                // @param 평일 날짜 데이터 삽입
                column.innerText = autoLeftPad(day, 2);

                // @param 일요일인 경우
                if(dom % 7 == 1) {
                    column.style.color = "#FF4D4D";
                }

                // @param 토요일인 경우
                if(dom % 7 == 0) {
                    column.style.color = "#4D4DFF";
                    row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
                }

            }

            // @param 평일 전월일과 익월일의 데이터 날짜변경
            else {
                let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                column.style.color = "#A9A9A9";
            }

            // @brief   전월, 명월 음영처리
            // @details 현재년과 선택 년도가 같은경우
            if(toDay.getFullYear() == nowDate.getFullYear()) {

                // @details 현재월과 선택월이 같은경우
                if(toDay.getMonth() == nowDate.getMonth()) {

                    // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                    if(nowDate.getDate() > day && Math.sign(day) == 1) {
                        column.style.backgroundColor = "#E5E5E5";
                    }

                    // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                    else if(nowDate.getDate() < day && lastDate.getDate() >= day) {
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }

                    // @details 현재일인 경우
                    else if(nowDate.getDate() == day) {
                        column.style.backgroundColor = "#FFFFE6";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }

                // @details 현재월보다 이전인경우
                } else if(toDay.getMonth() < nowDate.getMonth()) {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#E5E5E5";
                    }
                }

                // @details 현재월보다 이후인경우
                else {
                    if (toDay.getMonth() > nowDate.getMonth()+2){
                        if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#E5E5E5";
                        }
                    } else {
                        if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                            column.style.backgroundColor = "#FFFFFF";
                            column.style.cursor = "pointer";
                            column.onclick = function(){ calendarChoiceDay(this); }
                        }
                        
                    }
                }
            }

            // @details 선택한년도가 현재년도보다 작은경우
            else if(toDay.getFullYear() < nowDate.getFullYear()) {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#E5E5E5";
                }
            }

            // @details 선택한년도가 현재년도보다 큰경우
            else {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
                }
            }
            dom++;
        }
        console.log('buildCalendar - current selectedDate:', selectedDate);
    }

    /**
     * @brief   날짜 선택
     * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
     */
    function calendarChoiceDay(column) {

        // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
        if(document.getElementsByClassName("choiceDay")[0]) {
            
            // @see 금일인 경우
            if(document.getElementById("calMonth").innerText == autoLeftPad((nowDate.getMonth() + 1), 2) 
                && document.getElementsByClassName("choiceDay")[0].innerText == autoLeftPad(toDay.getDate(), 2)) {
                document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFE6";  //오늘날짜
            }
            
            // @see 금일이 아닌 경우
            else {
                document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
            }
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
        }

        // @param 선택일 체크 표시
        column.style.backgroundColor = "#FF9999";

        // @param 선택일 클래스명 변경
        column.classList.add("choiceDay");
        
        // let selectedDate = document.getElementById("calMonth").innerText +"월"+ document.getElementsByClassName("choiceDay")[0].innerHTML+"일";
        document.getElementById('date').innerText = document.getElementById("calMonth").innerText +"월"+ document.getElementsByClassName("choiceDay")[0].innerHTML+"일";
        
        // @details 선택한 날짜에 대한 예약 정보 가져오기
        const year = document.getElementById("calYear").innerText;
        const month = document.getElementById("calMonth").innerText;
        const day = column.innerText;
        selectedDate = `${year}-${autoLeftPad(month, 2)}-${autoLeftPad(day, 2)}`;
        console.log('calendarChoiceDay - selectedDate=', selectedDate);
        
        
        // 선택한 날짜에 대한 예약 정보 가져오기
        getReservations(year, month, day);
        
        // area 라디오 버튼 표시
        const areaCards = document.querySelectorAll('.area-card');
        areaCards.forEach(card => {
            card.style.display = 'block';
        });
        
        // 모든 라디오 버튼 체크 해제
        const radios = document.querySelectorAll('.area-radio');
        radios.forEach(radio => {
            radio.checked = false;
        });
        
        // night 라디오 버튼 숨기기
        const nightCard = document.getElementById('night-card');
        nightCard.style.display = 'none';
        
        // 두 가지 조건이 모두 만족되었는지 확인하여 함수 호출
        if (selectedDate && selectedArea) {
            getReservationNight(year, month, day, selectedArea);
        }
    }
    
    function getReservations(year, month, day) {
        const date = `${year}-${month}-${day}`
        const uri = `../reservation/calendar/${date}`;
        
        axios.get(uri)
            .then(response => {
                console.log(response.data);
                const reservedAreas = response.data || [];
                updateRadioButtons(reservedAreas);
            })
            .catch(error => {
                console.error("There was an error fetching the reservations!", error);
            });
    }
    
    
    
    function updateRadioButtons(reservedAreas) {
        const totalAreas = 20; // 총 구역 수
        console.log(reservedAreas);
        
        for (let i = 1; i <= totalAreas; i++) {
            console.log(`area${i} 처리 시작`)
            const area = document.getElementById(`area${i}_radio`);
            console.log(`area${i}`, area);

            if (area) {
                const card = document.getElementById(`area${i}`);
                
                console.log(`Processing Area ${i}`);
                console.log(`card${i}=`, card);
                
                if (reservedAreas.includes(i)) {
                    console.log(`Area ${i} is reserved`);
                    card.style.display = "none";
                } else {
                    card.style.display = "block";
                }
            }
        }
    }
    
    function addAreaRadioEventListeners() {
        const radios = document.querySelectorAll('.area-radio');
        radios.forEach(radio => {
            radio.addEventListener('change', function() {
                
                if (this.checked) {
                    selectedArea = this.value;
                    console.log('addAreaRadioEventListeners - selectedArea=', selectedArea);
                    console.log('addAreaRadioEventListeners - selectedDate=', selectedDate);
                    
                    const nightCard = document.getElementById('night-card');
                    nightCard.style.display = 'block';
                    
                    // 모든 라디오 버튼 체크 해제
                    const nightRadio = document.querySelectorAll('.night-radio');
                    nightRadio.forEach(radio => {
                        radio.checked = false;
                    });
                    
                    // 두 가지 조건이 모두 만족되었는지 확인하여 함수 호출
                    if (selectedDate && selectedArea) {
                        const year = document.getElementById("calYear").innerText;
                        const month = autoLeftPad(document.getElementById("calMonth").innerText, 2);
                        const day = autoLeftPad(document.getElementsByClassName("choiceDay")[0].innerText, 2);
                        console.log('year, month, day, selectedArea:', year, month, day, selectedArea);  // 로그 추가
                        getReservationNight(year, month, day, selectedArea);
                    }
                }
            });
        });
        
        
    }
    
    function getReservationNight(year, month, day, selectedArea) {
        const date = `${year}-${month}-${day}`;
        const uri = `../reservation/calendar/${date}/${selectedArea}`;

        console.log('getReservationNight()', uri);

        // 여기에서 추가적인 로직을 추가할 수 있습니다.
        // 예: axios 요청을 통해 서버에서 데이터를 가져오기
    }

    /**
     * @brief   숫자 두자릿수( 00 ) 변경
     * @details 자릿수가 한자리인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
     * @param   num     앞에 0을 붙일 숫자 값
     * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
     */
    function autoLeftPad(num, digit) {
        if(String(num).length < digit) {
            num = new Array(digit - String(num).length + 1).join("0") + num;
        }
        return num;
    }