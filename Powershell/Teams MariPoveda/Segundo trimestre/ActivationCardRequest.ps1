Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.ActivationCardRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()  
   Channel="CFMBQIR78NEIKE0M314Q"
   LastFourCardDigits= "7921"
   DocType="1"
   DocNumber="50521199"
   Pin= "iAndXMYrAeXB7dvn8cNVWGkX9ltJ/XNUqwer/omJY879wGhpoec2vxwY1ex34QKjozDKuz3OtZYq1LZkCvNwy7zlwkaGzN1f0bRt6OJZzGDzWzzLB1SpH/t6+vGetyMUZTkX+2L8GwwCT/hm3y3kvBWO4t5alu1Z4KYOJxd9jbrUXj+VGL2m8jqwtTEHGGEhtRWAErBeAtltwaDQtvxgxMvKYkWu1dKVTgkTsscHwb/50Yq5OsOX1XyYAN3HWt1prPL4YAVO5DxtupwWSQKef2ACqYjpphOFaqri6ytsjTkNj3cSs9tGLiJmvum0VMe1d09kZ9EHA5V1dMPnc9SZQw=="
   VerificationCode= "689546"
   CustomerCode= "CMPCPF"
}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)