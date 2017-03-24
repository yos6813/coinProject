function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var pno = getParameterByName('pNo');
var bno = getParameterByName('bNo');
var email = getParameterByName('email');
var ano = getParameterByName('aNo');
var tno = getParameterByName('tNo');
var abno =getParameterByName('abNo');
var page =getParameterByName('page');
var cno =getParameterByName('cNo');
var check =getParameterByName('check');
var wNo = getParameterByName('wNo');
var ctno = getParameterByName('ctNo');
var type = getParameterByName('type');
var keyword = getParameterByName('keyword');
var vNo = getParameterByName('vNo');


  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyDp2pj6WSvpKOtnnRp9NwdTVZAgUalNNa8",
    authDomain: "yeta-cscenter.firebaseapp.com",
    databaseURL: "https://yeta-cscenter.firebaseio.com",
    storageBucket: "yeta-cscenter.appspot.com",
    messagingSenderId: "304577172613"
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
	$('.cancel').click(function() {
		var result = confirm('글 작성을 취소하시겠습니까?');
		if(result) {
			//yes
			location.replace('/task?email=' + email);
		} else { 
			//no 
		} 
	})
	
	$('#startDateForm').hide();
	$('#endDateForm').hide();
	$('#pDateForm').hide();
	
	var today = new Date();
	var month = today.getMonth() + 1;
	var year = today.getFullYear();
	var day = today.getDate();
	
	$('#today').val(year + '.' + month + '.' + day);
	$('#userSel').change(function(){
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
	for(var i=0; i<$('.boardStatus').size(); i++){
		$('.boardStatus').eq(i).addClass("b" + i);
		if($('.b' + i).text()=='진행중'){
			$('.b' + i).addClass('label-primary');
		} else if($('.b' + i).text()=='대기'){
			$('.b' + i).addClass('label-default');
		} else if($('.b' + i).text()=='보류'){
			$('.b' + i).addClass('label-warning');
		} else if($('.b' + i).text()=='완료'){
			$('.b' + i).addClass('label-success');
		}
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
			location.replace('/task?email=' + email);
		} else { 
			//no 
		} 
	})
	
	var date = $('#pDate1').text();
	var pdate = date.split('-');
	 $('#aDate').daterangepicker({
	     format: 'YYYY/MM/DD',
	     minDate: pdate[0],
         maxDate: pdate[1],
	 });
});

/* Project List */
$(document).ready(function(){
	$(".projectList").click(function(){
		location.href = "/projectView?email=" + firebase.auth().currentUser.email + "&bNo=" + $(this).attr('value');
	})

	var dataSource = [];
	for(var i=0; i<$('.activeC').size(); i++){
		var activeDay = $('.activeC').eq(i).children('td').eq(1).text().split('-');
		
		var aday1 = activeDay[1].split('/');
		var active = new Date(aday1[0], aday1[1]-1, aday1[2]);
		var today = new Date();
		var aMs = today.getTime() - active.getTime() ;
		var aDay = Math.floor(aMs / (1000*60*60*24)) ;
		var aDay1;
		if(aDay >= 0){
			aDay1 = "D+" + aDay;
		} else {
			aDay1 = "D" + aDay;
		}
		
		dataSource.push({
			name1: "<p>" + 
				 $('.activeC').eq(i).children('td').eq(2).text() + "</p><br>"
				 + $('.activeC').eq(i).children('td').eq(0).text() + "<br/>" 
				 + aDay1,
			ongoing: parseInt($('.activeC').eq(i).children('td').eq(4).attr('value')),
			standby: parseInt($('.activeC').eq(i).children('td').eq(5).attr('value')),
			complete: parseInt($('.activeC').eq(i).children('td').eq(6).attr('value')),
			defer: parseInt($('.activeC').eq(i).children('td').eq(7).attr('value')),
			no: $('.activeC').eq(i).children('td').eq(0).attr('value')
		})
	}
	
	$(function(){
	    $("#chart").dxChart({
	        dataSource: dataSource,
	        rotated: true,
	        equalBarWidth: false,
	        palette: "Harmony Light",
	        commonSeriesSettings: {
	            argumentField: "name1",
	            type: "stackedBar",
	            tagField: "no"
	        },
	        series: [
	            {valueField: "ongoing", name: "진행중" },
	            {valueField: "standby", name: "대기" },
	            {valueField: "complete", name: "완료" },
	            {valueField: "defer", name: "보류" },
	        ],
	        legend: {
	            verticalAlignment: "bottom",
	            horizontalAlignment: "center",
	            itemTextPosition: 'top'
	        },
	        valueAxis: {
	            position: "right"
	        },
	        "export": {
	            enabled: true
	        },
	        tooltip: {
	            enabled: true,
	            location: "edge",
	            customizeTooltip: function (arg) {
                	 return {
                		 text: arg.seriesName + "/ " + arg.valueText
                	 };
	            }
	        },
	        onPointClick: function (info) {
	        	var clickedPoint = info.target;
	        	location.href="/projectView?email=" + email + "&bNo=" + bno + "&aNo=" + clickedPoint.tag
	        }
	    });
	});
	
	
	for(var i=0; i<$('.tStatus').size(); i++){
		$('.tStatus').eq(i).addClass(i + "");
		if($('.' + i).text()=='진행중'){
			$('.' + i).addClass('label-primary');
		} else if($('.' + i).text()=='대기'){
			$('.' + i).addClass('label-default');
		} else if($('.' + i).text()=='보류'){
			$('.' + i).addClass('label-warning');
		} else if($('.' + i).text()=='완료'){
			$('.' + i).addClass('label-success');
		}
	}
	
	if($('#boardStatus').text()=='진행중'){
		$('#boardStatus').addClass('label-primary');
	} else if($('#boardStatus').text()=='대기'){
		$('#boardStatus').addClass('label-default');
	} else if($('#boardStatus').text()=='보류'){
		$('#boardStatus').addClass('label-warning');
	} else if($('#boardStatus').text()=='완료'){
		$('#boardStatus').addClass('label-success');
	}
	
	$('#totalStatus').attr('value', parseInt($('#ongoing').text()) + parseInt($('#c​omplete').text()) + parseInt($('#standby').text()) + parseInt($('#defer').text()));
	$('#totalStatus').text(parseInt($('#ongoing').text()) + parseInt($('#c​omplete').text()) + parseInt($('#standby').text()) + parseInt($('#defer').text()));
	if(parseInt($('#ongoing').text()) + parseInt($('#c​omplete').text()) + parseInt($('#standby').text()) + parseInt($('#defer').text()) <= 0){
		$('#ongoing').text($('#ongoing').text() + "(0%)"); 
		$('#c​omplete').text($('#c​omplete').text() + "(0%)");
		$('#standby').text($('#standby').text() + "(0%)");
		$('#defer').text($('#defer').text() + "(0%)");
	} else{
		$('#ongoing').text($('#ongoing').text() + "(" + (parseInt($('#ongoing').text())/parseInt($('#totalStatus').text()) * 100) + "%)"); 
		$('#c​omplete').text($('#c​omplete').text() + "(" + (parseInt($('#c​omplete').text())/parseInt($('#totalStatus').text()) * 100) + "%)");
		$('#standby').text($('#standby').text() + "(" + (parseInt($('#standby').text())/parseInt($('#totalStatus').text()) * 100) + "%)");
		$('#defer').text($('#defer').text() + "(" + (parseInt($('#defer').text())/parseInt($('#totalStatus').text()) * 100) + "%)");
	}
	
	var projectDay = $('#projectPday').text().split('-');
	if($('#projectPday').text() != '' && $('#projectPday').text() != undefined){
		var pday1 = projectDay[1].split('/');
		var project = new Date(pday1[0], pday1[1]-1, pday1[2]);
		var today = new Date();
		var btMs = today.getTime() - project.getTime() ;
		var btDay = Math.floor(btMs / (1000*60*60*24)) ;
		
		if(btDay >= 0){
			$('#projectDday').text("D+" + btDay);
			$('#projectDday').addClass('text-danger');
		} else {
			$('#projectDday').text("D" + btDay);
			$('#projectDday').addClass('text-danger');
		}
		
		var pday2 = projectDay[0].split('/');
		var start = new Date(pday2[0], pday2[1]-1, pday2[2]);
		var btMs2 = today.getTime() - start.getTime();
		var btDay2 = Math.floor(btMs2 / (1000*60*60*24));
		
		var btMs3 = project.getTime() - start.getTime();
		var dayGap = Math.floor(btMs3 / (1000*60*60*24));
		
		if(btDay2 < 0){
			btDay2 = 0;
		}
		
		if(btDay2 > dayGap){
			$('#projectPday').append("<strong>(<strong class='text-danger'>" + btDay2 + "</strong>/" + dayGap + ")</strong>");
		} else {
			$('#projectPday').append("<strong>(<strong class='text-success'>" + btDay2 + "</strong>/" + dayGap + ")</strong>");
		}
		
		for(var i=0; i<$('.projectTStatus').size(); i++){
			if($('.projectTStatus').eq(i).text()=='진행중'){
				$('.projectTStatus').eq(i).addClass('label-primary');
			} else if($('.projectTStatus').eq(i).text()=='대기'){
				$('.projectTStatus').eq(i).addClass('label-default');
			} else if($('.projectTStatus').eq(i).text()=='보류'){
				$('.projectTStatus').eq(i).addClass('label-warning');
			} else if($('.projectTStatus').eq(i).text()=='완료'){
				$('.projectTStatus').eq(i).addClass('label-success');
			}
		}
	}
	
	$('#projecPDday').text();
	
	$('.taskC').click(function(){
		location.href = "taskView?email=" + email + "&bNo=" + bno + "&aNo=" + ano + "&tNo=" + $(this).attr('value');
	})
	
	for(var i=0; i<$('.tDateText').size(); i++){
		var tDay = $('.tDateText').eq(i).text().split('-');
		var pday1 = tDay[1].split('/');
		var task = new Date(pday1[0], pday1[1]-1, pday1[2]);
		var today = new Date();
		var bt = today.getTime() - task.getTime() ;
		var bt1 = Math.floor(bt / (1000*60*60*24)) ;
		
		if(bt1 >= 0){
			$('.tDdayText').eq(i).text("D+" + bt1);
			$('.tDdayText').eq(i).addClass('text-danger');
		} else {
			$('.tDdayText').eq(i).text("D" + bt1);
			$('.tDdayText').eq(i).addClass('text-danger');
		}
		
		var pday2 = tDay[0].split('/');
		var start1 = new Date(pday2[0], pday2[1]-1, pday2[2]);
		var btMs2 = today.getTime() - start1.getTime();
		var btDay2 = Math.floor(btMs2 / (1000*60*60*24));
		
		var btMs3 = task.getTime() - start.getTime();
		var dayGap = Math.floor(btMs3 / (1000*60*60*24));
		
		if(btDay2 < 0){
			btDay2 = 0;
		}
		
		if(btDay2 > dayGap){
			$('.dayGap').eq(i).append("(<strong class='text-danger'>" + btDay2 + "</strong>/" + dayGap + ")");
		} else {
			$('.dayGap').eq(i).append("(<strong class='text-success'>" + btDay2 + "</strong>/" + dayGap + ")");
		}
	}
})


/* Create Task */
$(document).ready(function(){
	var date = $('#aDate1').text();
	var pdate = date.split('-');
	 $('#tDate').daterangepicker({
	     format: 'YYYY/MM/DD',
	     minDate: pdate[0],
         maxDate: pdate[1],
	 });
	 
	 $('#activitySelect').change(function(){
		 location.search = "?email=" + email + "&bNo=" + bno + "&aNo=" + $(this).val();
	 })
	 if(ano != undefined && ano != ''){
		 $("#activitySelect").val(ano).prop("selected", true);
		 $('#activitySelect').hide();
		 $('#activityViewBox').show();
	 }
})

/* modify Project */
$(document).ready(function(){
	$("#pStatusSel").val($('#status').val()).prop("selected", true);
	$('#userSel1').val($('#pM1').val()).prop("selected", true);
})

/* modify Activity */
$(document).ready(function(){
	var date = $('#pDate1').text();
	var pdate = date.split('-');
	 $('#projectDate1').daterangepicker({
	     format: 'YYYY/MM/DD',
	     minDate: pdate[0],
         maxDate: pdate[1],
	 });
	
	$("#aStatusSel").val($('#aStatus').val()).prop("selected", true);
	$('#userSel2').val($('#aM1').val()).prop("selected", true);
})

/* modify Task */
$(document).ready(function(){
	var date = $('#aDate1').text();
	var pdate = date.split('-');
	 $('#projectDate2').daterangepicker({
	     format: 'YYYY/MM/DD',
	     minDate: pdate[0],
         maxDate: pdate[1],
	 });
	
	$("#tStatusSel").val($('#tStatus').val()).prop("selected", true);
	$('#userSel3').val($('#tM1').val()).prop("selected", true);
})

/* usage write */
$(document).ready(function(){
	if($('#abstract2').children().size() <= 0){
		$('#abstract2box').hide();
	}
	
	$("#abstract1").val(abno).prop("selected", true);
	var today = new Date();
	var month = today.getMonth() + 1;
	var year = today.getFullYear();
	var day = today.getDate();
	
	$('#usageWriteD').val(year + "/" + month + "/" + day);
	
	$('#abstract1').change(function(){
		location.href = '/usageWrite?email=' + email + '&abNo=' + $(this).val();
	})
	
	$('#totalDate').datepicker({
	    autoclose: true,
	    format: 'yyyy.mm.dd'
	});
	
	$('#totalDateM').datepicker({
	    autoclose: true,
	    format: 'yyyy.mm.dd'
	});
	
})

function checkFileType(filePath) {
    var fileFormat = filePath.split(".");
    if (fileFormat.indexOf("xlsx") > -1) {
        return true;
    } else {
        return false;
    }
}

function check() {
    var file = $("#excelFile").val();
    if (file == "" || file == null) {
        alert("파일을 선택해주세요.");
        return false;
    } else if (!checkFileType(file)) {
        alert("엑셀 파일만 업로드 가능합니다.");
        return false;
    }

    if (confirm("업로드 하시겠습니까?")) {
        var options = {
            success : function(data) {
                alert("모든 데이터가 업로드 되었습니다.");
            },
            type : "POST"
        };
        $("#excelUploadForm").ajaxSubmit(options);
    }
}

/* admit abstract */
$(document).ready(function(){
	$('#abstractNo').val(abno);
	$('.admitAbstract1').click(function(){
		location.href = '/abstractPage?email=' + email + '&abNo=' + $(this).attr('value') + "&page=" + page;
	})
})

/* usage List */
function usageData(){
	var dateCost = [];
	for(var i=0; i<$('.dateCostTbl').size(); i++){
		if($('.concatYear').eq(i).text() == $('#chartYear').val()){
			dateCost.push({
				arg: $('.concatDate').eq(i).text(),
				val: parseInt($('.sumCost').eq(i).text())
			})
		}
	}
	
	$(function(){
	    $("#chart1").dxChart({
	        dataSource: dateCost,
	        palette: "violet",
	        series: {
	        	palette: "violet",
	            argumentField: "arg",
	            valueField: "val",
	            name: "누적 금액",
	            type: "bar",
	        },
	        argumentAxis: {
	        	 label: {
		            format: {
		            	type: "month"
		            }
	        	 }
	        },
	        tooltip: {
	        	enabled: true,
	            location: "edge",
	            customizeTooltip: function (arg) {
                	 return {
                		 text: arg.valueText
                	 };
	            }
	        },
	        legend: {
	            horizontalAlignment: 'center',
	            verticalAlignment: 'bottom'
	        },
	        valueAxis: {
	            label: {
	                format: {
	                    type: "millions"
	                },
	            }
	        },
	        title: "<h4>달 별 누적금액</h4>"
	    });
	});
}

function userSum(){
	var userCost = [];
	for(var i=0; i<$('.orderByabstract1Tbl').size(); i++){
		if($('.abstract1Date').eq(i).attr('value') == $('#chartMonth').val()){
			userCost.push({
				arg: $('.orderByAbstract1').eq(i).text(),
				val: parseInt($('.abstract1SumCost').eq(i).text())
			})
		}
	}
	
	$(function(){
	    $("#userCostChart").dxChart({
	        dataSource: userCost,
	        series: {
	        	enabled: false,
	            argumentField: "arg",
	            valueField: "val",
	            name: "My oranges",
	            type: "bar",
	            color: "#e0af9a",
	            name: "누적 금액"
	        },
	        tooltip: {
	        	enabled: true,
	            location: "edge",
	            customizeTooltip: function (arg) {
                	 return {
                		 text: arg.valueText
                	 };
	            }
	        },
	        valueAxis: {
	            label: {
	                format: {
	                    type: "millions"
	                },
	            }
	        },
	        title: "<h3>항목 별 누적 금액</h3>"
	    });
	});
}

function userSum1(){
	var userCost = [];
	for(var i=0; i<$('.orderByUserTbl').size(); i++){
		if($('.userDate').eq(i).attr('value') == $('#chartMonth').val()){
			userCost.push({
				arg: $('.orderByUser').eq(i).text(),
				val: parseInt($('.userSumCost').eq(i).text())
			})
		}
	}
	
	$(function(){
	    $("#userCostGraph").dxChart({
	        dataSource: userCost,
	        rotated: true,
	        commonSeriesSettings: {
	            argumentField: "arg",
	            type: "bar",
	            color: "#b7d2ff",
	        },
	        series: {
	            valueField: "val",
	            name: "누적 금액"
	        },
	        legend: {
	            verticalAlignment: "bottom",
	            horizontalAlignment: "center"
	        },
	        "export": {
	            enabled: true
	        },
	        tooltip: {
	        	enabled: true,
	            location: "edge",
	            customizeTooltip: function (arg) {
                	 return {
                		 text: arg.valueText
                	 };
	            }
	        },
	        valueAxis: {
	            label: {
	                format: {
	                    type: "millions"
	                },
	            }
	        },
	        title: "<h3>인 별 누적 금액</h3>"
	    });
	});
}

$(document).ready(function(){
	var today = new Date();
	var month = today.getMonth() + 1;
	for(var i=1; i<=month; i++){
		$('#chartMonth').append("<option value='" + i + "'>" + i + "월</option>");
	}
	usageData();
	userSum();
	userSum1();
	
	$('#chartYear').change(function(){
		usageData();
	})
	
	$('#chartMonth').change(function(){
		userSum();
		userSum1();
	})
	
	
	$('.gradeX td').click(function(){
		if($(this).index() != 0){
			location.href="modifyCard?email=" + email + "&cNo=" + $(this).parents('.gradeX').attr('value') + "&abNo=" + $(this).parents('.gradeX').children('.abList').attr('value');
		}
	})
	
	$('#mine').click(function(){
		if($(this).is(":checked")){
			location.search = "?email=" + email + "&check=true";
		} else {
			location.search = "?email=" + email;
		}
	})
	
	if(check == 'true'){
		$('#mine').attr('checked', true);
	}
	$('#pasteUsage').click(function(){
		var param ="";
		for(var i=0; i<=$('.check').size(); i++){
			if($('.check').eq(i).is(":checked")){
				param = param + "&cNo=" + $('.check').eq(i).val();
			}
		}
		$.ajax({
	        url : "usagePaste?email=" + email,
	        type : 'post',
	        data : param,
	        dataType : 'text',
	        success : function(data) {
	          alert("복사되었습니다");
	          location.reload();
	        },
	        error : function() { alert("복사 실패");}
		});
	})
})	

/* modify usage */
$(document).ready(function(){
	
	if($('#abstract2M').children().size() <= 0){
		$('#Mabstract2box').hide();
	}
	
	$("#abstract1M").val(abno).prop("selected", true);
	
	$('#abstract1M').change(function(){
		location.href = '/modifyCard?email=' + email + "&cNo=" + cno + '&abNo=' + $(this).val();
	})
	
	$('#Mcancel').click(function() {
		var result = confirm('글 작성을 취소하시겠습니까?');
		if(result) {
			//yes
			location.replace('cardList?email=' + email);
		} else { 
			//no 
		} 
	})
	
	function deleteData(){
		var result = confirm('글을 삭제하시겠습니까?');
		if(result) {
			//yes
			$('#modifyForm').attr('action',"/cDelete?email=" + email + "&cNo=" + cno);
			$('#modifyForm').submit();
		} else { 
			//no 
		} 
	}
	
	function modifyData(){
		$('#modifyForm').attr('action', "/cModify?email=" + email + "&cNo=" + cno);
		$('#modifyForm').submit();
	}
})

/* task View */
$(document).ready(function(){
	if($('#taskAStauts').text()=='진행중'){
		$('#taskAStauts').addClass('label-primary');
	} else if($('#taskAStauts').text()=='대기'){
		$('#taskAStauts').addClass('label-default');
	} else if($('#taskAStauts').text()=='보류'){
		$('#taskAStauts').addClass('label-warning');
	} else if($('#taskAStauts').text()=='완료'){
		$('#taskAStauts').addClass('label-success');
	}
	
	var taskDay = $('#projectTday').text().split('-');
	if($('#projectTday').text() != '' && $('#projectTday').text() != undefined){
		var pday1 = taskDay[1].split('/');
		var project = new Date(pday1[0], pday1[1]-1, pday1[2]);
		var today = new Date();
		var btMs = today.getTime() - project.getTime() ;
		var btDay = Math.floor(btMs / (1000*60*60*24)) ;
		
		if(btDay >= 0){
			$('#activityDday').text("D+" + btDay);
			$('#activityDday').addClass('text-danger');
		} else {
			$('#activityDday').text("D" + btDay);
			$('#activityDday').addClass('text-success');
		}
		
		var tday2 = taskDay[0].split('/');
		var start = new Date(tday2[0], tday2[1]-1, tday2[2]);
		var btMs2 = today.getTime() - start.getTime();
		var btDay2 = Math.floor(btMs2 / (1000*60*60*24));
		
		var btMs3 = project.getTime() - start.getTime();
		var dayGap = Math.floor(btMs3 / (1000*60*60*24));
		
		if(btDay2 < 0){
			btDay2 = 0;
		}
		
		if(btDay2 > dayGap){
			$('#projectTday').append("<strong>(<strong class='text-danger'>" + btDay2 + "</strong>/" + dayGap + ")</strong>");
		} else {
			$('#projectTday').append("<strong>(<strong class='text-success'>" + btDay2 + "</strong>/" + dayGap + ")</strong>");
		}
		
		var today = new Date();
		var month = today.getMonth() + 1;
		var year = today.getFullYear();
		var day = today.getDate();
		
		$('#writeDay').val(year + '.' + month + '.' + day);
		
		if(month < 10){
			$('#wDate').val(year + '.0' + month + '.' + day);
		} else if(day < 10) {
			$('#wDate').val(year + '.' + month + '.0' + day);
		} else if(month < 10 && day < 10){
			$('#wDate').val(year + '.0' + month + '.0' + day);
		} else {
			$('#wDate').val(year + '.' + month + '.' + day);
		}
		
		$('#wDate').datepicker({
			format: 'yyyy.mm.dd',
			endDate: new Date(pday1[0], pday1[1]-1, pday1[2]),
			startDate: new Date(tday2[0], tday2[1]-1, tday2[2])
		});
		
	}
	
	for(var i=1; i<=$('.wDate').size(); i++){
		if($('.wDate').eq(i).text() == $('.wDate').eq(i-1).text()){
			$('.wDate').eq(i).hide();
		} else {
			$('.wDate').eq(i).parents('.row').addClass('ibox2');
		}
	}
	
	$('.chosen-select').chosen({width: "100%"});
	$('#viewTaskTable').children('td').addClass('no-padding');
	
	for(var i=0; i<= $('.listToChange').size(); i++){
		if($('.wHTime').eq(i).text() == 'h'){
			$('.wHTime').eq(i).text(' ');
		}
		if($('.wMTime').eq(i).text() == 'm'){
			$('.wMTime').eq(i).text(' ');
		}
	}
	if(tno != null || tno != undefined){
		$('.listToChange').hide();
		
		for(var i=0; i<5; i++){
			$('.listToChange').eq(i).show();
		}
		
		var show = 5;
		$(window).scroll(function() {
			if ($(document).height() - $(window).height() == $(window).scrollTop()) {
				for(var i=show; i<=show + 5; i++){
					$('.listToChange').eq(i).show();
				}
				show++;
				show++;
				show++;
				show++;
				show++;
			}
		})
	}
})

/* client */
/* 다음 주소 찾기 */
function sample6_execDaumPostcode1() {
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
            document.getElementById('clientaddr').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('clientaddr2').focus();
        }
    }).open();
}
$(document).ready(function(){
	$('.selectClient').click(function(){
		if(type != null || type != undefined){
			location.search = "?email=" + email + "&type=" + type + "&keyword=" + keyword + "&ctNo=" + $(this).attr('value');
		} else {
			location.search = "?email=" + email + "&ctNo=" + $(this).attr('value');
		}
	})
	
	var today = new Date();
	var month = today.getMonth() + 1;
	var year = today.getFullYear();
	var day = today.getDate();
	
	$('#fDateInput').val(year + '.' + month + '.' + day);
	for(var i=1; i<=$('#fileList').children('li').size(); i++){
		$('#fileList').children('li').eq(i).removeClass('fist-item');
	}
	
	$('#searchClient').click(function(){
		var type = $('#clientType').val();
		var keyword = $('#clientKeyword').val();
		location.search = "?email=" + email + "&type=" + type + "&keyword=" + keyword;
	})
})

function form_submit(ctno){
	if(ctno != null || ctno != undefined){
		$('#clientForm').attr('action',"/registerClient?email=" + email + "&ctNo=" + ctno);
		$("#clientForm").submit();
	} else {
		$('#clientForm').attr('action',"/registerClient?email=" + email);
		$('#clientForm').submit();
	}
}

function deleteClient(ctno){
	var result = confirm('고객을 삭제하시겠습니까?');
	if(result) {
		//yes
		$('#deleteForm').attr('action',"/deleteClient?email=" + email + "&ctNo=" + ctno);
		$('#deleteForm').submit();
	} else { 
		//no 
	} 
}

function contractModal1(fNo){
	$.ajax({
	    url: 'modal?email=' + email + "&ctNo=" + ctno,
	    method: "get",
	    type: "json",
	    data: "&fNo=" + fNo,
	    success: function(data) {
	        $('#modalBody').html(data);
	        $("#contractModal").modal("show");
	    }
	});
}

/* notify */
	
$('#notifyText').summernote({
  height: 300,                 // set editor height
  minHeight: null,             // set minimum height of editor
  maxHeight: null,             // set maximum height of editor
  focus: true,
  toolbar: [
    // [groupName, [list of button]]
    ['style', ['bold', 'italic', 'underline', 'clear']],
    ['font', ['strikethrough', 'superscript', 'subscript']],
    ['fontsize', ['fontsize']],
    ['color', ['color']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['height', ['height']]
  ]
});

$('#notifyText').on('summernote.blur', function(){
	$('#nText').val($('#notifyText').summernote('code'));
})

var today = new Date();
var month = today.getMonth() + 1;
var year = today.getFullYear();
var day = today.getDate();

$('#nDate').val(year + '.' + month + '.' + day);

/* notify view */
$(document).ready(function(){
	var today = new Date();
	var month = today.getMonth() + 1;
	var year = today.getFullYear();
	var day = today.getDate();

	$('#coDate').val(year + '.' + month + '.' + day);
	
   $('img').error(function(){
     $(this).attr('src', '../img/photo.png');
   });
})

function deleteNotify(nNo){
	var result = confirm('글을 삭제하시겠습니까?');
	if(result) {
		//yes
		$('#notifyForm').attr('action',"/deleteNotify?email=" + email + "&nNo=" + nNo);
		$('#notifyForm').submit();
	} else { 
		//no 
	} 
}

/* vote */
$('#voteText').summernote({
	  height: 300,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true,
	  toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['fontsize', ['fontsize']],
	    ['color', ['color']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']]
	  ]
});

$('#voteText').on('summernote.blur', function(){
	$('#vText').val($('#voteText').summernote('code'));
})

$(document).ready(function(){
	var today = new Date();
	var month = today.getMonth() + 1;
	var year = today.getFullYear();
	var day = today.getDate();

	$('#vDate').val(year + '.' + month + '.' + day);
	
	$('#nText').focus(function(){
		$('#nText').before('<input class="form-control iText" name="iText2" type="text"><input type="file" name="file">');
		$('.iText').last().focus();
		$('.body').css('height', $('.body').height() + 100);
	})
	
	$('.img-size').error(function(){
	     $(this).attr('src', 'resources/img/237033-file_document__text_word-512.png');
	});	
	
	$('#voteSubmit').click(function(){
		var param ="";
		for(var i=0; i<=$('.voteResult').size(); i++){
			if($('.voteResult').eq(i).is(":checked")){
				param = param + "&iNo=" + $('.voteResult').eq(i).attr('value');
			}
		}
		$.ajax({
	        url : "updateIcount?email=" + email + "&vNo=" + vNo,
	        type : 'post',
	        data : param,
	        dataType : 'text',
	        success : function(data) {
	          console.log(data);
	          console.log("success");
	          location.href="vote?email=" + email + "&vNo=" + vNo;
	        }, 
	        error : function() { }
		});
	})
	
	
	var result = [];
	for(var i=0; i<$('.resultBox').size(); i++){
		var text = $('.resultText').eq(i).text();
		var count = parseInt($('.resultCount').eq(i).text());
		
		result.push({
			text: text,
			count: count
		})
	}
	
	$(function(){
	    $("#resultChart").dxChart({
	        dataSource: result, 
	        palette: "Ocean",
	        legend: { visible: false },
	        rotated: true,
	        series: {
	            argumentField: "text",
	            valueField: "count",
	            type: "bar"
	        }
	    });
	});
})
