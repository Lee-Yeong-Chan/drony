package com.smhrd.domain;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;
public class noticeDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public List<noticeDTO> selectAllNotice() {
		List<noticeDTO> NoticeList=null;
		try {
			NoticeList=sqlSession.selectList("selectAllNotice");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return NoticeList;
	}
	public List<noticeDTO> selectNotice(int idx) {
		List<noticeDTO> NoticeList=null;
		try {
			NoticeList=sqlSession.selectList("selectNotice", idx);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return NoticeList;
	}
	public int insertNotice(noticeDTO insert) {
		int cnt=0;
		try {
			cnt=sqlSession.insert("insertNotice", insert);
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
	public int updateNotice(noticeDTO update) {
		int cnt=0;
		try {
			if(update.getNotice_title()!=null) {
				cnt+=sqlSession.update("updateNoticeTitle", update);
			}
			if(update.getNotice_content()!=null) {
				cnt+=sqlSession.update("updateNoticeContent", update);
			}
			if(update.getNotice_file()!=null) {
				cnt+=sqlSession.update("updateNoticeFile", update);
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
	public int deleteNotice(int idx) {
		int cnt=0;
		try {
			cnt=sqlSession.delete("deleteNotice", idx);
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
	}public List<Integer> selectRecentNotice(noticeDTO noticeDTO) {
		List<Integer> selectRecentNoticeList=null;
		try {
			selectRecentNoticeList=sqlSession.selectList("selectRecentNotice", noticeDTO);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return selectRecentNoticeList;
	}
}