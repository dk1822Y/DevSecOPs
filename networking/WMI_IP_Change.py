import wmi

# Set IP and Subnet
ip = u'192.168.1.8'
subnetmask = u'255.255.255.0'

# Set network configuration adapters to "network_config"
network_config = wmi.WMI('').Win32_NetworkAdapterConfiguration(IPEnabled=True)

# Get the first network adapter
network_adapter = network_config[0]

#Attempt to change IP and Subnet based on constants
try:
    run = network_adapter.EnableStatic(IPAddress=[ip],SubnetMask=[subnetmask])
except Expection as e:
    print( 'Failed to change IP and Subnet', e)
    quit()

print ( 'SUCCESS!! IP changed to: ' + ip + ' ' + 'Subnet changed to: ' + subnetmask )


