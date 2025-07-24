Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.AccountTypeRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()
   DocType="CC"
   DocNumber="50521199"
   }

$request= Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)
$request | fl