<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>캠핑 소개 페이지</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
</head>

<body>
    <div class="container-fluid">
        <c:set var="pageTitle" value="Home" scope="page" />
        </div>
        <header>
            <div class="logo">Camping Site</div>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="facilities.html">Facilities</a></li>
                    <li><a href="activities.html">Activities</a></li>
                    <li><a href="reservation.html">Reservation</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </nav>
        </header>
    
        <main>
            <section class="banner">
                <h1>ENUM 캠핑장 소개</h1>
                <p>Enjoy Nature Under Moonlight</p>
            </section>
            <section class="facility-section">
                <div class="facility">
                    <img
                        src="https://img.freepik.com/premium-photo/multi-colored-tents-against-cloudy-sky-during-sunny-day_1048944-1271265.jpg?w=996"
                        width="500" height="400" />
                </div>
            </section>

            <style>

.mycontainer {
  width:100%;
  overflow:auto;
}

.mycontainer div {
  width:33%;
  float: none;
}
</style>
          
                
                    <div
                        style="background-color: #FFF4A3;">
                        <span>
                            <h2>Cabins</h2>
                            <p>왜 세로로 안나오고</p>
                            
                        </span>

                        
                    </div>
               
                
                    <div class="mycontainer"
                        style="background-color: #FFC0C7;">
                        <h2>Restrooms & Showers</h2>
                        <p>자꾸 가로로 나오는거야</p>
                    </div>
               
              
                    <div class="mycontainer"
                        style="background-color: #D9EEE1;">
                        <h2>Convenience Store</h2>
                        <p>돌아버리겠네</p>
                    </div>
              
          

        </main>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</body>
</html>