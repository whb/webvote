<%@ include file="/common/taglibs.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>评论</title>
<script type="text/javascript" src="js/jquery.js"></script>
<link id="css" rel="stylesheet" href="css/discuss.css" type="text/css">
<script type="text/javascript">
    $(document).ready(function(){
		$("#btnDiscuss").click(function(event){
			$.post("workvote?method=discuss",
				{username: $("#username").attr("value"), 
				 discussCommond: $("#discussCommontArea").attr("value"),
				 workId:${work.workId}},
				function(data) {
					$('#discussMsg').html(data);
		    		$('#discussMsg').delay(5000).fadeOut(1500);
				}
			)
		});
	});
</script>

</head>

<body>

<div id="work"><img src="${work.imageUrl}" />
<p>作品名称:<span class="name">${work.workTitle}</span> <br />
作者：${work.workAuthor}<br />
发布日期：${work.workReleaseTime}<br />
投票数：${work.voteCount}<br />
作品介绍：${work.worksRecommond}</p>
</div>

<div id="discussMsg"></div>

<div id="discussArea">用户名： <input
	onFocus="this.style.color='#000';if(this.value=='匿名') this.value='';"
	onBlur="if(this.value==''){this.style.color='#CCC';this.value='匿名';}"
	value="匿名" style="color: #CCC" type="text" id="username" /> <br />
<textarea rows="5" cols="80" id="discussCommontArea"></textarea><br />
<input type="button" id="btnDiscuss" value="评论" /></div>

<ul id="discussesUl">
	<c:forEach var="discuss" items="${discussList}">
		<li>
		<span class="brief">${discuss.discussUsername} |
		${discuss.national} | ${discuss.discussTimeString} </span><br />
		${discuss.discussCommond}</li>
	</c:forEach>
</ul>

</body>