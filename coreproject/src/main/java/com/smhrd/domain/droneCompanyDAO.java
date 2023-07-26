package com.smhrd.domain;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;
public class droneCompanyDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public List<droneCompanyDTO> selectSaleDroneCompany() {
		List<droneCompanyDTO> saleDroneCompany=null;
		try {
			saleDroneCompany=sqlSession.selectList("selectSaleDroneCompany");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return saleDroneCompany;
	}
	public List<droneCompanyDTO> selectRepairDroneCompany() {
		List<droneCompanyDTO> repairDroneCompany=null;
		try {
			repairDroneCompany=sqlSession.selectList("selectRepairDroneCompany");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return repairDroneCompany;
	}
}