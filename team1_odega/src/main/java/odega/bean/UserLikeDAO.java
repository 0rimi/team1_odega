package odega.bean;
import odega.OracleDB;
import odega.bean.PostsDTO;
import odega.bean.UserLikeDTO;

import java.util.ArrayList;


import java.sql.*;

public class UserLikeDAO extends OracleDB {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//likes 테이블에 값 저장
	public int saveLikeList(String user_id, int post_num) {
		int addLike=0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("select num from users where user_id = ?");
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			int user_num = rs.getInt("num");
			
			pstmt = conn.prepareStatement("insert into likes values (likes_seq.nextval,?,?)");
			pstmt.setInt(1, user_num);
			pstmt.setInt(2, post_num);
			addLike =  pstmt.executeUpdate();
			
			UserLikeDTO dto = new UserLikeDTO();
			dto.setUser_num(user_num);
			dto.setPost_num(post_num);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}return addLike;
	}
	
	
	//내가 좋아요 한 목록 출력
	public ArrayList<PostsDTO> likeList(String user_id) {
		ArrayList<PostsDTO> list=new ArrayList<>();
		try {
			conn = getConnection();
			
			String sql="select posts.*, users.nickname from likes join posts on likes.post_num=posts.num join users on likes.user_num=users.num where likes.user_num = (select num from users where user_id = ?) order by likes.like_date desc";
			pstmt=conn.prepareStatement(sql);	
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				PostsDTO dto=new PostsDTO();
				dto.setNum(rs.getInt("num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setPost_like_cnt(rs.getInt("post_like_cnt"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}return list;
	}
}
