package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class MemberListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		try {
			req.getRequestDispatcher("admin/memberList.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
