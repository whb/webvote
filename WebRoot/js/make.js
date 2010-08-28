var XMLHttpReq;
function createXMLHttpRequest(){
	if(window.XMLHttpRequest){
		XMLHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		XMLHttpReq=new ActiveXObject("Microsoft.XMLHTTP");
	}
}
function makeDiscuss(id,divname){
	var url='GetDiscussInfo?works_id='+id+'&time='+Math.random();
				createXMLHttpRequest();
				XMLHttpReq.open("GET",url,true);
				XMLHttpReq.onreadystatechange=checkStatus;
				XMLHttpReq.send(null);

				function checkStatus(){
					if(XMLHttpReq.readyState==4){
						if(XMLHttpReq.status==200){
							 document.getElementById(divname).innerHTML=XMLHttpReq.responseText;

						}
					}
				}
				
}