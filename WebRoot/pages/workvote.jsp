<%@ page import="java.util.HashMap" %>
<%@ page import="com.voting.util.Constant" %>

<%@ include file="/common/taglibs.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>投票</title>
<link rel="stylesheet" href="css/pagination.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.pagination.js"></script>

<script type="text/javascript">
	function handlePaginationClick(page_index, jq){
        return true;
    }

    function initPagination() {
        $("#pagination").pagination(${count}, {
            callback: handlePaginationClick,
            items_per_page: ${pageSize},
            prev_text:"上一页",
			next_text:"下一页",
			link_to:"workvote?pageNo=__id__",
			current_page:${currentNo}
        });
    }

    function voteAreaPageCtrl() {
        var voteWorkNum = $('#voteCart > li').length;
    	if( voteWorkNum >0 && voteWorkNum <=<%=Constant.VOTE_WORKS_SIZE%>) {
    		$('#voteButton').removeAttr("disabled");
    	} else {
    		$('#voteButton').attr("disabled", true);
    	}
    }
	
	function addVoteCart(item) {
		var imageClone = item.find("img").clone();
		var nameClone = item.find(".name").clone();
		var link = $("<a/>", {
			text: 'delete',
			href: item.attr('id'),
			click: function(event){
				event.preventDefault();
				$(this).parents('li').remove();
				var origin = $("#"+$(this).attr('href'));
				origin.removeClass("added");
				origin.find(".addLink").show();
				commiteData("templateDeleteVotes", $(this).attr('href'));
				voteAreaPageCtrl();
		}
		});
		var p = $("<p/>").append(nameClone).append(link);
		var voteCartLi = $("<li/>").append(imageClone).append(p);
		$('#voteCart').append(voteCartLi);
		voteAreaPageCtrl();
	}
	
	function commiteData(method, dt){ 
		$.ajax({
			url: "workvote?method="+method,
			data: {'workId': dt},	
			type: "POST"
		});	
	}
	
	function registerAddAction() {
		$("#articles .addLink").click(function(event){
			event.preventDefault();
			var item = $(this).parents('li');
			addVoteCart(item);
			item.addClass("added");
			$(this).hide();
			commiteData("templateSaveVotes", item.attr('id'));
		});
	}	
    
	function registerExistDeleteAction() {
		$("#voteCart a").click(function(event){
			event.preventDefault();
			$(this).parents('li').remove();
			var origin = $("#"+$(this).attr('href'));
			origin.removeClass("added");
			origin.find(".addLink").show();
			commiteData("templateDeleteVotes", $(this).attr('href'));
			voteAreaPageCtrl();
		});
	}	

	function commitVoteArticalAction() {
		$("#voteButton").click(function(event){
			$.post("workvote?method=vote", function(data) {
				$("#voteMsg").html(data);
			});
		});		
	}
	
	
    $(document).ready(function(){
        initPagination();
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
    });
</script>

<style type="text/css">
ul{
  list-style-type: none;
  padding: 0;
  margin: 0;
}

li.added { background-color:orange; }

html, body {margin:0; padding:20px; font-size:0.95em;} 
#main {float:left; width: 60%; padding-right:10px;}
#toVote {
  float:right; width: 30%; 
	min-height:300px;
	border-style:dashed; border-width:2px;
	text-align:center; background-color:#CCFFCC;
}

/* for ie6 \*/
* html #toVote {height:300px}
/* ie6 end */


li {margin: 10px; height: 150px;}


#articles img, a img {
float: left;
vertical-align: top;
margin:0 1em 1em 0;
}

#articles .link {float:right;}

</style>


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
				<a  <c:if test="${work.readyVoted}">style="display:none"</c:if> class="addLink" href="#">add</a>
				<a href="workvote?method=goToDiscuss&workId=${work.workId}">评论</a>
			</div>
			<a href="${work.videoUrl}" class="workUrlLink"><img src="${work.imageUrl}" /></a>
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


<div id="toVote">
	<h3>投票区</h3>
	<div id="voteMsg"></div>
	<ul id="voteCart">
	<c:if test="${fn:length(simpleWorks)> 0}">
		<c:forEach var="simpleWork" items="${simpleWorks}">
			<li>
			<img src="${simpleWork.imageUrl}" />
			<p><span class="name">${simpleWork.workTitle}</span><a href="${simpleWork.workId}">delete</a></p>
			</li>
		</c:forEach>
	</c:if>
	</ul>	
	<div id="voteCommit">
	<%
		HashMap<String, String> map = (HashMap<String, String>)session.getAttribute("jpgVoteDatas");
		if(map == null || map.size() == 0 || map.size() > Constant.VOTE_WORKS_SIZE){
			request.setAttribute("isInvalidVote", true);
		} else {
			request.setAttribute("isInvalidVote", false);
		}
		
	%>
	<input type="button" id="voteButton" value="投票" <c:if test="${isInvalidVote}">disabled="disabled"</c:if> />
	</div>
</div>

</body>