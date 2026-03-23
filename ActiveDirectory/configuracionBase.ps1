$nameServer="orion"
$addressIP="192.168.1.254"
$networkInternal="Ethernet 1"
Rename-Computer -NewName $nameServer
Get-NetAdapter –name $networkInternal | Remove-NetIPAddress -Confirm:$false
Get-NetAdapter –name $networkInternal | New-NetIPAddress –addressfamily IPv4 –ipaddress $addressIP –prefixlength 24 –type unicast
Restart-Computer -force
