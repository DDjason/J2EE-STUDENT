var xmlhttp;

/**
* ajax初始化
* @param url 地址：jsp网页
* @param cfunc 回调函数
*/
function loadXMLDoc(url,cfunc){
	xmlhttp = false;
	
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else{
		// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=cfunc; // 处理函数
	xmlhttp.open("GET",url,true); // 打开
	xmlhttp.send( null ); // 发送
}

function LoadFun(){
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200){
			alert("dfs");
			//alert("执行成功");
			//document.getElementById("toolTip").innerHTML=xmlhttp.responseText;
			var result = xmlhttp.responseText;
			alert( result );
			if( result == 1 ){
				alert( "执行成功" );
				window.location.href = "Dtable.jsp";
			}
			else{
				alert( "执行失败" );
			}
			//document.getElementByld("toolTip").style.display="block";
		}else{
			//alert("你所请求的页面有错误!");
		}
	}
}
function GetResultD(){
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200){
			//alert("执行成功");
			//document.getElementById("toolTip").innerHTML=xmlhttp.responseText;
			var result = xmlhttp.responseText;
			//alert( result );
			if( result == 1 ){
				alert( "执行成功" );
			}
			else{
				alert( "执行失败" );
			}
			//document.getElementByld("toolTip").style.display="block";
		}else{
			//alert("你所请求的页面有错误!");
		}
	}
}

function GetResult(){
	if(xmlhttp.readyState == 4){
		if(xmlhttp.status == 200){
			//alert("执行成功");
			//document.getElementById("toolTip").innerHTML=xmlhttp.responseText;
			var result = xmlhttp.responseXML.getElementsByTagName(
			  "repeat")[0].firstChild.nodeValue;
			alert( result );
			if( result == "true" ){
				alert( "执行成功" );
			}
			else{
				alert( "执行失败" );
			}
			//document.getElementByld("toolTip").style.display="block";
		}else{
			//alert("你所请求的页面有错误!");
		}
	}
}

