<?xml version="1.0" ?>
<server class="org.jpos.q2.iso.QServer" logger="Q2"
  name="<servicename>">
 <attr name="port" type="java.lang.Integer"><port></attr>
<channel name="post.channel"  class="org.jpos.iso.channel.<channel>"
                                    packager="org.jpos.iso.packager.GenericPackager" logger="Q2">
 <property name="packager-config" value="cfg/isotest/packagers/<packager>.xml" />

 </channel>
 <request-listener class="org.jpos.bsh.BSHRequestListener" logger="Q2">
  <property name="source" value="cfg/serversimulator3.bsh" />
 </request-listener>
<in><servicename>-send</in>
 <out><servicename>-receive</out>


</server>
