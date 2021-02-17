package forwiz.ems.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import forwiz.ems.domain.Dept;
import forwiz.ems.repository.DeptRepository;
import forwiz.ems.web.dto.DeptDto;

@Service
public class DeptService {

	@Autowired
	private DeptRepository deptRepository;
	
	//전체 부서 리스트 반환
	@Transactional(readOnly=true)
	public List<DeptDto> findAll(){
		List<Dept> listDept = deptRepository.findAll();
		List<DeptDto> listDeptDto = new ArrayList<DeptDto>();
		for ( int i=0 ; i< listDept.size() ; i++) {
			listDeptDto.add(new DeptDto(listDept.get(i)));
		}
		return listDeptDto;
	}
	//특정 부서명 -> 부서 번호 변환
	
	//특정 부서 번호 -> 부서명 변환
}
