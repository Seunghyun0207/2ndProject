<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임방 생성</title>
    <link rel="stylesheet" href="css/createParty.css">
</head>
<body>
    <div class="create-meeting-container">
        <h1>모임방 생성</h1>
        
        <form id="createPartyProcess" enctype="multipart/form-data">
            <!-- 모임 제목 -->
            <div class="form-group">
                <label for="partyTitle">모임방 제목</label>
                <input type="text" id="partyTitle" name="partyTitle" placeholder="모임방 제목을 입력하세요" required>
            </div>

            <!-- 모임 소개 -->
            <div class="form-group">
                <label for="partyDescription">모임방 소개</label>
                <textarea id="partyDescription" name="partyDescription" rows="5" placeholder="모임방 소개를 입력하세요" required></textarea>
            </div>

            <!-- 이미지 업로드 -->
            <div class="form-group">
                <label for="partyImage">모임방 이미지</label>
                <input type="file" id="partyImage" name="partyImage" accept="image/*" required>
            </div>

            <!-- 모임 지역 -->
            <div class="form-group">
                <label for="partyRegion">모임방 지역</label>
                <select id="partyRegion" name="partyRegion" required>
                    <option value="" disabled selected>지역을 선택해주세요.</option>
                    <option value="GG">경기도</option>
                    <option value="GW">강원도</option>
                    <option value="CB">충청북도</option>
                    <option value="CN">충청남도</option>
                    <option value="GB">경상북도</option>
                    <option value="GN">경상남도</option>
                    <option value="JB">전라북도</option>
                    <option value="JN">전라남도</option>
                    <option value="JJ">제주도</option>
                </select>
            </div>

            <!-- 방 생성 버튼 -->
            <div class="form-group">
                <button type="submit" id="create-meeting-btn">방 생성</button>
            </div>
        </form>
    </div>

    <script>
    document.getElementById('createPartyProcess').addEventListener('submit', function(event) {
        event.preventDefault(); // 폼 제출 기본 동작 막기

        // FormData 객체 생성
        const formData = new FormData();
        formData.append('partyTitle', document.getElementById('partyTitle').value);
        formData.append('partyDescription', document.getElementById('partyDescription').value);
        formData.append('partyRegion', document.getElementById('partyRegion').value);
        formData.append('partyImage', document.getElementById('partyImage').files[0]);

        // AJAX 요청
        fetch('/createPartyProcess', { // 실제 서버의 URL로 변경 필요
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`서버 에러: ${response.status}`);
            }
            return response.json(); // 서버에서 JSON 응답을 받는다고 가정
        })
        .then(data => {
            // 성공 메시지 표시
            alert(`모임방 생성 완료!\n제목: ${data.title}\n소개: ${data.description}\n지역: ${data.region}`);
            // 페이지 이동
            window.location.href = "/main/dist/index.html"; // 실제 페이지 주소로 변경 필요
        })
        .catch(error => {
            // 에러 처리
            alert(`모임방 생성 중 오류가 발생했습니다: ${error.message}`);
        });
    });
    </script>

</body>
</html>
