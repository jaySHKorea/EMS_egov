package forwiz.ems.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import forwiz.ems.domain.Emp;
import forwiz.ems.repository.EmpRepository;
import forwiz.ems.web.dto.EmpDto;
import forwiz.ems.web.dto.EmpSaveDto;
import forwiz.ems.web.dto.EmpSearchDto;
import forwiz.ems.web.dto.EmpUpdateDto;
import forwiz.ems.web.dto.LoginDto;

@Service
public class EmpService {
	
	//레포지토리
	@Autowired
	private EmpRepository empRepository;
	
	// 로그인 유효계정 체크
	@Transactional(readOnly = true)
	public boolean exist(LoginDto dto) {
		Emp exist = empRepository.findByEmpNumAndPasswd(dto.getId(),dto.getPasswd());
		System.out.println(dto.getPasswd());
		if ( exist != null ) {
			return true;
		}
		return false;
	}

	// 직원 전체 리스트 읽어오기
	@Transactional(readOnly = true)
	public List<EmpDto> findAll() {
		List<Emp> listEmp = empRepository.findAll();
		List<EmpDto> listEmpDto = new ArrayList<EmpDto>();
		for (int i=0 ; i<listEmp.size();i++) {
			if (listEmp.get(i).getEmpNum().equals("admin")) continue;
			listEmpDto.add(new EmpDto(listEmp.get(i)));
		}
		return listEmpDto;
	}
	
	// 직원 조건 검색해서 불러오기
	@Transactional(readOnly = true)
	public List<EmpDto> findByCondition(EmpSearchDto dto){
		List<Emp> listEmp = null;
		if (!dto.getDeptNum().equals(""))
			listEmp = empRepository.findByEmpNumContainingAndNameContainingAndDeptNum(dto.getEmpNum(), dto.getName(), dto.getDeptNum());
		else
			listEmp = empRepository.findByEmpNumContainingAndNameContaining(dto.getEmpNum(), dto.getName());
		List<EmpDto> listEmpDto = new ArrayList<EmpDto>();
		for (int i=0 ; i<listEmp.size();i++) {
			if (listEmp.get(i).getEmpNum().equals("admin")) continue;
			listEmpDto.add(new EmpDto(listEmp.get(i)));
		}
		return listEmpDto;
	}

	// 직원 사번으로  detail 정보 뽑기
	@Transactional
	public EmpDto findById(String emp_num) {
		Emp entity = empRepository.findByEmpNum(emp_num);
		return new EmpDto(entity);
	}
	
	
	//----------------------------------- 등록/삭제/수정 기능 ---------------------------------------
	@Transactional
	public String insert(EmpSaveDto saveDto) {
		empRepository.save(saveDto.toEntity());
		return saveDto.getName();
	}
	
	@Transactional
	public String update(String id, EmpUpdateDto updateDto) {
		Emp emp = empRepository.findByEmpNum(id);
		if ( emp != null) {
			emp.update(updateDto);
		}
		return id;
	}
	
	@Transactional
	public void delete(String id) {
		Emp emp = empRepository.findByEmpNum(id);
		if ( emp != null ) {
			empRepository.delete(emp);
		}
	}
}
