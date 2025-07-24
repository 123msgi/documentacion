<mux class="org.jpos.q2.iso.QMUX" logger="<servicename>-log" name="<servicename>-mux">
 <in><servicename>-receive</in>
 <out><servicename>-send</out>
 <unhandled><servicename>-unhandled</unhandled>
 <request-listener class="org.jpos.bsh.BSHRequestListener" logger="<servicename>-log">
  <property name="source" value="cfg/isotest/servicedef/support/<servicename>.bsh" />
  <property name="targeturl" value="<incomingURL>" />
 </request-listener>
</mux>

