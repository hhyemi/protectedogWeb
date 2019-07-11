package org.protectedog.service.report.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Report;
import org.protectedog.service.report.ReportDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAOImpl implements ReportDAO{

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ReportDAOImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("ReportMapper.addReport", report);
	}

	@Override
	public Report getReport(int reportNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ReportMapper.getReport", reportNo);
	}

	@Override
	public List<Report> getReportList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReportMapper.getReportList", search);
	}

	@Override
	public void updateReportStatus(Report report) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("ReportMapper.updateReport", report);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ReportMapper.getTotalCount", search);
	}

}
