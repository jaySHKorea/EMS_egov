package forwiz.ems.web;

/**
 *   직원 API 처리 Controller
 * 
 * - 직원 등록 : /api/v1/emp
 * - 직원 수정 : /api/v1/update/{id}
 * - 직원 삭제 : /api/v1/delete/{id}, /api/v1/delete
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import forwiz.ems.service.EmpService;
import forwiz.ems.web.dto.EmpSaveDto;
import forwiz.ems.web.dto.EmpUpdateDto;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService empService;
	
	//등록
	@PostMapping("/api/v1/emp")
	public String insert(@ModelAttribute EmpSaveDto saveDto) {
		saveDto.setPasswd("000000");
		empService.insert(saveDto);
		return "redirect:/index";
	}
	
	//수정
	@PutMapping("/api/v1/update/{id}")
	public String update(@PathVariable String id, @ModelAttribute EmpUpdateDto updateDto) {
		System.out.println(updateDto.getDeptNum()+" "+id);
		empService.update(id, updateDto);
		return "redirect:/index";
	}
	
	//삭제 - 단일 데이터
	@DeletetMapping("/api/v1/delete/{id}")
	public String delete(@PathVariable String id) {
		empService.delete(id);
		return "redirect:/index";
	}
	
	//삭제 - 여러개
	@DeleteMapping("/api/v1/delete")
	public String delete(@RequestParam(value="empChkList[]") List<String> ids) {
		for ( int i = 0 ; i < ids.size() ; i++) {
			empService.delete(ids.get(i));
		}
		return "redirect:/index";
	}
}
