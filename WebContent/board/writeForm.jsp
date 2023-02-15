<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" >
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>2016 굿모닝 경기 소통 크리에이터 공모전</title>
    <link rel="stylesheet" type="text/css" href="./css/general.css" >
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
                <h2 class="tit">News & Info </h2>
				</div>
                <table class="basic_write">
                    <caption>News 입력</caption>
                    <colgroup>
                        <col style="width:150px">
                        <col style="width:*">
                    </colgroup>
					   <tr>
                        <th>제목<span class="star">*</span></th>
                        <td><input type="text" title="제목" name="" id="" class="add_txt"  placeholder="제목 *"></td>
                    </tr>
                    <tr>
                        <th>작성자<span class="star">*</span></th>
                        <td><input type="text" title="성명" name="" id="" class="name_txt" placeholder="성명 *"></td>
                    </tr>
                 
                    <tr>
                        <th>첨부파일</th>
                        <td>
                            <input type="file" title="첨부파일" name="" id="" placeholder="학과/부서" class="name_txt">
                        </td>
                    </tr>
                    <tr>
                        <th>내용 <span class="star">*</span></th>
                        <td>
                           <textarea name="" id="" cols="30" rows="10" style="width:100%"></textarea>
                        </td>
                    </tr>
                    
                </table>               
                <div class="btn_area">
					<button type="button" class="btn_blue">확인</button> 
					<a href="#" class="btn_blue_line">취소</a>
                </div>
        </div>
        <!-- CONTENTS @ -->
    </section>
    <!-- CONTAINER @ -->
</div>





<!-- ------------------- -->


<p>글쓰기</p>
<form method="post" name="writeform" 
      action="writePro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">

<table>
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_c%>">
	    <a href="list.jsp"> 글목록</a> 
   </td>
   </tr>
   <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center">이 름</td>
    <td  width="330" align="left">
       <input type="text" size="10" maxlength="10" 
          name="writer" style="ime-mode:active;"></td><!--active:한글-->
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >제 목</td>
    <td  width="330" align="left">
    <%
      if(request.getParameter("num")==null) 
    	 strV = "";
      else
    	 strV = "[답변]";
    %>
    <input type="text" size="40" maxlength="50" name="subject"
         value="<%=strV%>" style="ime-mode:active;"></td>	
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center">Email</td>
    <td  width="330" align="left">
       <input type="text" size="40" maxlength="30" name="email"
           style="ime-mode:inactive;" ></td><!--inactive:영문-->
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >내 용</td>
    <td  width="330" align="left">
     <textarea name="content" rows="13" cols="40" 
              style="ime-mode:active;"></textarea> </td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >비밀번호</td>
    <td  width="330" align="left">
     <input type="password" size="8" maxlength="12" 
             name="passwd" style="ime-mode:inactive;"> 
	 </td>
  </tr>
  <tr>      
    <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
      <input type="submit" value="글쓰기" >  
      <input type="reset" value="다시작성">
      <input type="button" value="목록보기" OnClick="window.location='list.jsp'">
    </td>
  </tr>
</table>    
 <%
  }catch(Exception e){}
%>     
</form>    
</body>
</html>