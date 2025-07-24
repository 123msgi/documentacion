Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.CardHolderRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()  
   #Channel="COMPMOV60A6GLOB8L013"
   #LastFourCardDigits= "4476"
   DocType="CC"
   DocNumber="50521199"
   #Reason= "Bloqueo por perdida de tarjeta"
   #VerificationCode= "05"
}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)