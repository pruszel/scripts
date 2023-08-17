# run this is a non-administrative shell

# install Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# download packages
scoop bucket add extras
scoop install extras/fancontrol
