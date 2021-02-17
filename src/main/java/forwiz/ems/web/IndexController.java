package forwiz.ems.web;

/**
 *  기능별 페이지 연결 Controller
 *  
 * - index 화면  : /index
 * - 등록 화면      : /register
 * - 상세보기 화면 : /detail)
 */

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import forwiz.ems.service.DeptService;
import forwiz.ems.service.EmpService;
import forwiz.ems.web.dto.DeptDto;
import forwiz.ems.web.dto.EmpDto;
import forwiz.ems.web.dto.EmpSearchDto;

@Controller
public class IndexController {
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private DeptService deptService;
	
	// 전체 목록 조회 - 메인화면
	@RequestMapping(value="/index")
	public String index(@ModelAttribute EmpSearchDto dto, Model model) {
		
		List<DeptDto> deptList = deptService.findAll();
		model.addAttribute("deptList",deptList);
		
		// 입력한 검색 조건이 없을때
		if ( dto.getEmpNum() == null && dto.getName() == null && dto.getDeptNum() == null) {
			List<EmpDto> empList = empService.findAll();
			model.addAttribute("empList",empList);
			return "index";
		}
		//있을때
		else {
			System.out.println(dto.getEmpNum()+dto.getName()+dto.getDeptNum());
			List<EmpDto> empList = empService.findByCondition(dto);
			model.addAttribute("empList",empList);
			model.addAttribute("searchName",dto.getName());
			model.addAttribute("searchEmpNum",dto.getEmpNum());
			model.addAttribute("searchDeptNum",dto.getDeptNum());
			return "index";
		}
	}
	
	// 등록화면
    @GetMapping("/register")
    public String registerEmp(Model model){
		List<DeptDto> deptList = deptService.findAll();
		model.addAttribute("deptList",deptList);
        return "register";
    }

	// 수정 화면
    @GetMapping("/update/{id}")
    public String updateEmp(@PathVariable String id, Model model,HttpSession session){
		List<DeptDto> deptList = deptService.findAll();
        EmpDto dto = empService.findById(id);
		model.addAttribute("deptList",deptList);
        model.addAttribute("empInfo",dto);
        model.addAttribute("id",session.getAttribute("id"));
        return "detail";
    }
}
