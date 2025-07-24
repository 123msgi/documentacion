Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.RefundReversalRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()
   OriginalTransactionId="5ee5ffdb-d038-413e-accd-c5546220463e"
   Channel="CMPCAH8BT5O891SN98GI"
   FromAccountType="80"
   DocType="CC"
   DocNumber="63366591"
   Amount="15000" 
}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)