package com.smhrd.domain;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	public List<workDTO> selectSearchWork(String w_kind,String searchText) {
		List<workDTO> selectWork=new ArrayList<>();
		searchText=searchText.trim();
		try {
			if(w_kind.equals("P")) {
				selectWork.addAll(sqlSession.selectList("selectSearchPestControlTitleWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchPestControlContentWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchPestControlExpertWork", searchText));
			}
			if(w_kind.equals("M")) {
				selectWork.addAll(sqlSession.selectList("selectSearchMeasureTitleWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchMeasureContentWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchMeasureExpertWork", searchText));
			}
			if(w_kind.equals("S")) {
				selectWork.addAll(sqlSession.selectList("selectSearchShootingTitleWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchShootingContentWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchShootingExpertWork", searchText));
			}
			if(w_kind.equals("T")) {
				selectWork.addAll(sqlSession.selectList("selectSearchTransportTitleWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchTransportContentWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchTransportExpertWork", searchText));
			}
			else{
				selectWork.addAll(sqlSession.selectList("selectSearchETCTitleWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchETCContentWork", searchText));
				selectWork.addAll(sqlSession.selectList("selectSearchETCExpertWork", searchText));
			}
			List<Integer> sortList=new ArrayList<>();
			for(int i=0;i<selectWork.size();i++) {
				for(int j=selectWork.size()-1;j>=1;j--) {						
					if(selectWork.get(i).getW_idx()==selectWork.get(j).getW_idx()) {
						sortList.add(j);
					}
				}
			}
			Collections.sort(sortList,Collections.reverseOrder());
			Set<Integer> set=new HashSet<Integer>(sortList);
			List<Integer> newList=new ArrayList<>(set);
			for(int i=0;i<newList.size();i++) {
				selectWork.remove(i);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return selectWork;
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
				System.out.println(update.getW_title());
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