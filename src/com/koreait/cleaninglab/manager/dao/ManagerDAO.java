package com.koreait.cleaninglab.manager.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import com.koreait.mybatis.SqlMapConfig;

public class ManagerDAO {
	SqlSession sqlsession;

	public ManagerDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean join(ManagerDTO newManager) {
		int result = sqlsession.insert("Manager.join", newManager);
		return result == 1;
	}

	public boolean checkEmail(String manageremail) {
		int result = 1;
		result = sqlsession.selectOne("Manager.checkEmail", manageremail);
		return result == 0;
	}

	public ManagerDTO login(String manageremail, String managerpw) {
		ManagerDTO result = null;
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("manageremail", manageremail);
		datas.put("managerpw", managerpw);
		result = sqlsession.selectOne("Manager.login", datas);
		return result;
	}

	public boolean deleteManager(String manageremail) {
		int result = sqlsession.delete("Manager.delete", manageremail);
		return result == 1;
	}

	public ManagerDTO getData(String manageremail) {
		ManagerDTO result = sqlsession.selectOne("Manager.getData", manageremail);
		return result;
	}

	public boolean updatepw(ManagerDTO updatePw) {
		int result = sqlsession.update("Manager.updatePw", updatePw);
		return result == 1;
	}

	public boolean updateaddr(ManagerDTO updateAddr) {
		int result = sqlsession.update("Manager.updateAddr", updateAddr);
		return result == 1;
	}

	public boolean updatebank(ManagerDTO updateBank) {
		int result = sqlsession.update("Manager.updateBank", updateBank);
		return result == 1;
	}

	public boolean updatephone(ManagerDTO updatePhone) {
		int result = sqlsession.update("Manager.updatePhone", updatePhone);
		return result == 1;
	}

	public boolean updateworkspace(ManagerDTO updateWorkspace) {
		int result = sqlsession.update("Manager.updateWorkspace", updateWorkspace);
		return result == 1;
	}

	public ManagerDTO reLogin(String manageremail) {
		ManagerDTO result = null;
		result = sqlsession.selectOne("Manager.relogin", manageremail);
		return result;
	}

	public boolean setEducount(String manageremail) {
		return 1 == sqlsession.delete("Manager.educntplus", manageremail);
	}

	public boolean setEducountUpdate(String manageremail) {
		int result = sqlsession.update("Manager.setUpdateEduCnt", manageremail);
		return result == 1;

	}

	public boolean setEducountDelete(String manageremail) {
		int result = sqlsession.update("Manager.setDeleteEduCnt", manageremail);
		return result == 1;
	}

	public String findEmail(String managername, String managerphone) {
		String result;
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("managername", managername);
		datas.put("managerphone", managerphone);
		result = sqlsession.selectOne("Manager.findEmail", datas);
		return result;
	}

	public boolean findPw(String manageremail) {
		int result = 0;
		result = sqlsession.selectOne("Manager.findPw", manageremail);
		return result == 1;
	}

	public boolean changePw(ManagerDTO changeManager) {
		int result = sqlsession.update("Manager.changePw", changeManager);
		return result == 1;
	}

}
