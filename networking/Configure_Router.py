#Khalid Diriye - IT 462 - Configure Router

import sys
import getpass
import telnetlib

#Assign hosts
HOST1 = '10.1.1.1'
HOST2 = '10.1.1.2'

#Setup host with telnet
R1 = telnetlib.Telnet(HOST1)
R2 = telnetlib.Telnet(HOST2)

#Run commands new line for each
R1.write("en\n")
R1.write("conf t\n")
R1.write("interface fa0/0\n")
R1.write("ip address 10.1.1.1 255.255.255.0\n")
R1.write("media-type 100BaseX\n")
R1.write("full-duplex\n")
R1.write("exit\n")
R1.write("write memory\n")

#Print results
print(R1.read_all())

#Run commands new line for each
R2.write("en\n")
R2.write("conf t\n")
R2.write("interface fa0/0\n")
R2.write("ip address 10.1.1.2 255.255.255.0\n")
R2.write("media-type 100BaseX\n")
R2.write("full-duplex\n")
R2.write("exit\n")
R2.write("write memory\n")

#Print results
print(R2.read_all())





