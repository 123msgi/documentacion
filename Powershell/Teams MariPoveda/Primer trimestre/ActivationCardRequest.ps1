Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.ActivationCardRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()
   DocType="1"
   DocNumber="51777145"
   LastFourCardDigits="4476"
   Pin="prGkwHJcUby003t0rCyIooHrxGUi2PVc0ac0asnVy1pR+o3FdqMDV/Jwh6Zc17KP03wHtLVMSGzXK+wqxweIMXswUTzlYne7Jlvo8xX2ykQ6gFKpLX/glrOgwuclXECfg3hQSw/RAa63WBPnHKMZXq/3XvrkGtwUfU4123DwuaJs2/anlSN77fsQhxGzRDiwa4+tXCH4XQVeHXdvF50cxj6ch9gi6vz52W6qAOUpaQo03gLrsx/t19d8oLaxWuHuhMNTPq8MKiWl7O5uy8Yofu3+XC6HyAMXKl4qzqgv66ZO0Ldd9d1ruIORjAc/BN+xRPY5xyBWy2Jq8nLPvvC4Sg=="
   VerificationCode="694561"
   Channel="COMPCN2SISSOIL27AJR8"
   CustomerCode="cmpcpf"
}

#$Response=Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)
#$Response |fl


#Describe 'Consumo de la ruting'{
 #    It 'Code' {            
  #          $Response.ResponseCode| Should Be 200
    #    }
   #  It 'Message' {            
    #        $Response.ResponseMessage 
       # }        
#}

#$resultado=  $Response.ResponseCode 


#if ($resultado -eq 200  ) {
  #write-host("Dato transaccional: ") $Response.Date
  #write-host("Codigo de respuesta: ")$Response.ResponseCode
  #write-host("Mensaje de respuesta: ") $Response.ResponseMessage
  #write-host("Numero de las tarjetas: ")$Response.Accounts.AccountNumber
  
  
#}else{
#   write-host("Verifique la peticion, revise el cuerpo de la petición.")
#   write-host("Mensaje de respuesta: ")$Response.ResponseMessage
#}
