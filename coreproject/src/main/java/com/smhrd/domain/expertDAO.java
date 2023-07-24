package com.smhrd.domain;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;
public class expertDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public int insertExpert(expertDTO joinExpert) {
		int cnt=0;
		try {
			cnt=sqlSession.insert("insertExpert", joinExpert);
			if(cnt>0) {
				sqlSession.commit();
			}
			else {
				sqlSession.rollback();
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return cnt;
	}
	public expertDTO selectExpert(expertDTO login) {
		expertDTO loginExpert=null;
		try {
			loginExpert=sqlSession.selectOne("selectExpert", login);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return loginExpert;
	}
	public int updateExpert(expertDTO updateExpert) {
		int cnt=0;
		try {
			if(updateExpert.getExp_pw()!=null) {
				cnt+=sqlSession.update("updateExpertPw", updateExpert);
			}
			if(updateExpert.getExp_name()!=null) {
				cnt+=sqlSession.update("updateExpertName", updateExpert);
			}
			if(updateExpert.getExp_email()!=null) {
				cnt+=sqlSession.update("updateExpertEmail", updateExpert);
			}
			if(updateExpert.getExp_phone()!=null) {
				cnt+=sqlSession.update("updateExpertPhone", updateExpert);
			}
			if(updateExpert.getBno()!=null) {
				cnt+=sqlSession.update("updateExpertBno", updateExpert);
			}
			if(updateExpert.getCompany_name()!=null) {
				cnt+=sqlSession.update("updateExpertCompany_name", updateExpert);
			}
			if(updateExpert.getCompany_addr()!=null) {
				cnt+=sqlSession.update("updateExpertCompany_addr", updateExpert);
			}
			if(updateExpert.getWorking_area()!=null) {
				cnt+=sqlSession.update("updateExpertWorking_area", updateExpert);
			}
			if(updateExpert.getWorking_field()!=null) {
				cnt+=sqlSession.update("updateExpertWorking_field", updateExpert);
			}
			if(cnt>0) {
				sqlSession.commit();
			}
			else {
				sqlSession.rollback();
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return cnt;
	}
}