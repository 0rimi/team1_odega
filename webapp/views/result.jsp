<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.OdegaTheme_DAO" %>
<%@ page import="test.OdegaTheme_DTO" %>


<!DOCTYPE html>
<html lang="ko">
<%

	int s_1 = 0 ; 
	int s_2 = 1 ; 
	 
	OdegaTheme_DTO OdegaTheme_DTO = new OdegaTheme_DTO() ; 
	
//서치 기능 사용해서 결과 배열 하기...(검색 테이블 필요하나요?)
//     dao = OdegaTheme_DAO.OdegaTheme_list(s_1, s_2) ; // .getInstance();

	
//	if (product == null) {
//		response.sendRedirect("exceptionNoProductId.jsp");
//	}

//	ArrayList<Product> goodsList = dao.getAllProducts();
//	Product goods = new Product();
//	for (int i = 0; i < goodsList.size(); i++) {
//		goods = goodsList.get(i);
//		if (goods.getProductId().equals(id)) { 			
//			break;
//		}
//	}
	
//	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
//	if (list == null) { 
//		list = new ArrayList<Product>();
//		session.setAttribute("cartlist", list);
//	}

	int cnt = 0;
//	Product goodsQnt = new Product();

//	for (int i = 0; i < list.size(); i++) {
		/*		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}
*/

//	response.sendRedirect("product.jsp?id=" + id);
%>
