package market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import market.util.DBConn;
import market.vo.ProductVO;

public class productDAO {

	private Connection con;
	private String query; // 쿼리문 저장 필드
	private PreparedStatement psmt;
	private ResultSet rs;
	private boolean result; // DML처리 결과 여부 저장

	// 기본 생성자 - con 객체 초기화
	public productDAO() {
		this.con = DBConn.getConnection();
	}

	// 제품 등록
	public boolean insert(ProductVO pvo) {
		try { // 쿼리를 실행하다가 예외가 발생할 수 있으니까 try/ catch문에다가 // insert 쿼리문
			query = " INSERT INTO product VALUES (?,?,?,?,?,?,?,?,NVL(?, 'default.png'))"; // 이미지가 null이면 default 이미지를
																							// 넣고 아니면 선택 이미지 넣기

			// 매개변수로 넘겨받은 데이터를 product 테이블에 저장
			psmt = con.prepareStatement(query);

			psmt.setString(1, pvo.getPid());
			psmt.setString(2, pvo.getPname());
			psmt.setInt(3, pvo.getPrice());
			psmt.setString(4, pvo.getDescription());
			psmt.setString(5, pvo.getMaker());
			psmt.setString(6, pvo.getCategory());
			psmt.setInt(7, pvo.getStock());
			psmt.setString(8, pvo.getCondition());
			psmt.setString(9, pvo.getPimage());

			int result = psmt.executeUpdate();

			if (result == 1) { // 정상적으로 회원가입 성공 시 true 반환
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(psmt);
		}

		// 그렇지 않으면 false 반환
		return false;

	} // insert end

	// 제품 수정 /// 아직 미완성 delete부터 완성하고 만들기
	public boolean update(ProductVO pvo) {
		try {  
			   query = " UPDATE product SET PID=?, PNAME=?, PRICE=?, DESCRIPTION=?,"
			   		  +" MAKER=?, CATEGORY=?, STOCK=?, CONDITION=?, PIMAGE=? WHERE PID=?";
			   
			   psmt = DBConn.getConnection().prepareStatement(query);
			
			    psmt.setString(1, pvo.getPid());
				psmt.setString(2, pvo.getPname());
				psmt.setInt(3, pvo.getPrice());
				psmt.setString(4, pvo.getDescription());
				psmt.setString(5, pvo.getMaker());
				psmt.setString(6, pvo.getCategory());
				psmt.setInt(7, pvo.getStock());
				psmt.setString(8, pvo.getCondition());
				psmt.setString(9, pvo.getPimage());
			  
			  
			   int result = psmt.executeUpdate();
			 
			   if(result ==1) {   // 정상적으로 회원가입 성공 시 true 반환
				  return true; }
		  		} catch (SQLException e) {
		  			e.printStackTrace();
		  		}finally {   
		  		 DBConn.close(psmt);
		  		}
		  		// 그렇지 않으면  false 반환
		  		return false;	  

	}

	// 제품 삭제
	public boolean delete(String pid) {

		try {
			query = "DELETE product WHERE PID = ? ";

			psmt = DBConn.getConnection().prepareStatement(query);
			psmt.setString(1, pid);

			int result = psmt.executeUpdate();

			if (result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(psmt);
		}
		// 그렇지 않으면 false 반환
		return false;

	} // delete end

	// 제품 상세 조회
	public ProductVO select(String pid) {

		ProductVO pvo = null;
		try {
			query = "SELECT * FROM product WHERE PID=?"; // 쿼리문 아이디 조회하는
			psmt = DBConn.getConnection().prepareStatement(query);// 실행할 prepared

			psmt.setString(1, pid); // 물음표 바인딩 // 여기서 넘어온 mid

			rs = psmt.executeQuery(); // 실행한다. executeQuery 는 resultSet 으로 온다. 그래서 int로 받을 수 없다. 결과가 있기 때문에

			if (rs.next()) { // 조회된 레코드가 있다면 // == true 기본
				pvo = new ProductVO(); // MemberVO 객체를 생성하여
				pvo.setPid(rs.getString("pid"));
				pvo.setPimage(rs.getString("pimage"));
				pvo.setPname(rs.getString("pname"));
				pvo.setDescription(rs.getString("description")); // 해당 레코드 값을 저장
				pvo.setMaker(rs.getString("maker")); // 해당 레코드 값을 저장
				pvo.setCategory(rs.getString("category")); // 해당 레코드 값을 저장
				pvo.setStock(rs.getInt("stock"));
				pvo.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt);

		}
		return pvo;

	}

	// 제품 전체 조회
	public List<ProductVO> selectAll() {

		List<ProductVO> proList = new ArrayList<ProductVO>();

		ProductVO pvo = null;

		try {
			query = "SELECT * FROM product";
			psmt = DBConn.getConnection().prepareStatement(query); // 바인딩이 없으니 이것만 사용

			rs = psmt.executeQuery();

			while (rs.next()) { // . 여러 줄이니까 while
				pvo = new ProductVO(); // MemberVO 객체를 생성하여
				pvo.setPimage(rs.getString("pimage"));
				pvo.setPid(rs.getString("pid"));
				pvo.setPname(rs.getString("pname"));
				pvo.setDescription(rs.getString("description")); // 해당 레코드 값을 저장
				pvo.setPrice(rs.getInt("price"));

				proList.add(pvo); // list 객체에 추가
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt); // 사용한 코드가 rs와 psmt다. 이 두개를 닫기
		}
		return proList;

	}

}
