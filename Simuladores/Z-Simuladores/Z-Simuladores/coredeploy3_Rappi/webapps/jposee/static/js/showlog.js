
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




        var xmlHttp2;

function getDataCP2()
        {

  //     alert("getdatacp1");


var servicename2=document.getElementById("servicename").value;






xmlHttp2=GetXmlHttpObject2();
if (xmlHttp2==null)
        {
        alert ("Browser does not support HTTP Request");
return;
}
        var url2="/jposee/isotest/showLog.html";

url2=url2+"?sid="+Math.random()+"&servicename="+servicename2;

//alert(url2);


xmlHttp2.onreadystatechange=stateChangedCP2;
xmlHttp2.open("GET",url2,true);
xmlHttp2.send(null);


}


        function startTimer2()
        {
       // alert("hello world");

     //   getDataCP2();

 var timer2 = setInterval("getDataCP2()", 10000);


}

        function stateChangedCP2()
        {
        if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete")
        {

        var counts = xmlHttp2.responseText;

      //   alert(counts);

document.getElementById("isolog").value=counts;

var pos1 = getCaret2(document.getElementById("isomessage"));

//var pos1 =doGetCaretPosition(document.getElementById("isomessage"));

setCaretToEnd(document.getElementById("isolog"));


setCaretPosition(document.getElementById("isomessage"), pos1)

//setCaretToEnd(document.getElementById("isomessage"));


//setCaretPos(document.getElementById("isolog"), pos);

// alert("getdatacp1 b");



}







        }



        function GetXmlHttpObject2()
        {
        var xmlHttp2=null;
try
        {
        // Firefox, Opera 8.0+, Safari
        xmlHttp2=new XMLHttpRequest();
}
        catch (e)
        {
        //Internet Explorer
        try
        {
        xmlHttp2=new ActiveXObject("Msxml2.XMLHTTP");
}
        catch (e)
        {
        xmlHttp2=new ActiveXObject("Microsoft.XMLHTTP");
}
        }
        return xmlHttp2;
}


function setCaretToEnd (el) {
 if (el.createTextRange) {
   var v = el.value;
   var r = el.createTextRange();
   r.moveStart('character', v.length);
   r.select();
 }
}

function setCaretPos(el, pos)
         {
    if (el.createTextRange) {
   var v = el.value;
   var r = el.createTextRange();
   r.moveStart('character', pos);
   r.select();
 }



         }

function getCaret(el) {

         if (el.selectionStart) {     return el.selectionStart;   } else if (document.selection) {     el.focus();
var r = document.selection.createRange();     if (r == null) {       return 0;     }     var re = el.createTextRange(),
        rc = re.duplicate();     re.moveToBookmark(r.getBookmark());     rc.setEndPoint('EndToStart', re);     return rc.text.length;   }
        return 0; }

        function getCaret2(el) {
          if (el.selectionStart) {
            return el.selectionStart;
          } else if (document.selection) {
            el.focus();

            var r = document.selection.createRange();
            if (r == null) {
              return 0;
            }

            var re = el.createTextRange(),
                rc = re.duplicate();
            re.moveToBookmark(r.getBookmark());
            rc.setEndPoint('EndToStart', re);

            return rc.text.length;
          }
          return 0;
        }



        function doGetCaretPosition (ctrl) {

            var CaretPos = 0;
            // IE Support
            if (document.selection) {

                ctrl.focus ();
                var Sel = document.selection.createRange ();

                Sel.moveStart ('character', -ctrl.value.length);

                CaretPos = Sel.text.length;
            }
            // Firefox support
            else if (ctrl.selectionStart || ctrl.selectionStart == '0')
                CaretPos = ctrl.selectionStart;

            return (CaretPos);

        }


        function setCaretPosition(ctrl, pos)
        {

            if(ctrl.setSelectionRange)
            {
                ctrl.focus();
                ctrl.setSelectionRange(pos,pos);
            }
            else if (ctrl.createTextRange) {
                var range = ctrl.createTextRange();
                range.collapse(true);
                range.moveEnd('character', pos);
                range.moveStart('character', pos);
                range.select();
            }
        }

        function process()
        {
            var no = document.getElementById('no').value;
            setCaretPosition(document.getElementById('get'),no);
        }


