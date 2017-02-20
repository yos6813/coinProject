<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Fineapple</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/iCheck/all.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/resources/plugins/select2/select2.min.css">
	<!-- bootstrap datepicker -->
	<link rel="stylesheet" href="/resources/plugins/datepicker/datepicker3.css" type="text/css" />	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- daterange picker -->
  	<link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
  </head>
      <!-- jQuery 2.1.4 -->
  <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <link href="/resources/plugins/dualListbox/bootstrap-duallistbox.min.css" rel="stylesheet">
  <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet">
<!--   <link href="/resources/dist/css/style.css" rel="stylesheet" type="text/css"> -->
    
  <body class="skin-black sidebar-mini">
    <div class="wrapper">
      <header class="main-header">
        <!-- Logo -->
        <a href="/" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>F</b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Fineapple</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
             <a class="text-default" id="signout"><p style="margin-top:15px; margin-right:5px;">Logout</p></a>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="" class="img-circle" id="sideuserImg" />
            </div>
            <div class="pull-left info">
            	<p id="sideusername"></p>
            	<a id="sideEmail"></a>
            </div>
          </div>
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MENU</li>
            <li><a href="/task?email=${user.email}"><i class="fa fa-circle-o text-red"></i> <span>업무관리</span></a></li>
            <li><a href="/admit?email=${user.email}"><i class="fa fa-circle-o text-yellow"></i> <span>관리페이지</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>