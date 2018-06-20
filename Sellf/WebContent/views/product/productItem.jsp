<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int discountRate = Integer.parseInt(request.getParameter("discountRate"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<li class="productWrap">
	<div class="productBg">
		<div class="imgWrapper">
			<img class="productImgMain"
				src="../../img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg">
			<%
				if (discountRate > 0) {
			%>
			<div class="discountBg">10%</div>
			<%
				}
			%>
			<div class="productSideMenu">
				<div class="display_newwin hide">
					<img src="../../img/thumb_quickview.png" alt="">
				</div>
				<div class="display_quickview">
					<img src="../../img/thumb_quickview.png" alt="미리보기">
				</div>
				<div class="display_option">
					<img src="../../img/thumb_option.png" alt="옵션보기">
					<div class="hide display_opt_bak" act=""></div>
				</div>
				<div class="display_send">
					<img src="../../img/thumb_send.png" alt="SNS보내기">
				</div>
				<div class="display_zzim">
					<img src="../../img/thumb_zzim_off.png" alt="찜하기"><img
						src="../../img/thumb_quickview.png" style="display: none"
						alt="찜하기">
				</div>
			</div>
		</div>

		<div class="productTitle">세련된flex 디자인</div>
		<div class="productExplain">
			<font class="productExplainFont"> 제품설명1<br> 제품설명2
			</font>
		</div>
		<div class="priceOrigin">
			<s>￦ 50,000</s>
		</div>
		<div class="priceDiscount">￦ 40,000</div>
		<div class="myCheck">
			<center>
				<ul>
					<li><img src="../../img/icon_pageview.png"> 103 | &nbsp;</li>
					<li><img src="../../img/icon_zzim_off.png"> 103</li>
				</ul>
			</center>
		</div>
		<div class="freeTransfor">무료배송</div>
	</div>
</li>