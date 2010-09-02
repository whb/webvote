<%@ page import="java.util.HashMap" %>
<%@ page import="com.voting.util.Constant" %>

<%@ include file="/common/taglibs.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>投票</title>
<link rel="stylesheet" href="css/pagination.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>
<script type="text/javascript" src="js/worksvote.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link id="css" rel="stylesheet" href="css/workvote.css" type="text/css">
<link id="css" rel="stylesheet" href="css/message.css" type="text/css">

<script type="text/javascript">
	
	function initPagination(tatalCount, currentNo) {
        $("#pagination").pagination(tatalCount, {
            callback: handlePaginationClick,
            items_per_page: ${pageSize},
            prev_text:"上一页",
			next_text:"下一页",
			link_to:"workvote?pageNo=__id__",
			current_page:currentNo
        });
    }	
	
	function voteAreaPageCtrl() {
        var voteWorkNum = $('#voteCart > li').length;
    	if( voteWorkNum >0 && voteWorkNum <=<%=Constant.VOTE_WORKS_SIZE%>) {
    		$('#voteButton').removeAttr("disabled");
    	} else {
    		$('#voteButton').attr("disabled", true);
    	}

    	$('#voteMsg').empty().removeClass();
    	if( voteWorkNum ><%=Constant.VOTE_WORKS_SIZE%>) {
    		$('#voteMsg').addClass('warning').append("您选择的作品超过5件");
			messageFade($('#voteMsg'));
    	} 
    }
	
	
    $(document).ready(function(){
        initPagination(${count}, ${currentNo});
		registerAddAction();
		registerExistDeleteAction();
		commitVoteArticalAction();
		
		$(".btnDiscuss").click(function(event){
			var item = $(this).parent();
			commiteData("goToDiscuss", $(item).attr("id"));
		});
		
		
		$("#workTypeArea input").click(function(event){
			var itemForm = $("#workTypeForm");
			var checkedVal = $("#workTypeArea input:radio:checked").val();
			itemForm.action="webvote?workType=checkedVal";
			itemForm.submit();
		});

		voteAreaPageCtrl();
    });
</script>

</head>

<body id="worksVote">
<form id="workTypeForm">
<div id="workTypeArea"><input type="radio" name="workType" value="jpg" <c:if test="${workTypeValue == 'jpg'}">checked</c:if>>摄影作品</input><input type="radio" name="workType" value="flv" <c:if test="${workTypeValue == 'flv'}">checked</c:if>>视频作品</input></div>
</form>
<div id="main">
	<ul id="articles">
	<c:forEach var="work" items="${works}">	
		<li id="${work.workId}" <c:if test="${work.readyVoted}">class='added'</c:if>>
			<div class="link">
			    <c:if test="${votePeriod.active}">
				<a  <c:if test="${work.readyVoted}">style="display:none"</c:if> class="addLink" href="#">添加投票</a>
				</c:if>
				<a href="workvote?method=goToDiscuss&workId=${work.workId}">评论</a>
			</div>
			<a href="${work.preViewUrl}" class="workUrlLink"><img src="${work.imageUrl}" /></a>
			<p>
			作品名称：<span class="name">${work.workTitle}</span><br />
			作者：${work.workAuthor}<br />
			发布日期：${work.workReleaseTime}<br />
			投票数：${work.voteCount}
			</p>
		</li>
	</c:forEach>	
	</ul>
	<div id="pagination">pagination</div>
</div>

<c:if test="${votePeriod.active}">
<div id="toVote">
	<h3>投票区</h3>
	<div id="voteMsg">${voteMsg}</div>
	<ul id="voteCart">
	<c:if test="${fn:length(simpleWorks)> 0}">
		<c:forEach var="simpleWork" items="${simpleWorks}">
			<li>
			<img src="${simpleWork.imageUrl}" />
			<p><span class="name">${simpleWork.workTitle}</span><a href="${simpleWork.workId}">删除</a></p>
			</li>
		</c:forEach>
	</c:if>
	</ul>	
	<div id="voteCommit">
	<input type="button" id="voteButton" value="投票" />
	</div>
</div>
</c:if>

</body>