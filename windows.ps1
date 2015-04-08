#NOT TESTED YET
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin


#all computers
choco install notepadplusplus.install
choco install 7zip.install
choco install dropbox
choco install treesizefree

#personal computers
choco install flashplayerplugin
choco install steam
choco isntall skype
choco install itunes
choco install f.lux
choco install qbittorrent 


#development computers
choco install git.install
choco install googlechrome
choco install javaruntime
choco install atom
choco install powershell
choco isntall nodejs.install
choco install chocolateygui
choco install ruby
choco isntall filezilla
choco isntall putty
choco install python
choco isntall vim
choco isntall virtualbox
choco install fiddler
choco install wireshark
choco install winmerge
choco install webpi
choco install nmap
choco install dotpeek 
choco install mongodb
choco install ilspy


#servers
Install-WindowsFeature -name hyper-v -IncludeManagementTools #-Restart
