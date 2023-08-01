package com.smhrd.domain;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;
public class chatDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public List<chatDTO> selectEachChattingRoom(int cr_idx) {
		List<chatDTO> eachRoom=null;
		try {
			eachRoom=sqlSession.selectList("EachChattingRoom", cr_idx);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return eachRoom;
	}
	public int submit(chatDTO chatDTO) {
		int cnt=0;
		try {
			cnt=sqlSession.insert("SubmitChatting", chatDTO);
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