package model.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import model.Member;
import model.Member;
import model.dao.MemberDAO;

// an example business class
public class UserAnalysis {
	private MemberDAO dao;
	
	public UserAnalysis() {}
	
	public UserAnalysis(MemberDAO dao) {
		super();
		this.dao = dao;
	}

	// an example business method
/*	public List<Member> recommendFriends(String userId) throws Exception {
		Member thisuser = dao.findMember(userId);
		if (thisuser == null) {
			throw new Exception("invalid user ID!");
		}
		int m1 = userId.indexOf('@');
		if (m1 == -1) return null;
		
		List<Member> friends = new ArrayList<Member>();
		
		List<Member> userList = dao.findMemberList(1, 10000);
		Iterator<Member> userIter = userList.iterator();		
		while (userIter.hasNext()) {
			Member user = (Member)userIter.next();
			
			if (user.getId().equals(userId)) continue;	
		}
		return friends;
	}
*/
}
