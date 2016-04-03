# Allow scripts to run
#Set-ExecutionPolicy RemoteSigned

#NOT TESTED YET
#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))



#all computers
#choco install notepadplusplus.install -y





#development computers
choco install git.install -y
choco install visualstudiocode -y
choco install powershell -y
choco install putty -y
choco install fiddler4 -y
choco install wireshark -y
choco install winmerge -y
choco install webpi -y
choco install nmap -y

#servers
#Install-WindowsFeature -name hyper-v -IncludeManagementTools #-Restart
