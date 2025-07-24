<?xml version="1.0" ?>
<server class="org.jpos.q2.iso.QServer" logger="<servicename>-log"
name="<servicename>">
<attr name="port" type="java.lang.Integer"><port></attr>
<channel name="post.channel"  class="org.jpos.ee.action.isotest.HarBSHChannel"
         packager="org.jpos.iso.packager.GenericPackager" logger="<servicename>-log">
<property name="packager-config" value="cfg/isotest/packagers/<packager>.xml" />
<property name="channel-config" value="cfg/isotest/channels/<channel>.bsh" />
</channel>
<request-listener class="org.jpos.bsh.BSHRequestListener" logger="<servicename>-log">
<property name="source" value="cfg/isotest/servicedef/support/<servicename>.bsh" />
<property name="targeturl" value="<incomingURL>" />
</request-listener>
<in><servicename>-send</in>
<out><servicename>-receive</out>
</server>
