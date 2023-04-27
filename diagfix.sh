sudo sleep 60s
sudo rm -f /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/DistroSpecific.py
sudo cd /var/lib/waagent/Microsoft.Azure.Diagnostics.LinuxDiagnostic-4.1.6/
sudo wget https://bitbucket.org/jophi99/azuretools/raw/31cb5bf19b21c82320682f7c34a78f00e0b827ee/DistroSpecific.py -q
