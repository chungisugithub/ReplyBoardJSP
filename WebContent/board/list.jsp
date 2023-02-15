<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDBBean"%>
<%@ page import="board.BoardDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="color.jspf"%>

<%!int pageSize = 5;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
String pageNum = request.getParameter("pageNum");

if (pageNum == null) {
	pageNum = "1";
}

int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;
int count = 0;
int number = 0;
List<BoardDataBean> articleList = null;

BoardDBBean dbPro = BoardDBBean.getInstance();
count = dbPro.getArticleCount();

if (count > 0) {
	articleList = dbPro.getArticles(startRow, pageSize);
}

number = count - (currentPage - 1) * pageSize;
%>
<html>
<head>
<title>2016 굿모닝 경기 소통 크리에이터 공모전</title>
<link rel="stylesheet" href="./css/general.css" />
<script type="text/javascript" src="./js/jquery.scrollTo-min.js"></script>
<script src="./js/layout.js"></script>
<!--[if IE]>
   <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
   <![endif]-->
</head>
<body>
	<div id="wrap">
		<!-- @ CONTAINER -->
		<section id="container" class="sub  new">
			<!-- @ CONTENTS -->
			<div id="contents">
				<!-- @ SUB TITLE AREA -->
				<div class="sub-title-area">
					<h2 class="tit">News & Info</h2>
				</div>
				<div class="btn_area">
					<a href="write.html" class="btn_blue_line">글쓰기</a>
				</div>
				<!-- 페이징 처리는 5개씩 해주세요-->
				<table class="news_list">
					<caption>News 리스트</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: *">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 5%">
						<col style="width: 8%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회</th>
							<th scope="col">첨부</th>
						</tr>
					</thead>
					<tbody>
						<%
	if (count == 0) {
	%>
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	<%
	} else {
	%>
		<%
		for (int i = 0; i < articleList.size(); i++) {
			BoardDataBean article = articleList.get(i);
		%>
						<tr>
							<td><%=number--%></td>
							<td class="board_txt">
									<%
									int wid = 0;
									if (article.getRe_level() > 0) {
										wid = 5 * (article.getRe_level());
									%> <img src="images/level.png" width="<%=wid%>" height="16"> <img
									src="images/re.png"> <%
					 } else {
					 %> <img src="images/level.png"
									width="<%=wid%>" height="16"> <%
					 }
					 %> <a
									href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
										<%=article.getSubject()%></a> <%
					 if (article.getReadcount() >= 20) {
					 %> <img
									src="images/hot.gif" border="0" height="16">
									<%
									}
									%>
							</td>
							<td class="board_man"><a
				href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
				
							<td class="board_date"><%=sdf.format(article.getReg_date())%></td>
							<td class="board_read"><%=article.getReadcount()%></td>
							<td class="board_file"><span class="file_icon">파일다운로드</span>
						</tr>
						
		<% } %>
	<% } %>				
					</tbody>
				</table>




				<div class="pagination">
					<a class="prev end">첫 페이지</a> <a class="prev">이전 페이지</a> 
					
						<a
						href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a> <a
						href="#">4</a> <a href="#">99</a>
						 
						
					<a href="#" class="next">다음 페이지</a> <a href="#" class="next end">마지막 페이지</a>
				</div>
				
				
				<div class="find_wrap">
					<select name="" id="">
						<option value="">제목</option>
						<option value="">내용</option>
					</select> <input type="text" name="" id="" title="검색어 입력"
						placeholder="검색어 입력"> <a href="#" class="btn_gray">검색</a>
				</div>
			</div>
			<!-- CONTENTS @ -->
		</section>
		<!-- CONTAINER @ -->
	</div>


	<!-- ㅓ녜 위로 옮길 것 -->

	<p>
		글목록(전체 글:<%=count%>)
	</p>

	<table>
		<tr>
			<td align="right" bgcolor="<%=value_c%>"><a href="writeForm.jsp">글쓰기</a>
			</td>
		</tr>
	</table>

	<%
	if (count == 0) {
	%>

	<table>
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
	</table>

	<%
	} else {
	%>
	<table>
		<tr height="30" bgcolor="<%=value_c%>">
			<td align="center" width="50">번 호</td>
			<td align="center" width="250">제 목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="150">작성일</td>
			<td align="center" width="50">조 회</td>
			<td align="center" width="100">IP</td>
		</tr>
		<%
		for (int i = 0; i < articleList.size(); i++) {
			BoardDataBean article = articleList.get(i);
		%>
		<tr height="30">
			<td width="50"><%=number--%></td>
			<td width="250" align="left">
				<%
				int wid = 0;
				if (article.getRe_level() > 0) {
					wid = 5 * (article.getRe_level());
				%> <img src="images/level.png" width="<%=wid%>" height="16"> <img
				src="images/re.png"> <%
 } else {
 %> <img src="images/level.png"
				width="<%=wid%>" height="16"> <%
 }
 %> <a
				href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
					<%=article.getSubject()%></a> <%
 if (article.getReadcount() >= 20) {
 %> <img
				src="images/hot.gif" border="0" height="16">
				<%
				}
				%>
			</td>
			
			
			<td width="100" align="left"><a
				href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
			<td width="150"><%=sdf.format(article.getReg_date())%></td>
			<td width="50"><%=article.getReadcount()%></td>
			<td width="100"><%=article.getIp()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}
	%>

	<%
	if (count > 0) {
		int pageBlock = 10;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;

		if (currentPage % pageBlock != 0)
			startPage = (int) (currentPage / pageBlock) * pageBlock + 1;
		else
			startPage = ((int) (currentPage / pageBlock) - 1) * pageBlock + 1;

		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		if (startPage > pageBlock) {
	%>
	<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
	}

	for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
	}

	if (endPage < pageCount) {
	%>
	<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
	}
	}
	%>

</body>
</html>