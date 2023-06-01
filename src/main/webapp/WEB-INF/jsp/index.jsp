<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html class="app-ui">

<head>

    <!-- Meta -->
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

    <!-- Document title -->
    <title></title>

    <meta name="description" content="AppUI - Admin Dashboard Template & UI Framework" />
    <meta name="author" content="rustheme" />
    <meta name="robots" content="noindex, nofollow" />

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/img/favicons/apple-touch-icon.png" />
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicons/favicon.ico" />

    <!-- Google fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,400italic,500,900%7CRoboto+Slab:300,400%7CRoboto+Mono:400" />

    <!-- Page JS Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/slick/slick.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/slick/slick-theme.min.css" />

    <!-- AppUI CSS stylesheets -->
    <link rel="stylesheet" id="css-font-awesome" href="${pageContext.request.contextPath}/assets/css/font-awesome.css" />
    <link rel="stylesheet" id="css-ionicons" href="${pageContext.request.contextPath}/assets/css/ionicons.css" />
    <link rel="stylesheet" id="css-bootstrap" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
    <link rel="stylesheet" id="css-app" href="${pageContext.request.contextPath}/assets/css/app.css" />
    <link rel="stylesheet" id="css-app-custom" href="${pageContext.request.contextPath}/assets/css/app-custom.css" />
    <!-- End Stylesheets -->
</head>

<body class="app-ui layout-has-drawer layout-has-fixed-header">
<div class="app-layout-canvas">
    <div class="app-layout-container">

        <!-- Drawer -->
        <aside class="app-layout-drawer">

            <!-- Drawer scroll area -->
            <div class="app-layout-drawer-scroll">
                <!-- Drawer logo -->
                <div id="logo" class="drawer-header">
                    <a href="index.html"><img class="img-responsive" src="${pageContext.request.contextPath}/assets/img/logo/logo-backend.png" title="AppUI" alt="AppUI" /></a>
                </div>

                <!-- Drawer navigation -->
                <nav class="drawer-main">
                    <ul class="nav nav-drawer">

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ion-ios-calculator-outline"></i> 教师管理</a>
                            <ul class="nav nav-subnav">

                                <li>
                                    <a href="${pageContext.request.contextPath}/teacher/findAll" target="main">教师信息</a>
                                </li>

                                <li>
                                    <a href="base_ui_cards.html">Cards</a>
                                </li>

                                <li>
                                    <a href="base_ui_cards_api.html">Cards API</a>
                                </li>

                                <li>
                                    <a href="base_ui_layout.html">Layout</a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ion-ios-compose-outline"></i> 学生管理</a>
                            <ul class="nav nav-subnav">

                                <li>
                                    <a href="base_forms_elements.html">Elements</a>
                                </li>

                                <li>
                                    <a href="base_forms_samples.html">Samples</a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ion-ios-list-outline"></i> 教学管理</a>
                            <ul class="nav nav-subnav">

                                <li>
                                    <a href="base_tables_styles.html">Styles</a>
                                </li>

                                <li>
                                    <a href="base_tables_responsive.html">Responsive</a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ion-ios-browsers-outline"></i> 公告管理</a>
                            <ul class="nav nav-subnav">

                                <li>
                                    <a href="${pageContext.request.contextPath}/new/findAll" target="main">最新公告</a>
                                </li>

                                <li>
                                    <a href="base_pages_inbox.html">Inbox</a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ion-social-javascript-outline"></i> 选课管理</a>
                            <ul class="nav nav-subnav">

                                <li>
                                    <a href="base_js_maps.html">Maps</a>
                                </li>

                                <li>
                                    <a href="base_js_sliders.html">Sliders</a>
                                </li>

                                <li>
                                    <a href="base_js_charts_flot.html">Charts - Flot</a>
                                </li>

                            </ul>
                        </li><li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ion-social-javascript-outline"></i> 学习天地</a>
                            <ul class="nav nav-subnav">

                                <li>
                                    <a href="base_js_maps.html">Maps</a>
                                </li>

                                <li>
                                    <a href="base_js_sliders.html">Sliders</a>
                                </li>

                                <li>
                                    <a href="base_js_charts_flot.html">Charts - Flot</a>
                                </li>

                            </ul>
                        </li></li><li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ion-social-javascript-outline"></i> 基础数据</a>
                            <ul class="nav nav-subnav">

                                <li>
                                    <a href="${pageContext.request.contextPath}/professional/list" target="main">专业设置</a>
                                </li>

                                <li>
                                    <a href="${pageContext.request.contextPath}/log/listPage" target="main">日志管理</a>
                                </li>

                            </ul>
                        </li></li></li><li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="ion-social-javascript-outline"></i> 权限管理</a>
                            <ul class="nav nav-subnav">

                                <li>
                                    <a href="base_js_maps.html">Maps</a>
                                </li>

                                <li>
                                    <a href="base_js_sliders.html">Sliders</a>
                                </li>

                            </ul>
                        </li>

                    </ul>
                </nav>

            </div>
            <!-- End drawer scroll area -->
        </aside>
        <!-- End drawer -->

        <!-- Header -->
        <header class="app-layout-header">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar-collapse" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <button class="pull-left hidden-lg hidden-md navbar-toggle" type="button" data-toggle="layout" data-action="sidebar_toggle">
                            <span class="sr-only">Toggle drawer</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div>

                    <div class="collapse navbar-collapse" id="header-navbar-collapse">

                        <ul class="nav navbar-nav navbar-right navbar-toolbar hidden-sm hidden-xs">

                            <li class="dropdown dropdown-profile">
                                <a href="javascript:void(0)" data-toggle="dropdown">
                                    <span class="m-r-sm">${user.name} <span class="caret"></span></span>
                                    <img class="img-avatar img-avatar-48" src="${pageContext.request.contextPath}${user.avatar}" alt="User profile pic" />
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li>
                                        <a href="frontend_login_signup.html" data-toggle="modal" data-target="#modal-normal">个人信息</a>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/logout">退出</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <!-- .navbar-right -->
                    </div>
                </div>
                <!-- .container-fluid -->
            </nav>
            <!-- .navbar-default -->
        </header>
        <!-- End header -->

        <main class="app-layout-content">
            <iframe src="http://www.taobao.com" width="100%" height="700px" frameborder="0" name="main"></iframe>
        </main>

    </div>
    <!-- .app-layout-container -->
</div>
<!-- .app-layout-canvas -->

<!-- Normal Modal -->
<div class="modal" id="modal-normal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="card-block">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/modifyUserInfo" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${user.id}"/>
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
                                <option value="">请选择</option>
                                <option value="1" ${user.sex=='1'?'selected':''}>男</option>
                                <option value="0" ${user.sex=='0'?'selected':''}>女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="img">头像 <span class="text-orange">*</span></label>
                        <div class="col-md-7">
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input type="file" id="img" name="img">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
<%--                        <button class="btn btn-sm btn-default" type="button" data-dismiss="modal">退出</button>--%>
                        <button class="btn btn-sm btn-app" type="submit"><i class="ion-checkmark"></i> 确认</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Normal Modal -->

<div class="app-ui-mask-modal"></div>

<!-- AppUI Core JS: jQuery, Bootstrap, slimScroll, scrollLock and App.js -->
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.scrollLock.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.placeholder.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app-custom.js"></script>

<!-- Page Plugins -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/slick/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/flot/jquery.flot.stack.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/flot/jquery.flot.resize.min.js"></script>

<!-- Page JS Code -->
<script src="${pageContext.request.contextPath}/assets/js/pages/index.js"></script>
<script>
    $(function()
    {
        // Init page helpers (Slick Slider plugin)
        App.initHelpers('slick');
    });
</script>

</body>

</html>