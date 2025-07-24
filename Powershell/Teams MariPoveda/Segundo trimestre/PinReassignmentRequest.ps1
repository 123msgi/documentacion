Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.PinReassignmentRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()  
   Channel="CFMBQIR78NEIKE0M314Q"
   LastFourCardDigits= "7921"
   DocType="1"
   DocNumber="50521199"
   NewPin= "ku1iCaYXLo+X2ylTCMFKWCJfGAylpESQeNxIy6xAVfcnDth7L9sTj4FQxyauMQD/xW858FstjG/LjBv6EtWoFTcEoUbrbeOZkZlEYC+5l8jgWin6TJbsY9sSZ8gNPqtiz2Yn7D/7jehZFQaSGpyQf8YBg9DR8XORJn4aoRQlfuBxTyy4NwJReMveBS3ofybeK9jY/l+6lLdWAk3ZQAenTpvU4sM2mnNYmyNsyexF3h1VLip3LLn+EuiAdequPWuKBn6qwgB8Cty3RRruPOMCFunqii7DxBAFgjQB4fF4WdkErM17OGFAhnKynWtauGbw28U8vU75hjjHSKP9DrvboA=="
   VerificationCode= "706003"
   CustomerCode= "CMPCPF"
}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)