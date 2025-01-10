<%@page import="com.smhrd.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
 <%
    UserVO user = (UserVO) session.getAttribute("user");
    if (user == null) {
        // 로그인되지 않은 경우 로그인 페이지로 이동
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>유동회관</title>
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css"> <!-- 이 순서 중요! 위치변동x -->
    <style>
        h1 {
            font-family: 'East Sea Dokdo', cursive;
            color : white;
            font-size: 60px;
            text-align: center;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }
    </style>
</head>
<body>
    <div id="app" class="wrapper" v-cloak v-bind:class="{'is-previous': isPreviousSlide, 'first-load': isFirstLoad}">
        <h1 class="site-name">온도차이</h1>

    <!-- about -->
    <div class="about">
        <a class="bg_links social portfolio" href="https://www.rafaelalucas.com" target="_blank">
            <span class="icon"></span>
        </a>
        <a class="bg_links social dribbble" href="https://dribbble.com/rafaelalucas" target="_blank">
            <span class="icon"></span>
        </a>
        <a class="bg_links social linkedin" href="https://www.linkedin.com/in/rafaelalucas/" target="_blank">
            <span class="icon"></span>
        </a>
        <a class="bg_links logo"></a>
    </div>


    <section id="wrapper">
        <div class="content">
            <!-- Tab links -->
            <div class="tabs">
                <button class="tablinks" data-country="FindMeeting" onclick="location.href='<%= request.getContextPath() %>/findPartyProcess'"><p data-title="FindMeeting">모임 찾기</p></button>
                <button class="tablinks active" data-country="Meeting" onclick="location.href='myParties'"><p data-title="Meeting">나의모임</p></button>
                <button class="tablinks" data-country="Board"><p ㄷdata-title="Board">피드</p></button>
                <button class="tablinks" data-country="Event"><p data-title="Event">이벤트</p></button>
                <button class="tablinks" data-country="Notice"><p data-title="Notice">공지사항</p></button>
                
            </div>

            <div id="FindMeeting" class="tabcontent">
                <div class="search-bar">
                    <input type="text" id="search-input" placeholder="모임 제목을 검색하세요..." />
                    <button id="search-btn">검색</button>
                </div>
                <div class="create-meeting-btn-container">
                    <button id="create-meeting-btn">모임 생성</button>
                </div>
                <div class="meeting-item">
                    <div class="photo">
                        <img src="./images/1.png" alt="모임 사진 1">
                    </div>
                    <div class="details">
                        <h3 onclick="">모임 제목</h3>
                        <p>제목</p>
                    </div>
                </div>
            </div>
            
            <!-- Tab content -->
            <div id="Meeting" class="tabcontent active">
                <!-- 검색 바 -->
    <div class="search-bar">
        <input type="text" id="search-input" placeholder="모임 제목을 검색하세요..." />
        <button id="search-btn">검색</button>
    </div>

    <!-- 모임 항목 -->
    <div class="meeting-item">
        <div class="photo">
            <img src="./images/9.jpg" alt="모임 사진 1">
        </div>
        <div class="details">
            <h3 onclick="">모임 제목</h3>
            <p>제목</p>
        </div>
    </div>
                
            </div>
            
            <div id="Board" class="tabcontent">
                <div class="feed-header">
                    <div class="user-info">
                        <img src="user-photo.jpg" alt="User photo" class="user-photo">
                        <span class="user-name">John Doe</span>
                    </div>
                    <span class="feed-date">2025-01-07</span>
                </div>
                <div class="feed-content">
                    <p>This is a post content.</p>
                    <img src="post-image.jpg" alt="Post image" class="feed-image">
                </div>
                <div class="feed-actions">
                    <button class="like-button" onclick="toggleLike()">좋아요❤️</button>
                    <button class="share-button" onclick="sharePost()">공유하기</button>
                </div>
                <div class="comments-section">
                    <div class="comment-input-container">
                        <input type="text" class="comment-input" placeholder="댓글을 남겨주세요..." id="commentInput">
                        <button class="comment-submit" onclick="submitComment()">댓글 달기</button>
                    </div>
                    <div class="comments-list" id="commentsList">
                        <!-- 댓글이 여기에 표시됩니다 -->
                    </div>
                </div>
                <br><br><br>
                <div class="feed-header">
                    <div class="user-info">
                        <img src="user-photo.jpg" alt="User photo" class="user-photo">
                        <span class="user-name">John Doe</span>
                    </div>
                    <span class="feed-date">2025-01-07</span>
                </div>
                <div class="feed-content">
                    <p>This is a post content.</p>
                    <img src="post-image.jpg" alt="Post image" class="feed-image">
                </div>
                <div class="feed-actions">
                    <button class="like-button">좋아요❤️</button>
                    <button class="share-button">공유하기</button>
                </div>
                <div class="comments-section">
                    <div class="comment-input-container">
                        <input type="text" class="comment-input" placeholder="댓글을 남겨주세요..." id="commentInput">
                        <button class="comment-submit" onclick="submitComment()">댓글 달기</button>
                    </div>
                    <div class="comments-list" id="commentsList">
                        <!-- 댓글이 여기에 표시됩니다 -->
                    </div>
                </div>
            </div>
            
            <div id="Event" class="tabcontent">
                <div class="event-board">
                    <div class="event-item">
                        <h3 class="event-title">이벤트 제목</h3>
                        <p class="event-date">2025-01-07</p>
                        <p class="event-location">이벤트 장소: 스마트인재개발원</p>
                        <p class="event-content">출석 열심히 하면 "하이오 커피" 쿠폰 제공.</p>
                    </div>
                </div>
            </div>
            
            <div id="Notice" class="tabcontent">
                <div class="notice-board">
                    <div class="notice-item">
                        <h3 class="notice-title">공지사항 제목</h3>
                        <p class="notice-date">2025-01-07</p>
                        <p class="notice-content">업데이트 중입니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
// tabs

var tabLinks = document.querySelectorAll(".tablinks");
var tabContent = document.querySelectorAll(".tabcontent");

tabLinks.forEach(function(el) {
   el.addEventListener("click", openTabs);
});

function openTabs(el) {
   var btnTarget = el.currentTarget;
   var country = btnTarget.dataset.country;

   tabContent.forEach(function(el) {
      el.classList.remove("active");
   });

   tabLinks.forEach(function(el) {
      el.classList.remove("active");
   });

   document.querySelector("#" + country).classList.add("active");
   
   btnTarget.classList.add("active");
}

// 📸 게시물 추가 기능
document.getElementById('addPost').addEventListener('click', function () {
   const fileInput = document.getElementById('imageUpload');
   const textInput = document.getElementById('postText');
   const postList = document.querySelector('.post-list');

   if (fileInput.files.length > 0) {
       const file = fileInput.files[0];
       const reader = new FileReader();

       reader.onload = function (e) {
           const imageUrl = e.target.result;
           const textContent = textInput.value || '사용자 게시물입니다.';

           // 게시물 생성
           const newPost = document.createElement('li');
           newPost.innerHTML = `
               <div class="post">
                   <img src="${imageUrl}" alt="사용자 이미지" class="post-image">
                   <p class="post-text">${textContent}</p>
               </div>
           `;
           postList.appendChild(newPost);

           // 입력 필드 초기화
           fileInput.value = '';
           textInput.value = '';
       };

       reader.readAsDataURL(file);
   } else {
       alert('이미지를 선택해주세요!');
   }
});

// 
// 탭 전환 기능
function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    
    // 모든 tabcontent를 숨김
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].classList.remove("active");
    }

    // 모든 tablinks에서 active 클래스를 제거
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].classList.remove("active");
    }

    // 선택된 탭만 보이게 하고 활성화 클래스를 추가
    document.getElementById(tabName).classList.add("active");
    evt.currentTarget.classList.add("active");
}

// 검색 버튼 클릭 시 동작 (추가적인 기능 예시)
document.getElementById('search-btn').addEventListener('click', function() {
    var searchTerm = document.getElementById('search-input').value;
    console.log("검색어: ", searchTerm);
    // 실제 검색 로직을 이곳에 작성하면 됩니다.
});

// 좋아요 버튼 상태 토글
let isLiked = false;
function toggleLike() {
    isLiked = !isLiked;
    const likeButton = document.querySelector('.like-button');
    if (isLiked) {
        likeButton.textContent = "💖 좋아요 취소";
    } else {
        likeButton.textContent = "👍 좋아요";
    }
}

// 댓글 달기 기능
function submitComment() {
    const commentInput = document.getElementById('commentInput');
    const commentText = commentInput.value.trim();

    if (commentText !== "") {
        const commentsList = document.getElementById('commentsList');
        const newComment = document.createElement('div');
        newComment.className = 'comment-item';
        newComment.textContent = commentText;
        commentsList.appendChild(newComment);
        commentInput.value = ""; // 댓글 입력란 비우기
    }
}

// 공유하기 버튼 기능
function sharePost() {
    alert("게시물이 공유되었습니다!"); // 실제 공유 기능은 추가로 구현 필요
}

document.getElementById('create-meeting-btn').addEventListener('click', function() {
    // 모임 생성 폼을 띄우는 코드 (예: alert 창 또는 다른 방식으로 모임 생성 화면을 보여줄 수 있습니다)
    alert('모임 생성 화면으로 이동합니다!');
    
    // 실제 모임 생성 폼을 띄우려면 아래와 같은 방법을 사용할 수 있습니다:
    // window.location.href = '/create-meeting-page';
});
</script>
</body>
</html>