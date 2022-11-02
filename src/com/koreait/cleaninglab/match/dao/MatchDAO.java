package com.koreait.cleaninglab.match.dao;

import org.apache.ibatis.session.SqlSession;
import java.util.List;
import com.koreait.mybatis.SqlMapConfig;

public class MatchDAO {
	SqlSession sqlsession;
	public MatchDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	public List<MatchListDTO> getMatchList(String workspace) {
		List<MatchListDTO> result = sqlsession.selectList("Match.matchlist", workspace);
		return result;
	}
	public MatchDTO getMatchInfo(String servicenum) {
		MatchDTO mdto = sqlsession.selectOne("Match.matchdetail", Integer.parseInt(servicenum));
		return mdto;
		
	}
	public boolean setMatching(MatchDTO mdto1) {
		int result = sqlsession.update("Match.setmatching", mdto1);
		return result == 1;
	}
	public MatchListDTO getResMatchDetail(String servicenum) {
		int servicenums = Integer.parseInt(servicenum);
		MatchListDTO result = sqlsession.selectOne("Match.matchdetailRes",servicenums );
		return result;
	}
	public MatchListDTO getParMatchDetail(String servicenum) {
		int servicenums = Integer.parseInt(servicenum);
		MatchListDTO result = sqlsession.selectOne("Match.matchdetailPar", servicenums);
		return result;
		
	}
	public List<MatchListDTO> getHistory(String manageremail) {
		List<MatchListDTO> result = sqlsession.selectList("Match.history", manageremail);
		return result;
	}
	public boolean cancel(String servicenum) {
		int result = sqlsession.update("Match.cancelmatch", Integer.parseInt(servicenum));
		return result == 1;
	}
	public List<MatchListDTO> getProgressList(String manageremail) {
		List<MatchListDTO> result = sqlsession.selectList("Match.progress", manageremail);
		return result;
	}
	public boolean visit(String servicenum) {
		int result = sqlsession.update("Match.visitmatch", Integer.parseInt(servicenum));
		return result == 1;
	}
	public boolean clean(String servicenum) {
		int result = sqlsession.update("Match.cleanmatch", Integer.parseInt(servicenum));
		return result == 1;
	}
	public boolean finish(String servicenum) {
		int result = sqlsession.update("Match.finishclean", Integer.parseInt(servicenum));
		return result == 1;
	}

}
