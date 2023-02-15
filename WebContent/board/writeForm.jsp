<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jspf"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<title>2016 굿모닝 경기 소통 크리에이터 공모전</title>
<link rel="stylesheet" type="text/css" href="./css/general.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery.scrollTo-min.js"></script>
<script src="./js/layout.js"></script>
<!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body>
	<% 
  int num = 0, ref = 1, re_step = 0, re_level = 0;
  String strV = "";
  try{
    if(request.getParameter("num")!=null){
	   num=Integer.parseInt(request.getParameter("num"));
	   ref=Integer.parseInt(request.getParameter("ref"));
	   re_step=Integer.parseInt(request.getParameter("re_step"));
	   re_level=Integer.parseInt(request.getParameter("re_level"));
    }
%>
	<!-- ------------------- -->

	<div id="wrap">
		<!-- @ CONTAINER -->
		<section id="container" class="sub">
			<!-- @ CONTENTS -->
			<div id="contents">
				<div class="sub-title-area">
					<h2 class="tit">News & Info</h2>
				</div>


				<form method="post" name="writeform" action="writePro.jsp"
					onsubmit="return writeSave()">
					<input type="hidden" name="num" value="<%=num%>"> <input
						type="hidden" name="ref" value="<%=ref%>"> <input
						type="hidden" name="re_step" value="<%=re_step%>"> <input
						type="hidden" name="re_level" value="<%=re_level%>">
						<input
						type="hidden" name="passwd" value="1234">

					<table class="basic_write">
						<caption>News 입력</caption>
						<colgroup>
							<col style="width: 150px">
							<col style="width: *">
						</colgroup>
						<tr>
							<th>제목<span class="star">*</span></th>
							<td>
								<%
							if (request.getParameter("num") == null)
								strV = "";
							else
								strV = "[답변]";
							%> <input type="text" title="제목" id="" size="40" maxlength="50"
								class="add_txt" placeholder="제목 *" name="subject"
								value="<%=strV%>" style="ime-mode: active;">
							</td>
						</tr>

						<tr>
							<th>작성자<span class="star">*</span></th>
							<td><input type="text" size="10" maxlength="10"
								name="writer" style="ime-mode: active;" class="name_txt"
								placeholder="성명 *"></td>
						</tr>


						<tr>
							<th>첨부파일</th>
							<td><input type="file" title="첨부파일" name="" id=""
								placeholder="학과/부서" class="name_txt"></td>
						</tr>
						<tr>
							<th>내용 <span class="star">*</span></th>
							<td><textarea name="content" id="" rows="10" cols="30"
									style="ime-mode: active; width: 100%;"></textarea></td>
						</tr>

					</table>

					<div class="btn_area"
					style="margin-top:60px;font-size: 13px; height: 40px; line-height: 40px;-webkit-border-radius:4px;border-radius:4px;padding: 0 17px;"
					>
						<input type="submit" class="btn_blue" value="확인" 
						style="width:173px;line-height: 40px;border: 1px solid #f7941e; color:#fff; background:#f7941e;"
						> 
						<input class="btn_blue_line" type="button" value="취소"
							OnClick="window.location='list.jsp'"
							style="width:173px;line-height: 40px;color:#f7941e; border: 1px solid #f7941e;"
							>
					</div>
					<%
  } catch(Exception e){}
%>
				</form>
			</div>
			<!-- CONTENTS @ -->
		</section>
		<!-- CONTAINER @ -->
	</div>





	<!-- ------------------- -->

</body>
</html>