package com.smhrd.domain;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;
public class inquiryDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public List<userInquiryDTO> selectAllUserInquiry(String user_id) {
		List<userInquiryDTO> InquiryList=null;
		try {
			InquiryList=sqlSession.selectList("selectAllUserInquiry", user_id);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return InquiryList;
	}
	public List<userInquiryDTO> selectUserInquiry(int idx) {
		List<userInquiryDTO> userInquiryList=null;
		try {
			userInquiryList=sqlSession.selectList("selectUserInquiry", idx);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return userInquiryList;
	}
	public int insertUserInquiry(userInquiryDTO insert) {
		int cnt=0;
		try {
			if(insert.getInq_file()!=null) {
				cnt+=sqlSession.insert("insertUserInquiry", insert);
			}
			else {
				cnt+=sqlSession.insert("insertUserInquiryEmpty", insert);
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
	public int updateUserInquiry(userInquiryDTO update) {
		int cnt=0;
		try {
			if(update.getInq_title()!=null) {
				cnt+=sqlSession.update("updateUserInquiryTitle", update);
			}
			if(update.getInq_content()!=null) {
				cnt+=sqlSession.update("updateUserInquiryContent", update);
			}
			if(update.getInq_file()!=null) {
				cnt+=sqlSession.update("updateUserInquiryFile", update);
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
	public int deleteUserInquiry(int idx) {
		int cnt=0;
		try {
			cnt=sqlSession.delete("deleteUserInquiry", idx);
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
	public List<Integer> selectRecentUserInquiry(userInquiryDTO userInquiryDTO) {
		List<Integer> selectRecentUserInquiryList=null;
		try {
			selectRecentUserInquiryList=sqlSession.selectList("selectRecentUserInquiry", userInquiryDTO);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return selectRecentUserInquiryList;
	}
	public List<expertInquiryDTO> selectAllExpertInquiry(String Exp_id) {
		List<expertInquiryDTO> expertInquiryList=null;
		try {
			expertInquiryList=sqlSession.selectList("selectAllExpertInquiry", Exp_id);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return expertInquiryList;
	}
	public List<expertInquiryDTO> selectExpertInquiry(int idx) {
		List<expertInquiryDTO> expertInquiryList=null;
		try {
			expertInquiryList=sqlSession.selectList("selectExpertInquiry", idx);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return expertInquiryList;
	}
	public int insertExpertInquiry(expertInquiryDTO insert) {
		int cnt=0;
		try {
			if(insert.getInq_file()!=null) {
				cnt+=sqlSession.insert("insertExpertInquiry", insert);
			}
			else {
				cnt+=sqlSession.insert("insertExpertInquiryEmpty", insert);
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
	public int updateExpertInquiry(expertInquiryDTO update) {
		int cnt=0;
		try {
			if(update.getInq_title()!=null) {
				cnt+=sqlSession.update("updateExpertInquiryTitle", update);
			}
			if(update.getInq_content()!=null) {
				cnt+=sqlSession.update("updateExpertInquiryContent", update);
			}
			if(update.getInq_file()!=null) {
				cnt+=sqlSession.update("updateExpertInquiryFile", update);
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
	public int deleteExpertInquiry(int idx) {
		int cnt=0;
		try {
			cnt=sqlSession.delete("deleteExpertInquiry", idx);
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
	public List<Integer> selectRecentExpertInquiry(expertInquiryDTO expertInquiryDTO) {
		List<Integer> selectRecentExpertInquiryList=null;
		try {
			selectRecentExpertInquiryList=sqlSession.selectList("selectRecentExpertInquiry", expertInquiryDTO);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return selectRecentExpertInquiryList;
	}
}