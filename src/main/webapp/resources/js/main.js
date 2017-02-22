function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var pno = getParameterByName('pNo');
var bno = getParameterByName('bNo');
var email = getParameterByName('email');

var config = {
    apiKey: "AIzaSyDLSpBShLQKwdj0i4jQFYI9AjP7kKpB7nU",
    authDomain: "test-7f6b6.firebaseapp.com",
    databaseURL: "https://test-7f6b6.firebaseio.com",
    storageBucket: "test-7f6b6.appspot.com",
    messagingSenderId: "1019331388800"
  };
  firebase.initializeApp(config);


$('#login').click(function(){
	var provider = new firebase.auth.GoogleAuthProvider();
		firebase.auth().signInWithPopup(provider);
		
	firebase.auth().onAuthStateChanged(function(user) {
		if(user){
			location.href='/sign?email=' + user.email;
		}
	})
})

$('#signout').click(function(){
	firebase.auth().signOut();
	location.href="/"
})

function writeUserInfo(userId, name, email, imageUrl){
	var infoData = {
			name: name,
			email: email,
			imageUrl: imageUrl
	};
	
	var newInfoKey = firebase.database().ref().child('users').push().key;
	
	var updates = {};
	updates['/users/' + userId] = infoData;
	
	return firebase.database().ref().update(updates);
}

/* register */
$(document).ready(function(){
	firebase.auth().onAuthStateChanged(function(user){
		if(user){
			$("#userImg").attr('src', user.photoURL);
			$("#userImg").attr('class', "img-circle");
			$("#userImg").attr('value', user.photoURL);
			$('#name').val(user.displayName);
			$('#email').val(user.email);
			$('#photoURL').hide();
			$('#photoURL').val(user.photoURL);
		}
	})
})

/* 다음 주소 찾기 */
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addr').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}

/* main */
$(document).ready(function(){
	firebase.auth().onAuthStateChanged(function(user){
		if(user){
			$('#user').text(user.email);
			$('#userImg').attr('src', user.photoURL);
			$('#username').text(user.displayName);
			$('#dropUserImg1').attr('src', user.photoURL);
			$('#dropUsername').text(user.displayName);
			$('#sideuserImg').attr('src', user.photoURL);
			$('#sideusername').text(user.displayName);
			$('#sideEmail').text(user.email);
			$('#email').val(user.email);
			$('#userEmail').val(user.email);
		}
		
	})

	$('input[type="checkbox"]').click(function(){
		if($(this).checked){
			$('#coin1').val(parseInt($('#coin4').text()) - $('input[type="checkbox"]:checked').length * parseInt($('#coin').val()));
			if(parseInt($('#coin1').text()) < 0){
				alert("코인이 부족합니다.");
			}
		}
	});
	
	$('#coin').keyup(function(){
		$('#coin1').val(parseInt($('#coin4').text()) - $('input[type="checkbox"]:checked').length * parseInt($('#coin').val()));
		if(parseInt($('#coin1').val()) < 0){
			alert("코인이 부족합니다.");
		}
	})
	
	$('#exchange2').click(function(){
		alert("코인을 보냈습니다.");
	})
})

/* taskWrite */
$(document).ready(function(){
	$('#startDateForm').hide();
	$('#endDateForm').hide();
	$('#pDateForm').hide();
	
	var today = new Date();
	var month = today.getMonth() + 1;
	var year = today.getFullYear();
	var day = today.getDate();
	
	$('#today').val(year + '-' + month + '-' + day);
	$('#userSel').change(function(){
		console.log($(this).children());
		$('#userBox').text($('#userBox').val() + $(this).text() + "(" + $(this).val() + ")");
	})
	
	if(pno != ''){
		$('#startDateForm').show();
		$('#endDateForm').show();
		$('#pDateForm').show();
		$('#select').remove();
	}	
	
	$('#projectName').change(function(){
		if(pno == ''){
			location.search += "&pNo=" + $(this).val();
		} else {
			location.search = "?email=" + email + "&pNo=" + $(this).val();
		}
	})
	
	$('#toaNo').change(function(){
		if(tno == ''){
			location.search += "&tNo=" + $(this).val();
		} else {
			location.search = "?email=" + email + ""
		}
	})
	
	$('#pText').focus(function(){
		$('#startDate').val();
	})
	
	$('#endDate').focusout(function(){
		var end = $('#endDate').val();
	})
})

/* admit Page */
$(document).ready(function(){
	$('#registerToaDate').hide();
	var today = new Date();
	var month = today.getMonth() + 1;
	var year = today.getFullYear();
	var day = today.getDate();
	
	$('#projectTbl .project').click(function(){
		$('#projectNo').attr('value', $(this).attr('value'));
		$('#projectNo').text($(this).attr('value'));
	})
	
	$('#toaInput').focus(function(){
		if($('#projectNo').val() == ''){
            swal({
            	title: "",
                text: "프로젝트를 선택해주세요."
            });
			$('#toaInput').focusout();
		}
	})
})

/* board List */
$(document).ready(function(){
	if($('.boardStatus').text() == '대기'){
		$('.boardStatus').addClass('label label-default');
	} else if($('.boardStatus').text() == '진행중'){
		$('.boardStatus').addClass('label label-primary');
	} else if($('.boardStatus').text() == '완료'){
		$('.boardStatus').addClass('label label-success');
	} else if($('.boardStatus').text() == '보류'){
		$('.boardStatus').addClass('label label-danger');
	}
	
	$(".boardList").click(function(){
		location.href = "/viewTask?email=" + firebase.auth().currentUser.email + "&bNo=" + $(this).attr('value');
	})
	
	
	$('#searchBtn').click(function(){
		var type = $('#searchP').val();
		var keyword = $('#searchProject').val();
		location.search = "?email=" + email + "&type=" + type + "&keyword=" + keyword;
	})
})

/* activity Write */
$(document).ready(function(){
	var today = new Date();
	var month = today.getMonth() + 1;
	var year = today.getFullYear();
	var day = today.getDate();
	
	$('#todayA').val(year + "/" + month + "/" + day);
	$('#cancel').click(function() {
		var result = confirm('글 작성을 취소하시겠습니까?');
		if(result) {
			//yes
			location.replace('/task?email=' + firebase.auth().currentUser.email);
		} else { 
			//no 
		} 
	})
});

/* view Task */
$(document).ready(function(){
	$(".activityList").click(function(){
		location.href = "/viewActivity?email=" + firebase.auth().currentUser.email + "&bNo=" + bno + "&aNo=" + $(this).attr('value');
	})
})

/* Project List */
$(document).ready(function(){
	$(".projectList").click(function(){
		location.href = "/projectView?email=" + firebase.auth().currentUser.email + "&bNo=" + $(this).attr('value');
	})
	var pieChartDataSource = [
	    { category: '진행중', value: $('#ongoing').attr('value') },
	    { category: '대기', value: $('#standby').attr('value') },
	    { category: '완료', value: $('#c​omplete').attr('value') },
	    { category: '보류', value: $('#defer').attr('value') },
	    { category: '기간초과', value: $('#excess').attr('value') }
	];

	$(function () {
	    $("#pie").dxPieChart({
	    	type: "doughnut",
	    	palette: "Harmony Light",
	        dataSource: pieChartDataSource,
	        series: {
	        	palette: "Harmony Light",
	        	type: "doughnut",
	            argumentField: 'category',
	            valueField: 'value'
	        },
	        loadingIndicator:{
	        	show:true
	        },
	        legend: {
	            horizontalAlignment: 'center',
	            verticalAlignment: 'bottom'
	        },
	        pathModified: true,
	        tooltip: {
	            enabled: true,
	            customizeTooltip: function (value) {
	                return { text: value.valueText };
	            }
	        }
	    });
	});
	
	var dataSource = [];
	for(var i=0; i<$('.activityList').size(); i++){
		var date1 = $('.activityList').eq(i).children('td').eq(1).attr('value');
		var date2 = date1.split('-');
		var date3 = date2[0].split('/');
		var date4 = date2[1].split('/');
		
		dataSource.push({
			date: $('.activityList').eq(i).children('td').eq(0).attr('value'),
			aVal1: new Date(date3[0], date3[1]-1, date3[2]),
			aVal2: new Date(date4[0], date4[1]-1, date4[2])
		})
	}
	
	$(function(){
	    $("#chart").dxChart({
	        palette: "violet",
//	        rotated: true,
	        dataSource: dataSource,
	        commonSeriesSettings: {
	        	argumentField: "date",
	            type: "rangeBar"      
	        },
	        loadingIndicator:{
	        	show:true
	        },
	        series: [
	            { 
	                rangeValue1Field: "aVal1", 
	                rangeValue2Field: "aVal2"
	            }
	        ],
	        "export": {
	            enabled: true
	        },
	        legend: {
	        	visible: false
	        },
	        tooltip: {
	            enabled: true,
	            customizeTooltip: function (value) {
	            	var day = value.valueText;
	            	var day1 = day.split('-');
	            	var day2 = day1[0].split('00');
	            	var day3 = day1[1].split('00');
	            	
	                return { text: day2[0] + "-" + day3[0] };
	            }
	        }
	    });
	});
})