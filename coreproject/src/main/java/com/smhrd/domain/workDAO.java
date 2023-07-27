package com.smhrd.domain;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;
public class workDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public List<workDTO> selectAllWork(String kind) {
		List<workDTO> allWork=null;
		try {
			allWork=sqlSession.selectList("selectAllWork", kind);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return allWork;
	}
	public List<workDTO> selectWork(int idx) {
		List<workDTO> selectWork=null;
		try {
			selectWork=sqlSession.selectList("selectWork", idx);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return selectWork;
	}
	public int insertWork(workDTO insert) {
		int cnt=0;
		try {
			if(insert.getW_file()==null&&insert.getW_img()==null) {
				cnt+=sqlSession.insert("insertWorkEmpty", insert);
			}
			else if(insert.getW_file()==null) {
				cnt+=sqlSession.insert("insertWorkImg", insert);
			}
			else if(insert.getW_img()==null) {
				cnt+=sqlSession.insert("insertWorkFile", insert);
			}
			else{
				cnt+=sqlSession.insert("insertWorkAll", insert);
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
	public int updateWork(workDTO update) {
		int cnt=0;
		try {
			if(update.getW_title()!=null) {
				cnt+=sqlSession.update("updateWorkTitle", update);
			}
			if(update.getW_content()!=null) {
				cnt+=sqlSession.update("updateWorkContent", update);
			}
			if(update.getW_file()!=null) {
				cnt+=sqlSession.update("updateWorkFile", update);
			}
			if(update.getW_price()!=0) {
				cnt+=sqlSession.update("updateWorkPrice", update);
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
	public int deleteWork(int idx) {
		int cnt=0;
		try {
			cnt=sqlSession.delete("deleteWork", idx);
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
	public List<Integer> selectRecentWork(workDTO workDTO) {
		List<Integer> selectRecentWork=null;
		try {
			selectRecentWork=sqlSession.selectList("selectRecentWork", workDTO);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return selectRecentWork;
	}
}