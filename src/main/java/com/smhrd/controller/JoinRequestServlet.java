package com.smhrd.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.model.JoinRequestDAO;
import com.smhrd.model.JoinRequestVO;
import com.smhrd.model.UserVO;

@WebServlet("/joinRequest")
public class JoinRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = user.getUserId();
        int partyIdx = Integer.parseInt(request.getParameter("partyIdx"));
        String joinIntro = request.getParameter("joinIntro");

        JoinRequestVO joinRequest = new JoinRequestVO(userId, partyIdx, joinIntro, 'N');
        JoinRequestDAO dao = new JoinRequestDAO();
        int result = dao.insertJoinRequest(joinRequest);

        if (result > 0) {
            response.sendRedirect("partyDetails.jsp?partyIdx=" + partyIdx);
        } else {
            response.getWriter().println("신청 실패");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int partyIdx = Integer.parseInt(request.getParameter("partyIdx"));
        JoinRequestDAO dao = new JoinRequestDAO();
        List<JoinRequestVO> joinRequests = dao.selectJoinRequestsByPartyIdx(partyIdx);

        request.setAttribute("joinRequests", joinRequests);
        request.getRequestDispatcher("partyRoom.jsp").forward(request, response);
    }
}
