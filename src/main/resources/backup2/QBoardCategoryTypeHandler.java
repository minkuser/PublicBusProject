package egovframework.board.service;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeException;
import org.apache.ibatis.type.TypeHandler;

public class QBoardCategoryTypeHandler<E extends Enum<E>> implements TypeHandler<QBoardCategory> {
	private Class<E> type;
	
	public QBoardCategoryTypeHandler() {}
	
	public QBoardCategoryTypeHandler(Class<E> type) {
		this.type=type;
	}

	
//QBoardCategory 타입의 객체가 DB의 데이터로 매핑될 때 동작
	@Override
	public void setParameter(PreparedStatement ps, int i, QBoardCategory category, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, category.getCategory());
	}

//DB의 데이터가 QBoardCategory 타입의 객체로 매핑될 때 동작	
	@Override
	public QBoardCategory getResult(ResultSet rs, String columnName) throws SQLException {
		String category=rs.getString(columnName);
		return getQBoardCategory(category);
	}

	@Override
	public QBoardCategory getResult(ResultSet rs, int columnIndex) throws SQLException {
		String category=rs.getString(columnIndex);
		return getQBoardCategory(category);
	}

	@Override
	public QBoardCategory getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String category=cs.getString(columnIndex);
		return getQBoardCategory(category);
	}
	
	
	private QBoardCategory getQBoardCategory(String category) {
		try {
			QBoardCategory[] enumConstants=(QBoardCategory[])type.getEnumConstants();
			for(QBoardCategory qBoardCategory:enumConstants) {
				if(qBoardCategory.getCategory()==category) {
					return qBoardCategory;
				}
			}
			return null;
			
		} catch (Exception e) {
			throw new TypeException("Can't make enum object '" + type + "'", e);
		}

	}
}
