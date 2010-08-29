﻿<%@ include file="/common/taglibs.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>评论</title>
<script type="text/javascript" src="js/jquery.js"></script>
<link id="css" rel="stylesheet" href="css/discuss.css" type="text/css">
<script type="text/javascript">

	function validationItems(name, common){
		$("#discussMsg").empty();
		var checkflag = true;
		if(name.length<2 || name.length > 20){
			$("#discussMsg").append("用户名必须在2-20个字符之间").append("<br />");
			checkflag = false;
		}
		
		if(common == null || common.length == 0){
			$("#discussMsg").append("请填写评论内容").append("<br />");
			checkflag = false;
		}else if(name.length<10 || name.length > 450){
			$("#discussMsg").append("评论内容必须在10-450个字符之间");
			checkflag = false;
		}
		return checkflag;
	}
	
    $(document).ready(function(){
	
		$("#btnDiscuss").click(function(event){
			var name = $("#username").attr("value");
			var common = $("#discussCommontArea").attr("value");
			
			if (validationItems(name, common) == true){
			
				$.post("workvote?method=discuss",
						{username: name, 
						 discussCommond: common,
						 workId:${work.workId}},
						function(data) {
							$('#discussMsg').html(data);
							$('#discussMsg').delay(5000).fadeOut(1500);
						}
				)
			}
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

<form id="form1">
<div id="discussArea">用户名： <input
	onFocus="this.style.color='#000';if(this.value=='匿名') this.value='';"
	onBlur="if(this.value==''){this.style.color='#CCC';this.value='匿名';}"
	value="匿名" style="color: #CCC" type="text" id="username" /> <br />
<textarea rows="5" cols="80" id="discussCommontArea"></textarea><br />
<input type="button" id="btnDiscuss" value="评论" /></div>
</form>
<ul id="discussesUl">
	<c:forEach var="discuss" items="${discussList}">
		<li>
		<span class="brief">${discuss.discussUsername} |
		${discuss.national} | ${discuss.discussTimeString} </span><br />
		${discuss.discussCommond}</li>
	</c:forEach>
</ul>

</body>