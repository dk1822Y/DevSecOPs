import paramiko

# Set constants for ssh connect
host='192.168.1.1'
username='cisco'
password='cisco'
port=22

# Set command to run
command='show ssh'

# Set var to paramiko SSHClient and AutoAddPolicy
Client_SSH = paramiko.SSHClient()
Client_SSH.set_missing_host_key_policy(paramiko.AutoAddPolicy())

#Attempt connection
try:
    #Connect to SSH with credentials
    Client_SSH.connect(host,port,username,password)
except paramiko.SSHException:
    print ("Failed to connect")
    quit()
    
# Create output for the "command"
stdin,stdout,stderr = Client_SSH.exec_command(command)
output = stdout.readlines()

# Print results
print ('\n'.join(output))


