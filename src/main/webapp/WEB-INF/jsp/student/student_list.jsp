<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2023/6/1
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

    <!-- Document title -->
    <title>Tables &ndash; Styles</title>

    <meta name="description" content="AppUI - Admin Dashboard Template & UI Framework" />
    <meta name="author" content="rustheme" />
    <meta name="robots" content="noindex, nofollow" />

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/img/favicons/apple-touch-icon.png" />
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicons/favicon.ico" />

    <!-- Google fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,400italic,500,900%7CRoboto+Slab:300,400%7CRoboto+Mono:400" />

    <!-- AppUI CSS stylesheets -->
    <link rel="stylesheet" id="css-font-awesome" href="${pageContext.request.contextPath}/assets/css/font-awesome.css" />
    <link rel="stylesheet" id="css-ionicons" href="${pageContext.request.contextPath}/assets/css/ionicons.css" />
    <link rel="stylesheet" id="css-bootstrap" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
    <link rel="stylesheet" id="css-app" href="${pageContext.request.contextPath}/assets/css/app.css" />
    <link rel="stylesheet" id="css-app-custom" href="${pageContext.request.contextPath}/assets/css/app-custom.css" />
    <!-- End Stylesheets -->
</head>
<body>
<div class="row">
    <div class="col-lg-12">
        <!-- Condensed Table -->
        <div class="card">
            <div class="card-block">
                <button class="btn btn-sm btn-info" type="button" id="add">新增</button>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th class="text-center" style="width: 50px;">序号</th>
                        <th class="text-center">姓名</th>
                        <th class="text-center">头像</th>
                        <th class="text-center">账号</th>
                        <th class="text-center">性别</th>
                        <th class="text-center">专业</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="t" varStatus="c">
                        <tr>
                            <td class="text-center">${c.index + 1}</td>
                            <td class="text-center">${t.name}</td>
                            <td class="text-center">
                                <img class="img-avatar img-avatar-48" src="${pageContext.request.contextPath}${t.avatar}" alt="User profile pic" />
                            </td>
                            <td class="text-center">${t.account}</td>
                            <td class="text-center">${t.sex==1?'男':'女'}</td>
                            <td class="text-center">${t.professional.name}</td>
                            <td class="text-center">
                                <button class="btn btn-xs btn-info" type="button" name="edit" id="${t.id}" >编辑</button>
                                <button class="btn btn-xs btn-danger" type="button" name="del" id="${t.id}">删除</button>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>

                <c:if test="${pageInfo.total > 0}">
                    <div class="text-center" >
                        <nav>
                            <ul class="pagination pagination-sm">
                                <li class="${pageInfo.pageNum==1?'disabled':''}">
                                    <a href="${pageContext.request.contextPath}/student/findAll?currentPage=${pageInfo.pageNum-1}"><i class="ion-chevron-left"></i></a>
                                </li>

                                <c:forEach items="${pageInfo.navigatepageNums}" var="pn">

                                    <li class="${pageInfo.pageNum==pn?'active':''}">
                                        <a href="${pageContext.request.contextPath}/student/findAll?currentPage=${pn}">${pn}</a>
                                    </li>

                                </c:forEach>

                                <li class="${pageInfo.pageNum==pageInfo.pages?'disabled':''}">
                                    <a href="${pageContext.request.contextPath}/student/findAll?currentPage=${pageInfo.pageNum+1}"><i class="ion-chevron-right"></i></a>
                                </li>
                            </ul>
                            共${pageInfo.pages}页
                        </nav>
                    </div>
                </c:if>

                <c:if test="${pageInfo.total == 0}">
                    <span style="color: red">暂时没有记录</span>
                </c:if>


            </div>
            <!-- .card-block -->
        </div>
        <!-- .card -->
        <!-- End Condensed Table -->
    </div>
</div>

<!-- Normal Modal -->
<div class="modal" id="modal-normal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card-block">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/student/add" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" id="id" value="${user.id}"/>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="account">账号 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" id="account" name="account" placeholder="请输入账号..." value="${user.account}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="name">用户名 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" id="name" name="name" placeholder="请输入用户名..." value="${user.name}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="password">密码 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <input class="form-control" type="password" id="password" name="password" placeholder="请输入密码.." value="${user.password}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="sex">性别 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <select class="form-control" id="sex" name="sex">
                                <option value="-1" id="default_sex" selected>请选择</option>
                                <option value="1" ${user.sex=='1'?'selected':''}>男</option>
                                <option value="0" ${user.sex=='0'?'selected':''}>女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="professional">专业 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <select class="form-control" id="professional" name="professional.id">
                                <option value="-1" id="default_professional" selected>请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="img">头像 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input type="file" id="img" name="multipartFile">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-sm btn-app" type="submit"><i class="ion-checkmark"></i> 确认</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Normal Modal -->

<!-- AppUI Core JS: jQuery, Bootstrap, slimScroll, scrollLock and App.js -->
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.scrollLock.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.placeholder.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-custom.js"></script>
<script src="${pageContext.request.contextPath}/tinymce/tinymce.min.js"></script>


<script>
    $(function (){
        $('button[name=del]').click(function (){
            if (confirm('确认删除？')){
                location.href='${pageContext.request.contextPath}/student/del?id=' + $(this).attr('id')
            }
        })

        //专业下拉框初始化
        function show_professional(){
            $('#sex').val('-1')
            $('#professional').val('-1')
            if ($('#professional').children().length === 1){
                $.ajax({
                    url : '${pageContext.request.contextPath}/professional/listForStudent',
                    dataType: 'json',
                    success(data) {
                        $.each(data, function (index, item){
                            let optstr = `<option value="` + item.id + `">` + item.name + `</option>`
                            $('#professional').append(optstr)
                        })
                    }
                })
            }
        }

        $('#add').click(function (){
            $('input').val('')
            show_professional()
            $('#modal-normal').modal('show')
        })

        $('button[name=edit]').click(function (){

            $.ajax({
                url : '${pageContext.request.contextPath}/student/edit?id=' + $(this).attr('id'),
                dataType : 'json',
                success(data){
                    $('#id').val(data.id)
                    $('#account').val(data.account)
                    $('#password').val(data.password)
                    $('#name').val(data.name)
                    show_professional()
                    $('#sex').val(data.sex)
                    $.ajax({
                        url : '${pageContext.request.contextPath}/professional/listForStudent',
                        dataType: 'json',
                        success(res) {
                            $.each(res, function (index, item){
                                if (item.id === data.professional.id){
                                    $('#professional').val(item.id)
                                }
                            })
                        }
                    })
                }
            })
            $('#modal-normal').modal('show')
        })
    })


</script>

</body>
</html>
