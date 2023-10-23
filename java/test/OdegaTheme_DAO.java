package test;
import java.sql.Connection;
//import java.security.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.Odega_DB;
import test.OdegaTheme_DTO;


public class OdegaTheme_DAO extends Odega_DB {
private static OdegaTheme_DAO instance = new OdegaTheme_DAO();
	
	public static OdegaTheme_DAO getInstance() {
		return instance;
	
	}
	private OdegaTheme_DAO() {}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;	
	
	//좋아요 
	public int getPost_like_cnt(int posts_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select post_like_cnt from posts");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs,pstmt,conn);
		}
		return x; 
	}
	//좋아요 업데이트 
	public int updatePost_like_cnt(int posts_num) {
		int x=0;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement("update posts set post_like_cnt = post_like_cnt + 1 where num = ?");
		    pstmt.setInt(1, posts_num);
		    x = pstmt.executeUpdate();
		    
		    OdegaTheme_DTO dto = new OdegaTheme_DTO();
		    dto.setPost_like_cnt(x);
		    
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs,pstmt,conn);
		}
		return x;
	}
	
	
	//글 갯수 보내기 (페이징시 사용 메서드)
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from posts");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs,pstmt,conn);
		}
		return x; 
	}
	
	
	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from posts");
					rs = pstmt.executeQuery();
					if (rs.next()) {
						articleList = new ArrayList(end); 
						do{ 
							OdegaTheme_DTO article= new OdegaTheme_DTO();
							article.setNum(rs.getInt("num"));
							article.setTitle(rs.getString("title"));
							article.setContent(rs.getString("content"));
							article.setPost_like_cnt(rs.getInt("post_like_cnt"));
							article.setUser_num(rs.getInt("User_num"));
							//article.setReg(rs.getInt("reg"));
					
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs,pstmt,conn);
		}
		return articleList;
	}
	
	/*posts
	public ArrayList<OdegaTheme_DTO> title(String s) {
		ArrayList<OdegaTheme_DTO> list=new ArrayList<>();
		try {
			conn = getConnection();
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			//	dto.setNum(rs.getInt("num"));
			//	dto.setNickname(rs.getString("nickname"));
			//	dto.setTitle(rs.getString("title"));
			//	dto.setContent(rs.getString("content"));
			//  dto.setReg(rs.getTimestamp("reg"));
			//  dto.setPost_like_cnt(rs.getInt(post_like_cnt));
		    //  dto.setImg_url(rs.getString(img_url));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs,pstmt,conn);
		}
		return dto;
	}*/

	// 글 갯수
	public int count() {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs,pstmt,conn);
		}
		return result;
	}
	
	/* 검색 메서드 
	 * public ArrayList<OdegaTheme_DTO> getSearchList(String search){
	 * 	ArrayList<OdegaTheme_DTO> list = new ArrayList<OdegaTheme_DTO>();
	 * 	
	 * 	try{
	 * 		conn = getConnection();
	 * 		String sql = "";
	 * 		pstmt=conn.prepareStatement(sql);		
			rs=pstmt.executeQuery();
	 * } while(rs.next()){
	 * 		OdegaTheme_DTO dto = new OmegaTheme_DTO();
	 * 		dto.setNickname(rs.getString("nickname");
	 * 		dto.setTitle(rs.getString("title");
	 * 		dto.setReg(rs.getReg("reg");
	 * 		dto.setPost_like_cnt(rs.getInt("post_like_cnt");
	 *   	
	 *   	list.add(dto);
	 * }
	 * 		catch(Exception e{
	 * 		e.printStackTrace();
		}finally {
			close(rs,pstmt,conn);
		}
		return list;
	 * }
	 * 
	 * */
	
	
	
}












