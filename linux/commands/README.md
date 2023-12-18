# Linux Commands

## Display Current User

- `whoami`

## List Files and Directories

- `ls`
- `ls -l`
- `ls -a`
- `ls -t`
- `ls -r`

## Change Directory

- `cd`
- `cd /path/to/directory`

## Create a Directory

- `mkdir directory_name`
- `mkdir -p /path/to/directory/directory_name`
- `mkdir -m permissions directory_name`
- `mkdir -v directory_name`
- `mkdir -g groupname directory_name`
- `mkdir -u username directory_name`

## Remove a File

- `rm filename`
- `rm -f filename`

## Remove a Directory

- `rm -r directory_name`
- `rm -rf directory_name`

## Copy Files or Directories

- `cp source destination`

## Move or Rename Files/Dirs

- `mv source destination`

## View File Content

- `cat filename`
- `less filename`

## Edit Text Files

- `nano filename`
- `vim filename`
- `vi filename`

## Display System Information

- `uname -a`
- `cat /etc/os-release`

## Show Running Processes

- `ps`
- `top`

## Show Running Processes by Name

- `ps aux | grep "process_name"`
- `ps -ef | grep "process_name"`

## Kill a Process

- `kill process_id`
- `kill -9 process_id`

## Search for Files

- `find /path/to/directory -name filename`

## Search for files (ignore Permission denied using grep)

- `find /path/to/directory -name 'name' 2>&1 | grep -v "Permission denied"`

## Search for files and Execute Command

- `find /path/to/directory -type f -name 'myfile.myextenstion' -execdir mv {} {}.bak`

## Search for broken links

- `find . -type l ! -execdir test -e {} \; -print`

## Change File Permissions

- `chmod permissions filename`

## Change File Ownership

- `chown new_owner:group_owner filename`

## Compress and Decompress

- `tar -czvf archive.tar.gz /path/to/directory`
- `tar -xzvf archive.tar.gz`

## Network Diagnostics

- `ping host`
- `ifconfig`
- `netstat`

## Package Management (apt/yum)

- `sudo apt update`
- `sudo apt upgrade`
- `sudo apt install package_name`
- `sudo apt remove package_name`
- `sudo yum update`
- `sudo yum upgrade`
- `sudo yum remove package_name`
- `sudo yum install package_name`

## SSH Connection

- `ssh username@hostname`

## Disk Usage

- `df`
- `du`

## Disk Usage by Directory and Human Numeric Sort

- `du -csh /path/to/directory/* | sort -h`

## Create symlink (shortcut)

- `ln -s /path/to/directory name`

## File and Text Manipulation

- `touch filename`
- `grep pattern filename`
- `sed 's/old/new/' filename`

## User and Group Management

- `adduser username`
- `passwd username`
- `groupadd groupname`

## System Reboot and Shutdown

- `reboot`
- `shutdown -h now`

## Uptime

- `uptime`
- `uptime && date && hostname -f`

## Loops

- `for x in $HOSTNAME; do ssh $x 'uptime'; done`
- `while true; do ssh $HOSTNAME 'uptime'; sleep 2; done`

## Get Thread Count

- `cat /proc/cpuinfo | awk '/^processor/{print $3}'`

## Get Process ID by Name

- `pgrep -f processname | head -1`

## Display all active TCP connections

- `netstat -ltn`

## Uncompress and display data from compressed files

- `zcat filename.gz | vi -`
- `zless filename.gz`

## Keytool

### List the contents of a keystore file

- `keytool -list -keystore /path/to/keystore`

## OpenSSL

### Display the expiration date of an SSL/TLS certificate

- `openssl x509 -enddate -noout -in /path/to/certificate`

### Test the SSL/TLS connection to a server

- `openssl s_client -showcerts --conect ldap.domain.com:636`
- `openssl s_client -connect hostname`

## XML

### Format, validate, or prettify any XML file

- `xmllint --noout /path/to/xml`
- `xmllint --format /path/to/xml`
