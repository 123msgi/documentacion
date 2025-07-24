Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.PurchaseReversalRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()
   Channel="CFMBQIR78NEIKE0M314Q"
   FromAccountType="80"
   DocType="CC"
   DocNumber="50521199"
   Amount="20000"
   OriginalTransactionId="43975dbd-5706-4eb0-9d5e-f35f12538b8d"

}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)