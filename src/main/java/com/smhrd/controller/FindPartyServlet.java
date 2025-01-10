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

@WebServlet("/findPartyProcess")
public class FindPartyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userRegion = user.getUserRegion();
        PartyDAO dao = new PartyDAO();
        List<PartyVO> partyList = dao.selectPartiesByRegion(userRegion);

        // 디버깅용 로그 추가
        if (partyList == null || partyList.isEmpty()) {
            System.out.println("DAO에서 가져온 partyList가 비어있습니다.");
        } else {
            for (PartyVO party : partyList) {
                System.out.println("방 제목: " + party.getPartyNm());
                System.out.println("방 지역: " + party.getPartyRegion());
            }
        }

        request.setAttribute("partyList", partyList);
        request.getRequestDispatcher("findParty.jsp").forward(request, response);
    }
}