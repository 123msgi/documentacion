  Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.AccountsTransfersRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   DocType="CC"
   DocNumber=""
   CorrelationalId=(New-Guid).ToString()
   Channel="CFMBQIR78NEIKE0M314Q"
   FromAccountType ="80" 
   FromAccountNumber= "6061250027467921"
   ToAccountNumber= "6061250008588034"
   Amount="6000"
}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)