package egovframework.board.service;

import org.apache.ibatis.type.MappedTypes;

public enum QBoardCategory {
	USER("회원/로그인"),
	RENTAL("예약"),
	PLACE("대여소"),
	ETC("기타");
	
	private String category;
	
	private QBoardCategory(String category) {
		this.category=category;
	}

	public String getCategory() {
		return category;
	}
	
//해당 method가 다룰 Class를 명시
	//Mapper에서 typeHandler 값으로 선언한 handler가 다루게 될 Class가 QBoardCategory
	@MappedTypes(QBoardCategory.class)
	public static class TypeHnadlder extends QBoardCategoryTypeHandler<QBoardCategory> {
		public TypeHnadlder() {
			super(QBoardCategory.class);
		}
	}
}
