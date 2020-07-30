# openstack-pihole-automated-install
Bash scripts to automate the install of PiHole on an Openstack CentOS 8 Cloud Image

Need to get a Minimal CentOS 8 Cloud Image instance installed and running on your openstack server

Log in image

Install Git
sudo dnf install git

Clone this repo 
sudo git clone https://github.com/seadogger/openstack-pihole-automated-install.git

CD into directory, set script as executable, and run script
cd openstack-pihole-automated-install
sudo chmod 755 pihole-basic-install.sh
sudo ./pihole-basic-install.sh

You should be presented with the PiHole Installer
You can tailor your downstream DNS server but the defaults should work out of the box
Make sure you record your password to log into the console


