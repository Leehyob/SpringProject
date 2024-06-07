<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
      <meta name="generator" content="Hugo 0.88.1">
      <title>Sidebars · Bootstrap v5.1</title>

      <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">



      <!-- Bootstrap core CSS -->
      <link href="../resources/css/modal.css" rel="stylesheet">
      <link href="../resources/css/bootstrap.min.css" rel="stylesheet">

      <style>

        .bd-placeholder-img {
          font-size: 1.125rem;
          text-anchor: middle;
          -webkit-user-select: none;
          -moz-user-select: none;
          user-select: none;
        }

        @media (min-width: 768px) {
          .bd-placeholder-img-lg {
            font-size: 3.5rem;
          }
        }

        input[type="text"] {
          width: 100px;
          /* 원하는 너비 값으로 조정 */
        }

        /* 높이 조정 */
        input[type="text"] {
          height: 30px;
          /* 원하는 높이 값으로 조정 */
        }
      </style>


      <!-- Custom styles for this template -->
    </head>

    <body>

      <main>
        <h1 class="visually-hidden">Sidebars examples</h1>

        <div class="d-flex flex-column flex-shrink-0 bg-light" style="width: 4.5rem;">
          <a href="/" class="d-block p-3 link-dark text-decoration-none" title="Icon-only" data-bs-toggle="tooltip"
            data-bs-placement="right">
            <svg class="bi" width="40" height="32">
              <use xlink:href="#bootstrap" />
            </svg>
            <span class="visually-hidden">Icon-only</span>
          </a>
          <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
            <li class="nav-item">
              <a href="#link1" class="step1"><br>전체 일정</a>
              <!--  <a href="#" class="nav-link active py-3 border-bottom" aria-current="page" title="Home" data-bs-toggle="tooltip" data-bs-placement="right">
          <svg class="bi" width="24" height="24" role="img" aria-label="Home"><use xlink:href="#home"/></svg>
        </a> 메뉴바 1번째 칸~-->
            </li>
            <li class="dayBtn">
                 <input type="hidden" name="dayCnt" value="${index }">
              <!-- <a href="#" class="nav-link py-3 border-bottom" title="Dashboard" data-bs-toggle="tooltip" data-bs-placement="right">
          <svg class="bi" width="24" height="24" role="img" aria-label="Dashboard"><use xlink:href="#speedometer2"/></svg>
        </a> 메뉴바 2번째 칸-->
            </li>
            <li>
              <a href="#" class="nav-link py-3 border-bottom" title="Products" data-bs-toggle="tooltip"
                data-bs-placement="right">
                <svg class="bi" width="24" height="24" role="img" aria-label="Products">
                  <use xlink:href="#grid" />
                </svg>
              </a>
            </li>
            <li>
              <a href="#" class="nav-link py-3 border-bottom" title="Customers" data-bs-toggle="tooltip"
                data-bs-placement="right">
                <svg class="bi" width="24" height="24" role="img" aria-label="Customers">
                  <use xlink:href="#people-circle" />
                </svg>
              </a>
            </li>
          </ul>
        </div>

          <c:forEach items="${date}" var="day" varStatus="loop">
        <div id="place${loop.index }">
          <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 380px;">
            <span class="fs-5 fw-semibold">${areaname}</span>
            ${loop.index + 1}일차
            ${day.day }  (${day.dayOfWeek })


            <div class="info">
          
            </div>
            <div class="pac-card" id="pac-controls">
            </div>
            <div id="map"></div>
            <div id="infowindow-content">
              <img src="" width="16" height="16" id="plage-icon">
              <span id="place-name" class="title"></span><br>
              <span id="place-address"></span>
            </div>
            <div class="list-group list-group-flush border-bottom scrollarea">
            
            <c:forEach items="${choice }" var="place" begin="${loop.index  * 3}" end="${(loop.index + 1) * 3}">
            
            ${place.contentName }<br>
            ${place.contentTypes }<br>
            ${place.address }<br>
            ${place.playTime }<br>
            이동시간 <input type="number" value="20">분
            </c:forEach>
            <c:forEach items="${sleep }" var="">
            
            </c:forEach>
            </div>
          </div>
        </div>
        </c:forEach>

        <!-- 장소 선택End --><!-- 장소 선택End --><!-- 장소 선택End --><!-- 장소 선택End --><!-- 장소 선택End --><!-- 장소 선택End -->
      <input type="text" name="date" value="${date}">
      <input type="text" name="place" value="${place}">
      <input type="text" name="sleep" value="${sleep}">
      </main>



      <script src="../resources/js/bootstrap.bundle.min.js"></script>

      <script src="../resources/js/sidebars.js"></script>
    </body>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        for (var i = 3; i < 20; i++) {
            $("#place" + i).css("display", "none");
        }
        console.log("페이지 로드");
    });
    function getCoordinates(){
       var params = new URLSearchParams(window.location.search);
       var coordinates = [];
       var index = 1;
       
       while (params.has('lat${index}') && params.has('lng${index}')){
          var lat = parseFloat(params.get('lat${index}'));
          var lng = parseFloat(params.get('lng${index}'));
          coordinates.push({lat : lat, lng : lng});
          index++
       }
       return coordinates;
    }
    
    
      function myMap() {
         var coordinates = getCoordinates();
         if(coordinates.length === 0){
            console.log('No coordinates found');
            return;
         }
        const myLatLng = { lat: 35.8473612313022, lng: 129.218053667485 };

        
        var map = new google.maps.Map(document.getElementById("googleMap"), {
          zoom: 14,
          center: myLatLng
        });

      coordinates.forEach((coord, index) => {
         new google.maps.Marker({
             position: coord,
                map: map,
                label: {
                  text: (index + 1).toString(),
                  fontSize: "30px",
                  fontWeight: "bold",
                  color: '#ffffff',
                  labelOrigin: new google.maps.Point(30, 30)
                }
         })
      })
       
      
      var flightPath = new google.maps.Polyline({
         path : coordinates,
         geodesic : true,
         strokeColor : "#FF0000",
         strokeOpacity : 1.0,
         strokeWeight : 2
      })

      flightPath.setMap(map);

      }

      document.addEventListener('DOMContentLoaded', myMap);
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-nI2V_bsNjQF5ZQ4mlq8o8sr1oZ6bLi0&libraries=places&callback=myMap"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
    	  var dayCnt = $("input[name='dayCnt']").val();
         updateBtn();
         
        function updateBtn(){
          
          console.log(dayCnt);
             var str = "";
          for(var i=0; i< dayCnt; i++){
             str += "<button class='day"+i+"' id='"+ i +"'>"
             str += (i+1) +"일차"
             str += "</button><br>"
             console.log(i);
             
          }
             $(".dayBtn").html(str);
             $(".day").on("click",function(){
                var day = $(this).text();
                var date = 
                console.log(day);
                
                var str2 ="";
                   str2 += "<h2>"+day+"</h2>"
                   str2 += "<br><p>" + info + "</p>"
                   $(".seeInfo").html(str2);
             })
       }
        
        for(var i = 0; i<dayCnt; i++){
        	(function (index) {
        $(".day" + i).on("click", function(){
        
        	var clickedId = $(this).attr('id');
        
        	console.log(clickedId)
        	for(var j = 0; j < dayCnt; j++){
        		if(j === index){
        			console.log("트루문성공")
        			$("#place" + j).css("display", "block");
        		}else{
        		$("#place" + j).css("display", "none");
        	}
        	}	
        	
        })
        
      })(i);
        }
        
      })



</script>    


</html>