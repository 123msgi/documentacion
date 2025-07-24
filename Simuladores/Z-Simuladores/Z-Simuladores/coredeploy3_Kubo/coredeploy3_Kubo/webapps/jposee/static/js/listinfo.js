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

     //   alert("getdatacp1");

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
        {
        alert ("Browser does not support HTTP Request");
return;
}
        var url1="/jposee/isotest/list_data_nameregistrar.html";

url1=url1+"?sid="+Math.random();
xmlHttp.onreadystatechange=stateChangedCP1;
xmlHttp.open("GET",url1,true);
xmlHttp.send(null);
}


        function startTimer1()
        {
       // alert("hello world");

        getDataCP1();

var timer  = setInterval("getDataCP1()", 5000);


}

        function stateChangedCP1()
        {
        if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        {

        var counts = xmlHttp.responseText.split(";");

for (i=0;i<counts.length-1;i++)
        {

      //  alert("getdatacp1 a");

document.getElementById(counts[i]).innerHTML=counts[i+1];

i++


       // alert("getdatacp1 b");



}







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




