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
			cnt=sqlSession.update("updateExpertMypage", s);
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
	public List<expertDroneDTO> selectExpertDrone(String id) {
		List<expertDroneDTO> droneList=null;
		try {
			droneList=sqlSession.selectList("selectExpertDrone", id);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return droneList;
	}
	public int updateDrone(expertDroneDTO dr) {
		int cnt=0;
		try {
			if(dr.getDr_model()!=null) {
				cnt+=sqlSession.update("updateDroneModel", dr);
			}
			if(dr.getDr_maker()!=null) {
				cnt+=sqlSession.update("updateDroneMaker", dr);
			}
			if(dr.getDr_serial()!=null) {
				cnt+=sqlSession.update("updateDroneSerial", dr);
			}
			if(dr.getDr_desc()!=null) {
				cnt+=sqlSession.update("updateDroneDesc", dr);
			}
			if(dr.getDr_img()!=null) {
				cnt+=sqlSession.update("updateDroneImg", dr);
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
	public int deleteDrone(int d) {
		int cnt=0;
		try {
			cnt=sqlSession.delete("deleteDrone", d);
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
	public int insertDrone(expertDroneDTO insert) {
		int cnt=0;
		try {
			cnt=sqlSession.insert("insertDrone", insert);
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
	public List<workDTO> selectPost(String id) {
		List<workDTO> postList=null;
		try {
			postList=sqlSession.selectList("selectPost", id);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return postList;
	}
	public int selectPostToUser(String id) {
		int cnt=0;
		try {
			cnt=sqlSession.selectOne("selectPostToUser", id);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return cnt;
	}
	public int insertWorkUserMypage(userWorkDTO insert, workDTO workDTO) {
		int cnt1=0, cnt2=0;
		int cnt=0;
		try {
			cnt1=sqlSession.insert("insertWorkUserMypage", insert);
			cnt2=sqlSession.insert("insertUserMypage", workDTO);
			cnt=cnt1*cnt2;
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
	public int deleteWorkUserMypage(int d) {
		int cnt=0;
		try {
			cnt=sqlSession.delete("deleteWorkUserMypage", d);
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