<%--
  Created by IntelliJ IDEA.
  User: MI
  Date: 2023/5/29
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.edu.entity.Professional"%>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
                <button class="btn btn-sm btn-info" type="button" id="add" data-toggle="modal" data-target="#modal-normal">新增</button>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th class="text-center" style="width: 50px;">序号</th>
                        <th class="text-center">标题</th>
                        <th class="text-center">作者</th>
                        <th class="text-center">创建时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="p" varStatus="c">
                        <tr>
                            <td class="text-center">${c.index + 1}</td>
                            <td class="text-center">${p.title}</td>
                            <td class="text-center">${p.author}</td>
                            <td class="text-center">${p.create_time}</td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/new/view?id=${p.id}" target="_blank">
                                    <button class="btn btn-xs btn-success" type="button" >详情</button>
                                </a>
                                <button class="btn btn-xs btn-info" type="button" name="edit" id="${p.id}">编辑</button>
                                <button class="btn btn-xs btn-danger" type="button" name="del" id="${p.id}">删除</button>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>

                <c:if test="${pageInfo.total > 1}">
                    <div class="text-center" >
                        <nav>
                            <ul class="pagination pagination-sm">
                                <li class="${pageInfo.pageNum==1?'disabled':''}">
                                    <a href="${pageContext.request.contextPath}/new/findAll?currentPage=${pageInfo.pageNum-1}"><i class="ion-chevron-left"></i></a>
                                </li>

                                <c:forEach items="${pageInfo.navigatepageNums}" var="pn">

                                    <li class="${pageInfo.pageNum==pn?'active':''}">
                                        <a href="${pageContext.request.contextPath}/new/findAll?currentPage=${pn}">${pn}</a>
                                    </li>

                                </c:forEach>

                                <li class="${pageInfo.pageNum==pageInfo.pages?'disabled':''}">
                                    <a href="${pageContext.request.contextPath}/new/findAll?currentPage=${pageInfo.pageNum+1}"><i class="ion-chevron-right"></i></a>
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
<div class="modal" id="modal-normal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="card-block">
                <form class="form-horizontal"  action="${pageContext.request.contextPath}/new/add" method="post">
                    <input type="hidden" id="id" value=""/>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="title">标题 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" id="title" name="title" placeholder="请输入新闻标题..."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="keyword">关键词 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" id="keyword" name="keyword" placeholder="请输入关键词..."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="author">作者 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <input class="form-control" type="text" id="author" name="author" placeholder="请输入作者..."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="content">内容 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <textarea name="content" id="content" rows="5" cols="8"></textarea>
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
<!-- AppUI Core JS: jQuery, Bootstrap, slimScroll, scrollLock and App.js -->
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.scrollLock.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.placeholder.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-custom.js"></script>
<script src="${pageContext.request.contextPath}/tinymce/tinymce.min.js"></script>

<script type="text/javascript">
    tinymce.init({
        selector : '#content',
        language : 'zh_CN',
        plugins : 'image',
        toolbar : 'image',
        branding : false,
        images_upload_url : '${pageContext.request.contextPath}/new/upload',
        images_upload_base_path : '${pageContext.request.contextPath}/'
    })

    $(function (){
        $('button[name=edit]').click(function (){
            $('#modal-normal').modal('show')
            $.ajax({
                url : '${pageContext.request.contextPath}/new/edit?id=' + $(this).attr('id'),
                dataType : 'json',
                success(data){
                    $('#id').val(data.id)
                    $('#title').val(data.title)
                    $('#author').val(data.author)
                    $('#keyword').val(data.keyword)
                    $('#content').text(tinyMCE.activeEditor.setContent(data.content))
                }
            })
        })

        $('button[name=del]').click(function (){
            if (confirm('确定删除？')){
                location.href='${pageContext.request.contextPath}/new/del?id=' + $(this).attr('id')
            }
        })

        $('#add').click(function (){
            $('input').val('')
            $('#content').text(tinyMCE.activeEditor.setContent(''))
        })
    })



</script>
</body>
</html>
