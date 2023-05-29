<%@ page import="com.example.edu.entity.Professional" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2023/5/23
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="card-header">
                <button class="btn btn-sm btn-info" type="button" data-toggle="modal" data-target="#modal-normal">新增</button>
            </div>
            <div class="card-block">
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th class="text-center" style="width: 50px;">序号</th>
                        <th class="text-center">名称</th>
                        <th class="text-center" style="width: 200px;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="p" varStatus="c">
                    <tr>
                        <td class="text-center">${c.index + 1}</td>
                        <td class="text-center">${p.name}</td>
                        <td class="text-center">
                            <div class="btn-group">
                                <p>
                                    <button class="btn btn-sm btn-info" type="button" name="edit" id="${p.id}">编辑</button>
                                    <button class="btn btn-sm btn-danger" type="button" name="del" id="${p.id}" >删除</button>
                                </p>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
            <!-- .card-block -->
        </div>
        <!-- .card -->
        <!-- End Condensed Table -->
    </div>
</div>

<!-- Normal Modal -->
<div class="modal" id="modal-normal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card-block">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/professional/save" method="post">
                    <input type="hidden" name="id" value=""/>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="name">专业名称 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" id="name" name="name" placeholder="请输入专业名称..."/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-sm btn-default" type="button" data-dismiss="modal" id="cancel">取消</button>
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
</body>
</html>

<script type="text/javascript">
    $(function (){
        $('#cancel').click(function (){
            $('input').attr('value',"")
        })
        $('button[name=edit]').click(function (){
            $('#modal-normal').modal('show');
            $.ajax({
                url : '${pageContext.request.contextPath}/professional/findProfessionalById?id=' + $(this).attr('id'),
                dataType : "json",
                success : function (data){
                    //将后台数据传入input name
                    $('#modal-normal input[name=name]').val(data.name)
                    $('#modal-normal input[name=id]').val(data.id)


                    $('modal-normal').modal("show")
                },
                error : function (error){
                    console.log('错误信息：' + error.responseText)
                }
            })
        })

        $('button[name=del]').click(function (){
            if (confirm('您确定要删除吗？')){
                location.href = '/professional/delete?id=' + $(this).attr('id')
            }
        })
    })

</script>