document.addEventListener('DOMContentLoaded', () => {
    const requestList = document.getElementById('request-list');

    // 예시 데이터
    const requests = [
        {
            userId: "user123",
            name: "홍길동",
            region: "서울",
            introduction: "안녕하세요! 모임에 참여하고 싶습니다.",
            age: 25,
            timestamp: "2025-01-11 15:30",
        },
        {
            userId: "user456",
            name: "김철수",
            region: "부산",
            introduction: "저도 함께 하고 싶어요!",
            age: 30,
            timestamp: "2025-01-11 16:00",
        },
    ];

    // 요청 카드 생성 함수
    function createRequestCard(request) {
        const card = document.createElement('div');
        card.className = 'request-card';

        card.innerHTML = `
            <p><strong>아이디:</strong> ${request.userId}</p>
            <p><strong>이름:</strong> ${request.name}</p>
            <p><strong>활동 지역:</strong> ${request.region}</p>
            <p><strong>자기소개글:</strong> ${request.introduction}</p>
            <p><strong>나이:</strong> ${request.age}</p>
            <p><strong>작성 시간:</strong> ${request.timestamp}</p>
            <div class="button-group">
                <button class="accept-btn">수락하기</button>
                <button class="reject-btn">거절하기</button>
            </div>
        `;

        // 버튼 이벤트 추가
        card.querySelector('.accept-btn').addEventListener('click', () => {
            alert(`${request.name}님의 요청을 수락했습니다.`);
            card.remove();
        });

        card.querySelector('.reject-btn').addEventListener('click', () => {
            alert(`${request.name}님의 요청을 거절했습니다.`);
            card.remove();
        });

        return card;
    }

    // 요청 카드 리스트 렌더링
    requests.forEach(request => {
        const card = createRequestCard(request);
        requestList.appendChild(card);
    });
});
