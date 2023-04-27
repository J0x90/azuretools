#wget https://aka.ms/dependencyagentlinux
#sh InstallDependencyAgent-Linux64.bin -s
##install and apply the CEF collector
sudo dnf -y update --disablerepo=* --enablerepo='*microsoft*' rhui-azure-rhel8-eus
sudo yum update -y
sudo yum install -y python2
sudo update-alternatives --remove-all python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1
sudo setenforce 0
sudo sed -i 's/enforcing/permissive/g' /etc/selinux/config

#sudo lvextend --size +28G /dev/mapper/rootvg-rootlv
#sudo xfs_growfs /dev/mapper/rootvg-rootlv

wget -O cef_installer.py https://bitbucket.org/jophi99/azuretools/raw/53f350d3e883ec122868e22ac48b8be79dc2172d/cef_installer.py
sudo python3 cef_installer.py $1 $2

##Changing the source of the TimeGenerated field
wget -O TimeGeneratedG.py https://bitbucket.org/jophi99/azuretools/raw/53f350d3e883ec122868e22ac48b8be79dc2172d/Time_GeneratedG.py
sudo python3 TimeGeneratedG.py $1
sudo sed -i '46 s/^/#/' /etc/rsyslog.conf
sudo sed -i '49 s/^/#/' /etc/rsyslog.conf
sudo sed -i '52 s/^/#/' /etc/rsyslog.conf
sudo sed -i '65 s/^/#/' /etc/rsyslog.conf
sudo firewall-cmd --permanent --zone=public --add-port=514/tcp
sudo firewall-cmd --permanent --zone=public --add-port=514/udp
sudo firewall-cmd --reload
#sudo sleep 60s
#sudo rm /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/DistroSpecific.py
#wget -O diagfix.sh https://bitbucket.org/jophi99/azuretools/raw/7271b5da0b3dfcb72cd3e0ad1401940d7e667e3e/diagfix.sh
#sudo diagfix.sh &
