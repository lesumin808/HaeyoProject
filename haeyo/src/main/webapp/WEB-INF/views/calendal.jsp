<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='resources/packages/core/main.css' rel='stylesheet' />
<link href='resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='resources/packages/timegrid/main.css' rel='stylesheet' />
<link href='resources/packages/list/main.css' rel='stylesheet' />
<script src='resources/packages/core/main.js'></script>
<script src='resources/packages/interaction/main.js'></script>
<script src='resources/packages/daygrid/main.js'></script>
<script src='resources/packages/timegrid/main.js'></script>
<script src='resources/packages/list/main.js'></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//var sales = new Array();
document.addEventListener('DOMContentLoaded', function () {
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      // left: 'prevYear,prev,next,nextYear today',    // 클릭시 전달 한달치 데이터를 가져와야함 
      // center: 'title'
      // right: 'dayGridMonth,dayGridWeek,dayGridDay'
    },
    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
    initialDate: new Date(),
    navLinks: true, // can click day/week names to navigate views
    editable: false,
    dayMaxEvents: true, // allow "more" link when too many events
    events: function (info, successCallback, failureCallback) {
      $.ajax({
        url: "calendal.do",
        data: {"pNo" : ${pNo.pNo}},
        type: 'get',
        success: function(data) {
          console.log('ajax 함수 완료');
         // let result = JSON.parse(data);
          console.log(data);
          var events = [];
          $.each(data, function (index, item) {
            events.push({
            	id: item.rsvNo,
             	title: item.title + "님의 일정",
             	start: item.start
            }); // push end

          }); // each end
          console.log(events);
          successCallback(events);
        }// success end
      });  // ajax end
    }, // event end

  }); // calender end

  calendar.render();
}); // document end

</script>
<style>
html, body {
	overflow: hidden; /* don't do scrollbars */
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar-container {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
</style>
</head>
<body>
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>

</body>
</html>