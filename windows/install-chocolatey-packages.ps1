# run this in an administrative shell

# install Chocolatey
Start-Process powershell -Verb runAs
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# basic apps
choco install -y googlechrome discord notion todoist-desktop calibre firefox zoom gimp
# 1password not version 8
# rescuetime not working

# tools
choco install -y sysinternals hwinfo hwmonitor jre8 virtualbox everything wiztree winrar 

# gaming
choco install -y steam wowup razer-synapse-3 

# media
choco install -y plex vlc no-ip-duc
# deluge doesn't work

# dev tools
choco install -y git vscode jetbrainstoolbox postman docker-desktop wget vim
# sublimetext4 not working
