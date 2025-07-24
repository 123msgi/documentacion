
   
function changeContent()
{
var x=document.getElementById('channeldesc');

if(document.getElementById('select2').value == 'ASCIIChannel')
      x.innerHTML="Four ASCII characters header indicating message length, suitable for ASCII based ISO Message ";
if(document.getElementById('select2').value == 'ASCII2BChannel.java')
    x.innerHTML="2 Byte Message Header indicating message length ASCII Channel";
if(document.getElementById('select2').value == 'ASCII2BRChannel')
    x.innerHTML="2 Byte Message Header, reverse order  indicating message length ASCII Channel";
if(document.getElementById('select2').value == 'NACChannel')
    x.innerHTML="Talks with TCP based NACs  Sends [LEN][TPDU][ISOMSG] (len=2 bytes network byte order)";
if(document.getElementById('select2').value == 'AmexChannel')
    x.innerHTML="AMEX Compatible ISOChannel";
if(document.getElementById('select2').value == 'BASE24Channel')
    x.innerHTML="Implements an ISOChannel capable to exchange messages with  ACI's BASE24[tm] over an X.25 link.";
    
if(document.getElementById('select2').value == 'BASE24TCPChannel')
    x.innerHTML="Implements an ISOChannel able to exchange messages with ACI's BASE24 over a TCP link, modified from BASE24ISOChannel ";

if(document.getElementById('select2').value == 'BCDChannel')
    x.innerHTML="Talks with TCP based NCCs Sends [LEN][TPDU][ISOMSG] (len=2 bytes HEX) ";

if(document.getElementById('select2').value == 'CSChannel')
    x.innerHTML="CS Channel, Talks with legacy C++ systems, sends message length in XX00 format where XX is the message length followed by 2 zeroes";

if(document.getElementById('select2').value == 'GZIPChannel')
    x.innerHTML=" Compressed GZIP Channel ";

if(document.getElementById('select2').value == 'HEXChannel')
    x.innerHTML=" 4 byte hex message length header Channel ";

if(document.getElementById('select2').value == 'NCCChannel')
    x.innerHTML="Talks with TCP based NCCs Sends [LEN][TPDU][ISOMSG] (len=2 bytes BCD) ";

if(document.getElementById('select2').value == 'PADChannel')
    x.innerHTML=" Implements an ISOChannel suitable to be used to connect to an X.25 PAD. ";

if(document.getElementById('select2').value == 'PostChannel')
    x.innerHTML=" ISOChannel implementation - Postilion Channel Send packet len (2 bytes network byte order MSB/LSB) followed by raw data. ";

if(document.getElementById('select2').value == 'RawChannel')
    x.innerHTML=" ISOChannel implementation - RAW Channel Send packet len (4 bytes network byte order) followed by raw data. Usefull when you need to send propietary headers with ISOMsgs (such as NAC's TPDUs) ";

if(document.getElementById('select2').value == 'RBPChannel')
    x.innerHTML=" RBP Channel ";


if(document.getElementById('select2').value == 'TelnetXMLChannel')
    x.innerHTML="Implements an ISOChannel able to exchange <b>jPOS generated</b> (or compliant) XML based ISO-8583 messages through a Telnet session the telnet commands are simply ignored.";

    
if(document.getElementById('select2').value == 'VAPChannel')
    x.innerHTML="VISA Compatible VAP Frame";

if(document.getElementById('select2').value == 'X25Channel')
    x.innerHTML="X.25 PAD , legacy PAD Channel 1.4, for newer versions use PAD Channel ";

if(document.getElementById('select2').value == 'XMLChannel')
    x.innerHTML="JPOS Propietary XML Format for ISO8583 Message ";




    

}




function changeService()
{
 var s = document.getElementById('destip');
 
if(document.getElementById('select').value == 'Client')
    s.innerHTML=' <input name="destip" type="text" id="textfield" value="" />';

if(document.getElementById('select').value == 'Server')
    s.innerHTML=" ";

}


function changePackager()
{



 var x=document.getElementById('packagerdesc');

 var valuey = document.getElementById('select3').value;


      x.innerHTML=hashPackagerNames[valuey];











}


function changeChannel()
{



 var x=document.getElementById('channeldesc');

 var valuey = document.getElementById('select2').value;


      x.innerHTML=hashChannelNames[valuey];











}

function changeChannelType()
{


 //alert('change chan type');
   
    var x=document.getElementById('channellist');

    var valuey = document.getElementById('channeltypeid').value;


     if(valuey=='Custom')
       x.innerHTML = customChannels;

     else
       x.innerHTML = defaultChannels;
       
   

}



