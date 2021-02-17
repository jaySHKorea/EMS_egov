package forwiz.ems.web;

/**
 *   로그인 처리 컨트롤러
 *   
 * - 로그인 화면 : /login
 * - 로그인 처리 : /loginCheck.do
 * - 로그아웃 처리 : /logout.do
 */

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import forwiz.ems.service.EmpService;
import forwiz.ems.web.dto.LoginDto;

@Controller
public class LoginController {

	@Autowired
	private EmpService empService;
	
	// 로그인
	@RequestMapping(value="/login")
	public String login(HttpSession session) {
		if ( session.getAttribute("id") != null) {
			return "redirect:/index";
		}else {
			return "login";
		}
	}
	
	// 로그인 처리
	@RequestMapping(value="/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute LoginDto dto, HttpSession session) {
		
		boolean result = empService.exist(dto);
		ModelAndView mav = new ModelAndView();
		
		if ( result ) {
			mav.setViewName("redirect:/index");
			mav.addObject("msg","success");
			session.setAttribute("id", dto.getId());
		}
		else {
			mav.setViewName("login");
			mav.addObject("msg","failed");
		}
		return mav;
	}
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
}
