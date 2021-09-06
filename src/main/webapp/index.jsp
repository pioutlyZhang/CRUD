<%--
  Created by IntelliJ IDEA.
  User: 皮欧托利亚
  Date: 2021/8/8
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>员工列表</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>

    <%--    <script src="../../static/js/jquery-1.7.2.js"/>--%>
    <%--    <script type="text/javascript" src="../../static/js/jquery-1.7.2.js"></script>--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmpName" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="inputEmpName" placeholder="请输入3-16位大小写字母数字下划线的组合或者2-5位汉字">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inputGender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inputGender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="inputEmail" placeholder="abc@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工部门</label>
                        <div class="col-sm-10">
                            <select name="dId" class="form-control" id="inputDept">

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">添加</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改的Modal -->
<div class="modal fade" id="emp_update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabelUpdate">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="updateEmpName" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="updateEmpName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="updateGender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="updateGender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateEmail" class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="updateEmail" placeholder="abc@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工部门</label>
                        <div class="col-sm-10">
                            <select name="dId" class="form-control" id="updateDept">

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>--%>
<div class="container">
    <div class="row">
        <div class="col-lg-12"><h1>CRUD</h1></div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_btn">删除</button>
        </div>
    </div>

    <div class="row">
        <table class="table table-hover" id="emp_table">
            <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>员工编号</th>
                    <th>员工姓名</th>
                    <th>员工性别</th>
                    <th>员工邮箱</th>
                    <th>员工部门</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
            
        </table>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h4 class="text-primary" id="page_Msg">

            </h4>
            
        </div>
        <div class="col-md-6 col-md-offset-6" id="page_nav">


        </div>
    </div>
</div>
<script type="text/javascript">
    var lastPage;
    var current_page;
    var pageCount;
    $(function () {
        alter_page(1);
    });
    function alter_page(pn){
        $.ajax({
            url:"empsJson",
            data:"pn=" + pn,
            type:"get",
            success:function (result) {
                table(result);
                pageInfo(result);
                page(result);
            }
        })
    }
    function table(result){
        $("#emp_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            var empId = $("<td></td>").append(item.empId);
            var empName = $("<td></td>").append(item.empName);
            var empGender = $("<td></td>").append(item.gender==="F"?"女":"男");
            var empEmail = $("<td></td>").append(item.email);

            var empDepartment = $("<td></td>").append(item.department.deptName);
            var edit = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").
            append($("<span></span>").addClass("glyphicon glyphicon-pencil")
                .append("编辑"));
            edit.attr("empId",item.empId);
            var del = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").
            append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
            del.attr("empId",item.empId);
            var but = $("<td></td>").append(del).append(" ").append(edit);
            $("<tr></tr>").append($("<td><input type='checkbox' class='check_item'></input></td>"))
                .append(empId).append(empName)
                .append(empGender).append(empEmail)
                .append(empDepartment).append(but)
                .appendTo($("#emp_table tbody"));
        })
        pageCount=result.extend.pageInfo.size;
    }
    function pageInfo(result){
        $("#page_Msg").empty();
        $("#page_Msg").append("当前为第"+result.extend.pageInfo.pageNum
            +"页，共"+result.extend.pageInfo.pages
            +"页，"+result.extend.pageInfo.total+"条记录：")
        lastPage=result.extend.pageInfo.pages+1;
        current_page=result.extend.pageInfo.pageNum;
    }
    function page(result){
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPage = $("<li></li>").append($("<a></a>").append("首页"));
        firstPage.click(function () {
            alter_page(1);
        });


        var lastPage = $("<li></li>").append($("<a></a>").append("末页"));
        lastPage.click(function () {
            alter_page(result.extend.pageInfo.pages);
        });


        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));



        var aftPage = $("<li></li>").append($("<a></a>").append("&raquo;"));


        if(result.extend.pageInfo.hasPreviousPage){
            prePage.click(function () {
                alter_page(result.extend.pageInfo.prePage);
            });
            ul.append(firstPage).append(prePage);
        }else{
            prePage.addClass("disabled")
            ul.append(prePage);
        }

        $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
            var page = $("<li></li>").append($("<a></a>").append(item));
            if(item == result.extend.pageInfo.pageNum){
                page.addClass("active");
            }else{
                page.click(function (){
                    alter_page(item)
                });
            }
            ul.append(page);
        });

        if(result.extend.pageInfo.hasNextPage){
            aftPage.click(function () {
                alter_page(result.extend.pageInfo.nextPage);
            });
            ul.append(aftPage).append(lastPage);
        }else{
            aftPage.addClass("disabled")
            ul.append(aftPage);
        }

        var page_nav = $("<nav></nav>").append(ul).appendTo($("#page_nav"));
    }

    function clear_form(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }


    $("#emp_add_btn").click(function () {
        clear_form("#emp_add_modal form");
        getDepts("#inputDept");
        $("#emp_add_modal").modal({
            backdrop:"static"
        });
    })

    function getDepts(ele){
        $(ele).empty();
        $.ajax({
            url:"depts",
            type: "get",
            success(result){
                $.each(result.extend.depts,function (index,item) {
                    $("<option></option>").append(item.deptName).attr("value",item.deptId).appendTo(ele);
                })
            }
        })
    }
    function validate_form_show(elem,state,msg){
        $(elem).parent().removeClass("has-success has-error");
        if("success"==state){
            $(elem).parent().addClass("has-success");
            $(elem).next("span").text(msg);
        }else if("error"==state){
            $(elem).parent().addClass("has-error");
            $(elem).next("span").text(msg);
        }
    }
    function validate_form(){
        var e_name = $("#inputEmpName").val();
        var name_parttn = /(^[a-zA-Z0-9_-]{3,16}$)|([\u4e00-\u9fa5]{2,5}$)/
        if(!name_parttn.test(e_name)){
            // alert("员工姓名请输入3-16位大小写字母数字下划线的组合或者2-5位汉字")
            validate_form_show("#inputEmpName","error","员工姓名请输入3-16位大小写字母数字下划线的组合或者2-5位汉字")
            // $("#inputEmpName").parent().addClass("has-error");
            // $("#inputEmpName").next("span").text("员工姓名请输入3-16位大小写字母数字下划线的组合或者2-5位汉字");
            return false;
        }else{
            validate_form_show("#inputEmpName","success","");
            // $("#inputEmpName").parent().addClass("has-success");
            // $("#inputEmpName").next("span").text("");
        }
        var e_email= $("#inputEmail").val();
        var email_parttn=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!email_parttn.test(e_email)){
            // alert("请输入正确的邮箱格式")
            validate_form_show("#inputEmail","error","请输入正确的邮箱格式");
            return false;
        }else{
            validate_form_show("#inputEmail","success","");
        }
        return true;
    };
    $("#emp_save_btn").click(function () {
        if(!validate_form()){
            return false;
        }
        if("success"!=$(this).attr("va")){
            return false;
        }
        $.ajax({
            url:"emp",
            type:"post",
            data: $("#emp_add_modal form").serialize(),
            success(result){
                if(result.code==100){
                    $("#emp_add_modal").modal('hide');
                    alter_page(lastPage);
                }else{
                    if(result.extend.errorField.email != undefined){
                        validate_form_show("#inputEmail","error",result.extend.errorField.email);
                    }
                    if(result.extend.errorField.empName != undefined){
                        validate_form_show("#inputEmpName","error",result.extend.errorField.empName)

                    }
                }

            }
        });
    })
    $("#inputEmail").change(function () {
        var email = this.value;
        $.ajax({
            url:"checkEmail",
            type:"post",
            data: "email=" + email,
            success(result){
                if(result.code==100){
                    validate_form_show("#inputEmail","success","邮箱可用");
                    $("#emp_save_btn").attr("va","success");
                }else if(result.code==200){
                    validate_form_show("#inputEmail","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("va","fail");
                }
            }
        });
    })
    $("#updateEmail").change(function () {
        var email = this.value;
        $.ajax({
            url:"checkEmail",
            type:"post",
            data: "email=" + email,
            success(result){
                if(result.code==100){
                    validate_form_show("#updateEmail","success","");
                }else if(result.code==200){
                    validate_form_show("#updateEmail","error",result.extend.va_msg);
                }
            }
        });
    })
    $(document).on("click",".edit_btn",function () {
        getDepts("#updateDept");
        getEmp($(this).attr("empId"));
        $("#emp_update_modal form").find("*").removeClass("has-success has-error");
        $("#emp_update_modal form").find(".help-block").text("");
        $("#emp_update_btn").attr("update_id",$(this).attr("empId"));
        $("#emp_update_modal").modal({
            backdrop:"static"
        });
    });
    $(document).on("click",".delete_btn",function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();

        if(confirm("确认删除：" + empName + " 吗？")){
            $.ajax({
                url:"emp/" + $(this).attr("empId"),
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    alter_page(current_page);
                }
            });
        }
    });
    function getEmp(id){
        $.ajax({
            url:"emp/" + id,
            type:"get",
            success:function (result) {
                $("#updateEmpName").text(result.extend.emp.empName);
                $("#updateEmail").val(result.extend.emp.email);
                $("#emp_update_modal input[name=gender]").val([result.extend.emp.gender]);
                $("#emp_update_modal select").val([result.extend.emp.dId]);
            }

        });
    };
    $("#emp_update_btn").click(function () {
        var e_email= $("#updateEmail").val();
        var email_parttn=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!email_parttn.test(e_email)){
            // alert("请输入正确的邮箱格式")
            validate_form_show("#updateEmail","error","请输入正确的邮箱格式");
            return false;
        }
        $.ajax({
            url:"emp/" + $(this).attr("update_id"),
            type:"PUT",
            data: $("#emp_update_modal form").serialize(),
            success(result){
                if(result.code==100){
                    $("#emp_update_modal").modal('hide');
                    alter_page(current_page);
                }else{
                    if(result.extend.errorField.email != undefined){
                        validate_form_show("#updateEmail","error",result.extend.errorField.email);
                    }
                }
            }
        });
    });
    $("#check_all").click(function () {

            $(".check_item").prop("checked",$(this).prop("checked"));
    });
    $(document).on("click",".check_item",function () {
        $("#check_all").prop("checked",$(".check_item:checked").length == pageCount)
    });

    $("#emp_delete_btn").click(function () {
        if($(".check_item:checked").length==0){
            alert("请选择要删除的员工");
        }else{
            var empId = "";
            $.each($(".check_item:checked"),function () {
                empId += $(this).parents("tr").find("td:eq(1)").text()+"-";
            })
            empId = empId.substring(0,empId.length-1);
            if(confirm("是否删除选中的员工")){
                $.ajax({
                    url:"emp/"+empId,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        alter_page(current_page);
                    }
                })
            }
        }

    })

</script>
</body>
</html>
