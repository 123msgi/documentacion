Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.TokenRequest:Processa.RabbitMQ.Services.Bifrost" 
$Exchange = "easy_net_q_rpc"

$Body = @{
   
   DocumentNum="63366591"
   DocumentType="CC"
   Channel="COMPCN2SISSOIL27AJR8"

}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)