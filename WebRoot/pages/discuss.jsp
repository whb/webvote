<%@ include file="/common/taglibs.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>评论</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
		$("#btnDiscuss").click(function(event){
			$.post("workvote?method=discuss",
				{username: $("#username").attr("value"), 
				 discussCommond: $("#discussCommontArea").attr("value"),
				 workId:${work.workId}},
				function(data) {
					$("#discussMsg").html(data);
					
					var comment = $("#discussCommontArea").attr("value");
					$("#discussCommontArea").attr("value", "");
					var d=new Date();
					var localTime=d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate();
					var commenTime = "评论时间："+localTime+"<br />评论内容："+comment;
					var discussLine= $("<li/>").append(commenTime);
					$("#discussesUl").append(discussLine);
				}
			)
		});
	});
</script>

<style type="text/css">
ul{
  list-style-type: none;
  padding: 0;
  margin: 0;
}

html, body {margin:0; padding:20px; font-size:0.95em;} 


li {margin-top: 5px; padding:5px; background-color:#ffffdd;}

#work {height: 150px;}
#work img, a img {
	float: left;
	vertical-align: top;
	margin:0 1em 1em 0;
}
</style>

</head>

<body id="discussWork">

<div id="workArea">
	<div id="work">
		<img src="${work.imageUrl}" />
		<p>
		作品名称:<span class="name">${work.workTitle}</span> <br />
		作者：${work.workAuthor}<br />
		发布日期：${work.workReleaseTime}<br />
		投票数：${work.voteCount}<br />
		作品介绍：${work.worksRecommond}
		</p>
	</div>
</div>

<div id="discussArea">
	用户名：<input type="text" id="username" name="username" /> <br />
	<textarea rows="5" cols="80" id="discussCommontArea"></textarea><br />
	<input type="button" id="btnDiscuss" value="评论" /><div id="discussMsg"></div><br />
	<ul id="discussesUl">
	<c:forEach var="discuss" items="${discussList}">
	<li id="line">
	评论时间：${discuss.discussTime} <br />评论内容：${discuss.discussCommond}
	</li>
	</c:forEach>
	</ul>
</div>

</body>