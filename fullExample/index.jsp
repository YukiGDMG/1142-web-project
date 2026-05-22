<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-TW">
	<head>
		<meta charset="utf-8" />
		<title>JOURNEY － 台灣旅遊景點導覽</title>
		<link rel="stylesheet" href="style.css" type="text/css" />
		<script type="text/javascript" src="jquery-1.10.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("ul.subs").hide();
				//開啟之前開啟的選單
				var menuId = sessionStorage.getItem("openMenu");
				switch(menuId){

					case "north":
						$("#north").next("ul.subs").show();
						break;

					case "center":
						$("#center").next("ul.subs").show();
						break;

					case "south":
						$("#south").next("ul.subs").show();
						break;

					case "east":
						$("#east").next("ul.subs").show();
						break;
				}
				$("div.main").click(function(){
					$("ul.subs").slideUp();
					$("div.main").removeClass("open");
					if($("+ul",this).css("display")=="none"){
						$("+ul",this).slideDown();
						$(this).addClass("open");
					}
					// 儲存目前開啟的選單ID到sessionStorage
					var menuId = $(this).attr("id");
        			sessionStorage.setItem("openMenu", menuId);

				}).mouseover(function () {
					$(this).addClass("rollover");
				}).mouseout(function(){
					$(this).removeClass("rollover");
				});
			});
		</script>
	</head>
	<body>
		<div id="header">
			<div id="header-inner">
				<div id="logo">
					<img src="images/logo.png" />
				</div>
				<ul id="header-nav">
					<li><a href="test.html">
						<img src="images/about.png" /></a></li>
					<li><a href="test.html">
						<img src="images/contact.png" /></a></li>
					<li><a href="test.html">
						<img src="images/sitemap.png" /></a></li>
				</ul>
			</div>
		</div>
		<div id="wrapper" class="clearfix">
			<div id="nav">
				<ul> 
					<li class="color-blue">
						<div class="main" id="north">北部景點</div>
						<ul class="subs"> 
							<li><a href="index.jsp?page=jiufen">九份老街</a></li> 
							<li><a href="index.jsp?page=danshui">淡水漁人碼頭</a></li> 
							<li><a href="test.html">陽明山國家公園</a></li> 
							<li><a href="test.html">平溪天燈</a></li>
						</ul> 
					</li> 
					<li class="color-red" id="center">
						<div class="main">中部景點</div>
						<ul class="subs"> 
							<li><a href="test.html">日月潭</a></li> 
							<li><a href="test.html">清境農場</a></li> 
							<li><a href="test.html">合歡山</a></li> 
							<li><a href="test.html">彩虹眷村</a></li> 
						</ul> 
					</li>
					<li class="color-yellow" id="south">
						<div class="main">南部景點</div>
						<ul class="subs"> 
							<li><a href="test.html">墾丁國家公園</a></li> 
							<li><a href="test.html">駁二藝術特區</a></li> 
							<li><a href="test.html">旗津燈塔</a></li> 
						</ul> 
					</li>
					<li class="color-green" id="east">
						<div class="main">東部景點</div>
						<ul class="subs"> 
							<li><a href="test.html">太魯閣峽谷</a></li> 
							<li><a href="test.html">七星潭</a></li> 
							<li><a href="test.html">伯朗大道</a></li> 
						</ul> 
					</li> 
				</ul>
			</div>

			<div id="contents">
				<%
					String pageParam = request.getParameter("page");
					// 超連結傳遞的參數
					String pageToInclude = "home.jsp";
					//首頁為home.jsp

					if(pageParam != null){
						//如果有傳遞參數
						pageToInclude = pageParam + ".jsp";
						//載入對應的jsp檔案(同參數名稱)
					}
				%>

				<jsp:include page="<%= pageToInclude %>" />
				<!-- 將載入的jsp檔案整個放進來 -->

			</div>

		</div>
		<div id="footer">
			<div id="footer-inner">Copyright © 2014 MdN Department All Right Reserved.</div>
		</div>
	</body>
</html>