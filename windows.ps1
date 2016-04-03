# Allow scripts to run
#Set-ExecutionPolicy RemoteSigned

#NOT TESTED YET
#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))



#all computers
choco install notepadplusplus.install -y
choco install 7zip.install -y
choco install dropbox -y
choco install treesizefree -y

#personal computers
choco install flashplayerplugin -y
choco install steam -y
choco install skype -y
choco install itunes -y
choco install f.lux -y
choco install qbittorrent -y
choco install vmware-horizon-client -y  


#development computers
choco install git.install -y
choco install googlechrome -y
choco install javaruntime -y
choco install visualstudiocode -y
choco install powershell -y
choco install nodejs.install -y
choco install chocolateygui -y
choco install ruby -y
choco install filezilla -y
choco install putty -y
choco install python -y
choco install virtualbox -y
choco install fiddler -y
choco install wireshark -y
choco install winmerge -y
choco install webpi -y
choco install nmap -y
choco install dotpeek -y
choco install ilspy -y


#servers
#Install-WindowsFeature -name hyper-v -IncludeManagementTools #-Restart
