var xmlHttp2;

var name="";
var type="";
/*
*
*
*
*For http://example.com/page.html?a=xxx, the two lines below should return the value after the "=" for the variable "xxx":
fullURL = parent.document.URL
xxx = fullURL.substring(fullURL.indexOf('?')+3, fullURL.length)

**/




        var xmlHttp;

function getDataCP1()
        {

       //alert("getdatacp1");


var isomessage=document.getElementById("isomessage").value;
var count=document.getElementById("count").value;
var delay=document.getElementById("delay").value;
var servicename=document.getElementById("servicename").value;






xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
        {
        alert ("Browser does not support HTTP Request");
return;
}
        var url1="/jposee/isotest/send_post.html";

url1=url1+"?sid="+Math.random();

var params="isomessage="+isomessage+"&count="+count+"&delay="+delay+"&servicename="+servicename;
params=encodeURI(params);
//alert(params);


xmlHttp.onreadystatechange=stateChangedCP1;
//xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
xmlHttp.open("POST",url1,true);
xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlHttp.setRequestHeader("Content-length", params.length);
xmlHttp.setRequestHeader("Connection", "close")

xmlHttp.send(params);
}


        function startTimer1()
        {
       // alert("hello world");

     //   getDataCP1();

// var timer  = setInterval("getDataCP1()", 5000);


}

        function stateChangedCP1()
        {
        if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        {

        var counts = xmlHttp.responseText;


document.getElementById("message").innerHTML=counts;



       // alert("getdatacp1 b");

  getDataCP2();


}







        }



        function GetXmlHttpObject()
        {
        var xmlHttp=null;
try
        {
        // Firefox, Opera 8.0+, Safari
        xmlHttp=new XMLHttpRequest();
}
        catch (e)
        {
        //Internet Explorer
        try
        {
        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
}
        catch (e)
        {
        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
}
        }
        return xmlHttp;
}




