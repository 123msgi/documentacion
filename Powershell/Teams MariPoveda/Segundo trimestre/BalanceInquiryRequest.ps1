Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.BalanceInquiryRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()
   DocType="CC"
   DocNumber="63366591"
   Amount = "3000"
   }

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)