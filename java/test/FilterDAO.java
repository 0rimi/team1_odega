package test;
import test.FilterDTO;
import test.Odega_DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class FilterDAO extends Odega_DB {
private static FilterDAO instance = new FilterDAO();
	
	public static FilterDAO getInstance() {
		return instance;
	
	}
	private FilterDAO() {}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;	
	
	
	
}