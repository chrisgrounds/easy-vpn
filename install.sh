source ./vars

scp -i $VPS_PEM ./install-vpn-server $USER@$IP:/home/$USER
ssh -i $VPS_PEM ./install-vpn-server $USER@$IP -t "cd /home/$USER && ./install-vpn-server"

# Separate out server and client stuff
