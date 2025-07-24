Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.PinChangeRequest:Processa.RabbitMQ.Services.Bifrost"
               
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()
   Channel="CFMBQIR78NEIKE0M314Q"
   LastFourCardDigits= "2258"
   DocType="1"
   DocNumber="50521199"   
   OldPin ="WFUyl3LonxVV0uDH0knbeO3iQJox68ez3DNysmshmF8JoBInNi/8clbEBNLslg9s9cHFs+uPqeca655xae8oXZFrbh+f2A17zE99+kSUxB+oj8bd+HvfXVSxgS58dU2Dl2/NDiI2AQZYDQ4KzV/gJl+6B6h7D/c8oWeDnqhWCQPx2Q2DZhJonG9a6n4v3IBicdPG2Vhs/W1tBYDUBkixtsiJpUQoMG28edJzReKiQPzLL9wR62zFSpDQiz1cmumzqKbJ0mkYqCA9EQXlFvEjldjRpwnhcRf3fThwL6U7o2RXgKhkmiuNpOYjqADTha88tQlp7v1ZYs2R60eqoKqHqw==" 
   NewPin= "pRDfJFT0udI7g2xMKVfUSII8fXWIpsGFoyhgged3Q1JFG7mN1ei6iqlL/n+y71vNktXq6E9hBoG2PJ/FX55EdlDpnIuRaDTiFhtqNh+G9qiDB6IHtk9Gz7MXHFdrrCde2RYPHqxGZf1fg6gFGH9W3zdcOUQ/szePc65lfvpYr2EHzorZYlZjDKUuFMq9/qXi5HH60doJ9CI4Swmu7Au8GxBLrD89AQ9tKLGK9strO1i1+CK/pFeVh9UGW+EoeGvavD9/zmhPm0rXTg+dlz6GgSbjks0lhR/ZumihAG6fKOMKsp2Neobou7j+ZZr3fuSAGti1eTxUGVC8gOAM0XqtUQ=="
   VerificationCode = "930504"
   CustomerCode= "CMPCPF"
    
}

Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)