


#http://www.adminarsenal.com/admin-arsenal-blog/using-powershell-to-set-static-and-dhcp-ip-addresses-part-1/
$IP = "192.168.0.200"
$MaskBits = 24 # This means subnet mask = 255.255.255.0
$Gateway = "192.168.0.1"
#$Dns = "192.168.0.200"
$IPType = "IPv4"
$NewName = "LAB-Server"

# Retrieve the network adapter that you want to configure
$adapter = Get-NetAdapter | ? {$_.Status -eq "up"}

$adapter | set-netipinterface -DHCP Disabled

# Remove any existing IP, gateway from our ipv4 adapter
If (($adapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
    $adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm:$false
}

If (($adapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
    $adapter | Remove-NetRoute -AddressFamily $IPType -Confirm:$false
}

 # Configure the IP address and default gateway
$adapter | New-NetIPAddress `
    -AddressFamily $IPType `
    -IPAddress $IP `
    -PrefixLength $MaskBits `
    -DefaultGateway $Gateway

# Configure the DNS client server IP addresses
#$adapter | Set-DnsClientServerAddress -ServerAddresses $DNS

Rename-Computer -NewName $NewName
Add-Computer -DomainName DIABETES