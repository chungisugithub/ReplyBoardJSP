<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDBBean"%>
<%@ page import="board.BoardDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
<style type="text/css">
.myButton {
	width: 173px;
	line-height: 40px;
	border: 1px solid #f7941e;
	color: #fff;
	background: #f7941e;
}
</style>
</head>
<body>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try {
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.getArticle(num);

		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
	%>

	<!-- ----------------------------- -->

	<div id="wrap">
		<!-- @ CONTAINER -->
		<section id="container" class="sub">
			<!-- @ CONTENTS -->
			<div id="contents">
				<form>
					<!-- @ SUB TITLE AREA -->
					<div class="sub-title-area">
						<h2 class="tit">News & Info
					</div>
					<div class="write_title">공지사항입니다.</div>
					<div class="write_date">
						<span class="write_line"><strong>작성자 :</strong> <%=article.getWriter()%>
						</span> <span class="write_line"><strong>조회수 :</strong> <%=article.getReadcount()%>
						</span> <span class="write_line"><%=sdf.format(article.getReg_date())%></span>
						<span><em class="file_icon"></em><a href="#"> 123.hwp</a></span>

					</div>
					<div class="con_box">
						<table class="basic_write">
							<caption>News 입력</caption>
							<colgroup>
								<col style="width: 150px">
								<col style="width: *">
							</colgroup>
							<tr>
								<th>제목<span class="star">*</span></th>
								<td><%=article.getSubject()%></td>
							</tr>
							<tr>
								<th>내용 <span class="star">*</span></th>
								<td
									style="text-align: left; vertical-align: top; height: 200px; padding-top: 20px">
									<pre><%=article.getContent()%></pre>
								</td>
							</tr>
						</table>
					</div>

					<div class="btn_area">
						<input type="button" value="목록" class="btn_blue myButton"
							onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">

						<input type="button" value="수정" class="btn_blue myButton"
							onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">

						<input type="button" class="btn_blue myButton" value="삭제"
							onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					</div>
					<%
					} catch (Exception e) {
					}
					%>
				</form>
			</div>
			<!-- CONTENTS @ -->
		</section>
		<!-- CONTAINER @ -->
	</div>

</body>
</html>