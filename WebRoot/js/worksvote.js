	function handlePaginationClick(page_index, jq){
        return true;
    }
	
	function addVoteCart(item) {
		var imageClone = item.find("img").clone();
		var nameClone = item.find(".name").clone();
		var link = $("<a/>", {
			text: '删除',
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