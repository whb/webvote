var XMLHttpReq;
function createXMLHttpRequest(){
	if(window.XMLHttpRequest){
		XMLHttpReq=new XMLHttpRequest();
	
	}else if(window.ActiveXObject){
		//XMLHttpReq=new ActiveXObject("Microsoft.XMLHTTP");
		try { 
               XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP"); 
			 
            } catch(e) { 
                try { 
             XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
              } catch(e) { 
             alert(e); 
                          } 

	}
}

}
function getOs()  
{      
if(navigator.userAgent.indexOf("MSIE")>0)     {     
return "MSIE"; //IE浏览器
}  
if(isFirefox=navigator.userAgent.indexOf("Firefox")>0)  
{     

return "Firefox"; //Firefox浏览器   
}  
} 
//增删改样式
function hasClass(ele,cls) {
  return ele.className.match(new RegExp('(\\s|^)'+cls+'(\\s|$)'));
}

function addClass(ele,cls) {
  if (!this.hasClass(ele,cls)) ele.className += " "+cls;
}

function removeClass(ele,cls) {
  if (hasClass(ele,cls)) {
          var reg = new RegExp('(\\s|^)'+cls+'(\\s|$)');
    ele.className=ele.className.replace(reg,' ');
  }
}
//得到作品
function makeWorks(id,divname){

	var url='GetWorksInfo?works_id='+id+'&time='+Math.random();
                 var btype=getOs(); //判断是什么浏览器
				createXMLHttpRequest();
				XMLHttpReq.open("GET",url,false);
				XMLHttpReq.onreadystatechange=(btype=="Firefox")?checkStatus():checkStatus;
				XMLHttpReq.send(null);
				XMLHttpReq.onreadystatechange=(btype=="Firefox")?checkStatus():checkStatus;
				function checkStatus(){
					if(XMLHttpReq.readyState==4){
						if(XMLHttpReq.status==200){
							
							 document.getElementById(divname).innerHTML=XMLHttpReq.responseText;
                            

						}
					}
				}
}
//得到评论信息
function makeDiscuss(id,divname){
	var url='GetDiscussInfo?works_id='+id+'&time='+Math.random();
				createXMLHttpRequest();
				XMLHttpReq.open("GET",url,true);
				
				XMLHttpReq.onreadystatechange=checkStatus;
				XMLHttpReq.send(null);

				function checkStatus(){
					//alert(XMLHttpReq.readyState);
					if(XMLHttpReq.readyState==4){
						if(XMLHttpReq.status==200){
							 document.getElementById(divname).innerHTML=XMLHttpReq.responseText;

						}
					}
				}
				
}
function addDiscuss(id,username,discussCom){
	if(discussCom==""){
		 document.getElementById("discussMsg").innerHTML="请输入评论内容";
		 addClass(document.getElementById("discussMsg"),"warning");
		return false;
		
	}else{
	
	   var url='workvote?method=discuss&workId='+id+'&discussCommond='+encodeURI(discussCom)+'&username='+encodeURI(username)+'&time='+Math.random();
	   
	         //    var btype=getOs(); //判断是什么浏览器
				createXMLHttpRequest();
				XMLHttpReq.open("POST",url,true);
				
				XMLHttpReq.send(null);
				//XMLHttpReq.onreadystatechange=(btype=="Firefox")?checkStatu():checkStatu;
			XMLHttpReq.onreadystatechange=function(){
					if(XMLHttpReq.readyState==4){
						if(XMLHttpReq.status==200){
							 document.getElementById("discussMsg").innerHTML=XMLHttpReq.responseText;
							addClass(document.getElementById("discussMsg"),"success");

						}
					}
				}
	}
}