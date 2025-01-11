package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.PartyDAO;
import com.smhrd.model.PartyVO;
import com.smhrd.model.UserVO;

@WebServlet("/myParties")
public class MainServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = user.getUserId();
        PartyDAO dao = new PartyDAO();
        List<PartyVO> myPartyList = dao.selectMyParties(userId);  // 사용자가 가입한 모임 리스트 조회

        // 모임 정보를 JSON 형식으로 반환
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        StringBuilder jsonResponse = new StringBuilder();
        jsonResponse.append("[");

        if (myPartyList != null && !myPartyList.isEmpty()) {
            for (int i = 0; i < myPartyList.size(); i++) {
                PartyVO party = myPartyList.get(i);
                jsonResponse.append("{")
                    .append("\"partyNm\":\"").append(party.getPartyNm()).append("\",")
                    .append("\"partyRegion\":\"").append(party.getPartyRegion()).append("\",")
                    .append("\"partyIdx\":\"").append(party.getPartyIdx()).append("\"")
                    .append("}");
                if (i < myPartyList.size() - 1) {
                    jsonResponse.append(",");
                }
            }
        }
        jsonResponse.append("]");

        response.getWriter().write(jsonResponse.toString());
    }
}
