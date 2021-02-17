package forwiz.ems.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import forwiz.ems.domain.Emp;


public interface EmpRepository extends JpaRepository<Emp,String>{
	
	List<Emp> findByEmpNumContainingAndNameContainingAndDeptNum(String empNum, String Name, String deptNum);
	List<Emp> findByEmpNumContainingAndNameContaining(String empNum, String Name);
	Emp findByEmpNumAndPasswd(String empNum, String passwd);
	Emp findByEmpNum(String empNum);
}

/*
@Repository
public class EmpRepository {

    @PersistenceContext    // EntityManagerFactory가 DI 할 수 있도록 어노테이션 설정
    private EntityManager em;

    //사원 정보 전체 select
    public List<Emp> findAll(){
        String jpql = "SELECT e FROM FORWIZ_EMP e";
        TypedQuery<Emp> query = em.createQuery(jpql, Emp.class);
        return query.getResultList();
    }
    
    // 사원 조건 검색 select
    public List<Emp> findByCondition(String empNum, String name, String deptNum){
        String jpql = "SELECT e FROM FORWIZ_EMP e WHERE e.emp_num LIKE '%"+empNum+"%' and e.name LIKE '%"+name+"%' and e.dept_num LIKE '%"+deptNum+"%'";
        TypedQuery<Emp> query = em.createQuery(jpql, Emp.class);
        return query.getResultList();
    }
    
    // empNum으로 상세 정보 뽑기
    public Emp findByEmpNum(String empNum) {
        String jpql = "SELECT e FROM FORWIZ_EMP e WHERE e.emp_num = '"+empNum+"'";
        TypedQuery<Emp> query = em.createQuery(jpql, Emp.class);
        return query.getSingleResult();
    }
    
    // empNum이랑 passwd 확인하기
    public Emp findByEmpNumAndPasswd(String empNum, String passwd){
        String jpql = "SELECT e FROM EMP e WHERE e.empNum = '"+empNum+"' and e.passwd = '"+passwd+"'";
        TypedQuery<Emp> query = em.createQuery(jpql, Emp.class);
        return query.getSingleResult();
    }
}*/