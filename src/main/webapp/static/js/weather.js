/**
 * 날씨를. 구해보자!
 */

document.addEventListener('DOMContentLoaded', () => {

    let time;
    let date;
    let dateNow;
    let timeNow;
    findTime();
    const temp = document.querySelector('span#temp');
    const sky = document.querySelector('span#sky');

    let uri = `https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?` +
        `serviceKey=5ZWN2MuLqeW88XkZBweaCIimSDPJ15cJSMOyCDlFAB%2BHctaC45Dff2I6163wf0NhJpwik7uZdeeu81cUMhLnwg%3D%3D` +
        `&pageNo=1&numOfRows=1000&dataType=JSON&base_date=${date}&base_time=${time}&nx=73&ny=128`;


    console.log(uri)
    axios.get(uri)
        .then((response) => {
            //console.log(response);
            function findData(keyword){
                const filteredData = response.data.response.body.items.item.filter(item => 
                    item.category === keyword && item.fcstDate === dateNow && item.fcstTime === timeNow
                );
                //console.log(filteredData);
                const fcstValues = filteredData.map(item => item.fcstValue);
                //console.log(fcstValues);
                return fcstValues;
            }
            const tempNow = findData("TMP");
            temp.innerHTML = tempNow;
            const cloudNow = findData("SKY");
            if (cloudNow == 1){
                sky.innerHTML = "맑음"
            } else if ( cloudNow == 3){
                sky.innerHTML = "구름 많음"
            } else {
                sky.innerHTML = "흐림"
            }
            //맑음(1), 구름많음(3), 흐림(4)
        })
        .catch((error) => console.log(error));

    
    function findTime() {

        const today = new Date();

        let year = today.getFullYear();
        let month = ('0' + (today.getMonth() + 1)).slice(-2);
        let day = ('0' + today.getDate()).slice(-2);
        
        dateNow = year+month+day;
        
        let hour = today.getHours();
        let min = today.getMinutes();
        
        timeNow = hour.toString()+"00";
        
        console.log(dateNow);
        console.log(timeNow);
        
        if (hour<11){
            time = "2300";
            day = ('0' + today.getDate()-1).slice(-2);
        } else if (hour===11) {
            if (min<10){
                time = "2300";
                day = ('0' + today.getDate()-1).slice(-2);
            }
        } else {
            time = "1100";
        }

        date = year + month + day;

        console.log(time);
        console.log(date);

    }
    

});