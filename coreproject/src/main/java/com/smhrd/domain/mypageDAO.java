package com.smhrd.domain;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;
public class mypageDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public List<mypageDTO> selectUserMypage(String id) {
		List<mypageDTO> mypageList=null;
		try {
			mypageList=sqlSession.selectList("selectUserMypage", id);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return mypageList;
	}
	public List<mypageDTO> selectExpertMypage(String id) {
		List<mypageDTO> mypageList=null;
		try {
			mypageList=sqlSession.selectList("selectExpertMypage", id);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return mypageList;
	}
	public int updateMypage(mypageDTO s) {
		int cnt=0;
		try {
			cnt=sqlSession.update("updateMypage", s);
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