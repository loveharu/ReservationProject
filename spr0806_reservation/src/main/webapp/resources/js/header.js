document.addEventListener('DOMContentLoaded', () => {
    const menuToggle = document.getElementById('menu-toggle');
    const nav = document.getElementById('nav');

    menuToggle.addEventListener('click', () => {
        nav.classList.toggle('active');
    });

});
    
    /*
    const loginNameElement = document.getElementById('loginName');

    if (loginNameElement && loginNameElement.textContent.trim() === "") {
        // loginName이 비어 있으면 AJAX 요청으로 이름을 가져옴
		var input_value = $("div[id='loginEmail']").text();
        alert(input_value);
        	$.ajax({
		        url: '/ex/userrest/emailToName', // 서버에서 정의한 URL
		        type: 'GET', // HTTP 메서드
		        data: {
		        	email: input_value // 서버로 보낼 파라미터
		        },
		        success: function(response) {
		        	console.log(response);
		            // 서버에서 반환된 JSON 데이터를 파싱
		            var name = response.name;
		            console.log(name);
		            // result가 "true"인지 "false"인지 판단하여 사용자에게 메시지 표시
		            if (name != null) {
		                $("#loginName").html(name);
		            } else {
		                $("#loginName").html();
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("AJAX 요청 실패: ", status, error);
		            $(".console").html("<span style='color:red'>서버 요청에 실패했습니다.</span>");
		        }
		    });
        
        
        
    }
    
    */
    
    
    
