import com.study.dao.DepartmentMapper;
import com.study.dao.EmployeeMapper;
import com.study.pojo.Department;
import com.study.pojo.Employee;
import com.study.service.EmployeeService;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.UUID;

public class TestDao {
    @Test
    public void test01(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        DepartmentMapper departmentMapper = ioc.getBean(DepartmentMapper.class);
//        Department department = new Department();
//        department.setDeptId(1);
//        department.setDeptName("开发部");
//        departmentMapper.insert(department);
//        departmentMapper.insertSelective(new Department(null,"管理部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));
//        System.out.println(departmentMapper.selectByPrimaryKey(1));
//        System.out.println(departmentMapper.selectByPrimaryKey(2));
//        System.out.println(departmentMapper.selectByPrimaryKey(3));
    }


    @Test
    public void test02(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        EmployeeMapper employeeMapper = ioc.getBean(EmployeeMapper.class);
        SqlSession sqlSession = ioc.getBean(SqlSession.class);
//        可以执行批量操作的employeeMapper
        EmployeeMapper employeeMapper1 = sqlSession.getMapper(EmployeeMapper.class);
        for(int i = 0;i<1000;i++){
            String uid = UUID.randomUUID().toString().substring(0, 5);
            employeeMapper1.insertSelective(new Employee(null,uid,i/2==0?"M":"F",uid+"@qq.com",i%3+1));
        }
    }
    @Test
    public void test03(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        EmployeeService employeeMapper = ioc.getBean(EmployeeService.class);
        EmployeeMapper employeeMapper = ioc.getBean(EmployeeMapper.class);
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
//        List<Employee> employee = employeeMapper.getAll();

        System.out.println(employees);
    }
}
