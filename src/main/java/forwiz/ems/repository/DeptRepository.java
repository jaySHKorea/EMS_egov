package forwiz.ems.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import forwiz.ems.domain.Dept;

public interface DeptRepository extends JpaRepository<Dept,String>{

	
}
