# easy-vpn

A script to create a VPN server and client certficates to access the created VPN.

## Usage

Update the variables in `./vars` and then run `./install.sh`. The script that is run assumes you have an AWS redhat VPS that you want to target (see vars to see where to specify its IP).

### Vars

|key|value|
|---|---|
|VPS_PEM|the certificate file to access your server|
|IP|the IP address of your server|
|USER|the username to connect to your server|
