Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.CashWithdrawalReversalRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()
   Channel="CNXRKKE13I015J1FOQCP"
   FromAccountType="80"
   DocType="CC"
   DocNumber="63366591"
   Amount="12000"
   OriginalTransactionId="0022a0cd-9ba5-4ac3-9c43-da1f76077029"

}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)