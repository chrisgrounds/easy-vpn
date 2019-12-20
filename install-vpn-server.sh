sudo yum upgrade
sudo yum update
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo yum install openvpn easy-rsa -y

cd /etc/openvpn

# Move easyRSA
sudo cp -R /usr/share/easy-rsa/3.0.6 easyrsa

# RSA
sudo ./easyrsa init-pki
sudo ./easyrsa build-ca
sudo ./easyrsa build-server-full server
sudo ./easyrsa build-client-full client1
sudo ./easyrsa gen-dh

# Config
sudo cp /usr/share/doc/openvpn-2.4.4/sample/sample-config-files/server.conf /etc/openvpn
sudo mkdir /etc/openvpn/client
sudo cp /usr/share/doc/openvpn-2.4.4/sample/sample-config-files/client.conf /etc/openvpn/client

# Move keys and certs
#####
# Instead of doings this, sed the server.conf to point at their locations
# Instead of hardcoding _client1_, use sed and a variable
# tls-auth comment out on server and client confs
# set ip on client conf
#####
sudo cp /etc/openvpn/easyrsa/pki/dh.pem /etc/openvpn
sudo cp /etc/openvpn/easyrsa/pki/ca.crt /etc/openvpn
# Server
sudo cp /etc/openvpn/easyrsa/pki/issued/server.crt /etc/openvpn
sudo cp /etc/openvpn/easyrsa/pki/private/server.key /etc/openvpn

# Client
sudo cp /etc/openvpn/easyrsa/pki/issued/client1.crt /etc/openvpn/client
sudo cp /etc/openvpn/easyrsa/pki/private/client1.key /etc/openvpn/client
sudo cp /etc/openvpn/ca.crt /etc/openvpn/client
