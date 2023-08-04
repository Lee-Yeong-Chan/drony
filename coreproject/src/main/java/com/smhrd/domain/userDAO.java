package com.smhrd.domain;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;
public class userDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public int insertUser(userDTO joinUser) {
		int cnt=0;
		try {
			cnt=sqlSession.insert("selectUserLogin", joinUser);
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
	public userDTO selectUser(userDTO login) {
		userDTO loginUser=null;
		try {
			loginUser=sqlSession.selectOne("selectUser", login);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return loginUser;
	}
	public int selectUserId(String user_id) {
		int loginUser=0;
		try {
			loginUser=sqlSession.selectOne("selectUserId", user_id);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return loginUser;
	}
	public int updateUser(userDTO updateUser) {
		int cnt=0;
		try {
			if(updateUser.getUser_pw()!=null) {
				cnt+=sqlSession.update("updateUserPw", updateUser);
			}
			if(updateUser.getUser_name()!=null) {
				cnt+=sqlSession.update("updateUserName", updateUser);
			}
			if(updateUser.getUser_email()!=null) {
				cnt+=sqlSession.update("updateUserEmail", updateUser);
			}
			if(updateUser.getUser_phone()!=null) {
				cnt+=sqlSession.update("updateUserPhone", updateUser);
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
	public int deleteUser(String user_id) {
		int cnt=0;
		try {
			cnt=sqlSession.delete("deleteUser", user_id);
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
	public userDTO selectUserInquiry(String user_id) {
		userDTO UserInquiry=null;
		try {
			UserInquiry=sqlSession.selectOne("selectUser", user_id);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return UserInquiry;
	}
}