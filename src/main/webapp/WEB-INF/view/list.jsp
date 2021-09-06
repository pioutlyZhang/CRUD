<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%--
  Created by IntelliJ IDEA.
  User: 皮欧托利亚
  Date: 2021/8/8
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>--%>
<div class="container">
    <div class="row">
        <div class="col-lg-12"><h1>CRUD</h1></div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>

    <div class="row">
        <table class="table table-hover">
            <tr>
                <th>员工编号</th>
                <th>员工姓名</th>
                <th>员工性别</th>
                <th>员工邮箱</th>
                <th>员工部门</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <th>${emp.empId}</th>
                    <th>${emp.empName}</th>
                    <th>${emp.gender=="F"?"男":"女"}</th>
                    <th>${emp.email}</th>
                    <th>${emp.department.deptName}</th>
                    <th>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>
                    </th>
                </tr>
            </c:forEach>

        </table>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h4 class="text-primary">
                当前为第${pageInfo.pageNum}页，共${pageInfo.pages}页，${pageInfo.total}条记录：
            <h4/>
        </div>
        <div class="col-md-6 col-md-offset-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li><a href="emps?pn=1">首页</a></li>
                        <li>
                            <a href="emps?pn=${pageInfo.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.hasPreviousPage}">
                        <li class="disabled">
                            <a aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                        <c:if test="${page==pageInfo.pageNum}">
                            <li class="active"><a>${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageInfo.pageNum}">
                            <li><a href="emps?pn=${page}">${page}</a></li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="emps?pn=${pageInfo.nextPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li><a href="emps?pn=${pageInfo.pages}">末页</a></li>
                    </c:if>
                    <c:if test="${!pageInfo.hasNextPage}">
                        <li class="disabled">
                            <a aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>


                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>
