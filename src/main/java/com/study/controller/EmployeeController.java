package com.study.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.pojo.Employee;
import com.study.pojo.EmployeeExample;
import com.study.pojo.Msg;
import com.study.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    /**
     * 分页查询所有员工，保存在model中
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        //该方法后紧跟的查询操作是分页查询；pn是页码；5是每页显示的数量
        PageHelper.startPage(pn,7);
        List<Employee> list = employeeService.getAll();

//      pageInfo中封装了查询出来的关于页的详细信息,5是连续显示的页数
        PageInfo page = new PageInfo(list,7);

        model.addAttribute("pageInfo",page);

        return "list";
    }

    /**
     * 分页查询所有员工并以JSON的方式返回
     * @param pn
     * @return
     */
    @ResponseBody
    @RequestMapping("/empsJson")
    public Msg getEmpsJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        //该方法后紧跟的查询操作是分页查询；pn是页码；5是每页显示的数量
        PageHelper.startPage(pn,7);
        List<Employee> list = employeeService.getAll();

//      pageInfo中封装了查询出来的关于页的详细信息,5是连续显示的页数
        PageInfo page = new PageInfo(list,7);
        return Msg.success().add("pageInfo",page);

    }

    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
//Valid进行校验；BindingResult封装校验结果
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map = new HashMap<>();

            for(FieldError fieldError : result.getFieldErrors()){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }
        employeeService.addEmp(employee);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping("/checkEmail")
    public Msg checkEmail(String email){
        if(!email.matches("^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$")){
            return Msg.fail().add("va_msg","邮箱格式不正确");
        }
        boolean b = employeeService.checkEmail(email);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","邮箱已存在");
        }
    }
    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);

    }
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee){
        String email = employee.getEmail();
        if(!email.matches("^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$")){
            return Msg.fail().add("va_msg","邮箱格式不正确");
        }
        boolean b = employeeService.checkUpdateEmail(email,employee.getEmpId());
        System.out.println(b);
        if(b){
            employeeService.updateEmpById(employee);
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","邮箱已存在");
        }
    }

    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            String[] split = ids.split("-");
            List<Integer> id = new ArrayList<>();
            for(String strId : split){
                id.add(Integer.parseInt(strId));
            }
            employeeService.deleteEmp(id);
            return Msg.success();
        }else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
            return Msg.success();
        }

    }
}
