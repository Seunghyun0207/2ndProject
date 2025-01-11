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
        
        <form id="create-meeting-form" action="createPartyProcess" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="partyTitle">모임방 제목</label>
                <input type="text" id="partyTitle" name="partyTitle" placeholder="모임방 제목을 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="partyDescription">모임방 소개</label>
                <textarea id="partyDescription" name="partyDescription" rows="5" placeholder="모임방 소개를 입력하세요" required></textarea>
            </div>

            <div class="form-group">
                <label for="partyImage">모임방 이미지</label>
                <input type="file" id="partyImage" name="partyImage" accept="image/*">
            </div>

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

            <div class="form-group">
                <button type="submit" id="create-meeting-btn">방 생성</button>
            </div>
        </form>

        <div id="myElementId">추가로 클릭할 요소</div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const createMeetingForm = document.getElementById("create-meeting-form");
            if (createMeetingForm) {
                createMeetingForm.addEventListener("submit", (event) => {
                    event.preventDefault();
                    const title = document.getElementById("partyTitle").value;
                    const description = document.getElementById("partyDescription").value;
                    const location = document.getElementById("partyRegion").value;
                    const image = document.getElementById("partyImage").files[0];

                    alert(`모임방 생성 완료!\n제목: ${title}\n소개: ${description}\n지역: ${location}\n이미지: ${image ? image.name : '선택 안 함'}`);

                    window.location.href = "http://localhost:8081/2ndProject/myParties";
                });
            }

            const myElement = document.getElementById("myElementId");
            if (myElement) {
                myElement.addEventListener("click", () => {
                    console.log("요소 클릭됨");
                });
            } else {
                console.error("ID가 'myElementId'인 요소를 찾을 수 없습니다.");
            }
        });
    </script>
</body>
</html>