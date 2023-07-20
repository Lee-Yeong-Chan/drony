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
			cnt=sqlSession.insert("insertUser", joinUser);
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
}