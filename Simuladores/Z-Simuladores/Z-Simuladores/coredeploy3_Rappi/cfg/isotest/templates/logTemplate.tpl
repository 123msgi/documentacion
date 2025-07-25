<?xml version="1.0" encoding="UTF-8"?>

<logger name="<servicename>-log" class="org.jpos.q2.qbean.LoggerAdaptor">
  <log-listener class="org.jpos.util.SimpleLogListener" />

  <log-listener class="org.jpos.util.ProtectedLogListener">
    <property name="protect" value="2 14 35 45" />
    <property name="wipe"    value="52 55 120" />
  </log-listener>

 


  <log-listener class="org.jpos.util.RotateLogListener">
    <property name="file" value="log/<servicename>.log" />
    <property name="window" value="86400" />
    <property name="copies" value="90" />
    <property name="maxsize" value="100000000" />
  </log-listener>
</logger>

