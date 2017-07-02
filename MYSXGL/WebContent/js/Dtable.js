var xmlhttp;

/**
* ajax初始化
* @param url 地址：jsp网页
* @param cfunc 回调函数
*/
function loadXMLDoc(url){
	xmlhttp = false;
	
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=GetResult; // 处理函数
	xmlhttp.open("GET",url,true); // 打开
	xmlhttp.send( null ); // 发送
}

function GetResult(){
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200){
			//alert("执行成功");
			//document.getElementById("toolTip").innerHTML=xmlhttp.responseText;
			//document.getElementByld("toolTip").style.display="block";
		}else{
			//alert("你所请求的页面有错误!");
		}
	}
}



function Dele(Did)
{
	alert(Did);
	loadXMLDoc("DidDelete.jsp?Did="+Did);
	location.reload(true); 
}
