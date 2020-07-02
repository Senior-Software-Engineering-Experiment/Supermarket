package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Member;
import utils.DBHelper;

public class MemberDAO {
	public MemberDAO() {

	}

	public static MemberDAO getInstance() {
		return new MemberDAO();
	}

	public List<Member> get() {
		List<Member> members = new ArrayList<Member>();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from TeamMember ";
			ResultSet rs = s.executeQuery(sql);

			while (rs.next()) {
				Member member = new Member();
				
				int mno = Integer.valueOf(rs.getString(1));
				String mname = rs.getString(2);
				String mdes = rs.getString(3);
				String mp = rs.getString(4);
				
				member.setMemberNo(mno);
				member.setMemberName(mname);
				member.setDescribe(mdes);
				member.setPicture(mp);
				

				//System.out.println(mno + ',' + mname + ',' + mdes + "," +mp);
				
				members.add(member);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return members;

	}
}
