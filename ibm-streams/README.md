# IBM Streams

IBM Streams is a software platform that enables the development and execution of applications that process information in data streams. It evaluates a broad range of streaming data, including unstructured text, video, audio, geospatial, and sensor data, helping organizations spot opportunities and risks as they happen. IBM Streams can be combined with other IBM Cloud Pak for Data capabilities, built on an open, extensible architecture, to enable data scientists to collaboratively build models to apply to stream flows and analyze massive amounts of data in real-time.

# IBM Streamtool Commands

The `streamtool` command-line utility is used to manage IBM Streams instances, applications, and resources.

## Show Instances

- `streamtool lsinstance -i <instance_name>`: List all running Streams instances.

## Start an Instance

- `streamtool startinstance -i <instance_name>`: Start a Streams instance with the specified name.

## Stop an Instance

- `streamtool stopinstance -i <instance_name>`: Stop a running Streams instance.

## Show Jobs

- `streamtool lsjob -i <instance_name>`: List all running jobs in a Streams instance.

## Submit a Job

- `streamtool submitjob <job_sab> -i <instance_name>`: Submit a job to a Streams instance. Example: `streamtool submitjob -C data-directory=/path/to/directory /path/to/directory/myApp.sab -i myInstance`

## Cancel a Job

- `streamtool canceljob -j <job_id>`: Cancel a running job. Example: `streamtool canceljob -j 12345`

## Capture State

- `streamtool capturestate --select jobs -i <instance_name>`: Capture the state of jobs. Example: `streamtool capturestate --select jobs=all -i myinstance`

## Check Dependency

- `streamtool checkdependency`: Check the job's dependency status. Example: `streamtool checkdependency -v 3`

## Check Domain Metrics

- `streamtool checkdomainmetrics -d <domain_name>`: Check metrics for a specific domain. Example: `streamtool checkdomainmetrics -d mydomain`

## Check Hosts

- `streamtool checkhosts`: Check the status of all hosts in the Streams instance.

## Check Instance Metrics

- `streamtool checkinstancemetrics -i <instance_name>`: Check metrics for a specific instance. Example: `streamtool checkinstancemetrics -i myinstance`

## Check ZooKeeper

- `streamtool checkzk`: Check the ZooKeeper status. Example: `streamtool checkzk`

## Export Keystore

- `streamtool exportkeystore -k /path/to/directory/keystore.jks -p <password>`: Export the keystore to a file. Example: `streamtool exportkeystore -k /path/to/directory/keystore.jks -p mypassword`

## Generate Certificate

- `streamtool gencertificate -k <keystore_name>`: Generate a new certificate. Example: `streamtool gencertificate -k <keystore_name> -dn "CN=host, OU=Company, ST=State, C=US"`

## Get ACL

- `streamtool getacl -i <instance_name>`: Get ACL information for an instance. Example: `streamtool getacl -i myinstance`

## Get Domain/Instance State

- `streamtool getdomainstate -d <domain_name> -l`: Get the state of a domain. Example: `streamtool getdomainstate -d mydomain -l`

- `streamtool getinstancestate -i <instance_name> -l`: Get the state of an instance. Example: `streamtool getinstancestate -i myinstance -l`

## Get Appconfig

- `streamtool getappconfig <app_config> -i <instance_name>`: Get app config of an instance. Example: `streamtool getappconfig myappconfig -i myinstance`

## Get Debug Logs

- `streamtool checkdomainhosts -v 3`
- `streamtool getlog --includeapps -d mydomain -i myinstance`
- `streamtool getdomainstate -l -d mydomain`
- `streamtool getresourcestate -l -d mydomain -i myinstance`
- `streamtool lsjobs -d mydomain -i myinstance`
- `streamtool lspes -d mydomain -i myinstance`
- `streamtool getzkstate`

## Grant Job Permission

- `streamtool grantjobpermission <permission> -i <instance_name> -J <job_group>`: Grant permissions to a user for a job. Example: `streamtool grantjobpermission ALL -i myinstance -j myJobGroup`

## Import Keystore

- `streamtool importkeystore -k <keystore_name> -p <password> -f <keystore_file>`: Import a keystore from a file. Example: `streamtool importkeystore myKeystore -i myinstance -p mypassword -f keystore.jks`

## Register Domain Host

- `streamtool registerdomainhost -d <domain_name> -h <host_name>`: Register a domain host. Example: `streamtool registerdomainhost -d mydomain -h myhost`

## Request Certificate

- `streamtool requestcertificate -f filename`: Request a new certificate. Example: `streamtool requestcertificate -f filename`

## Restart Domain Service

- `streamtool restartdomainservice -d <domain_name> <domain_service>`: Restart domain service. Example `streamtool restartdomainservice sws`

## Set ACL

- `streamtool setacl -i <instance_name> -j <job_id> -p <permission> -u <user>`: Set ACL permissions for a job. Example: `streamtool setacl -i myinstance -j 12345 -p view -u myuser`

## Set Boot Property

- `streamtool setbootproperty -i <instance_name> -p <property_name> -v <property_value>`: Set a boot property for an instance. Example: `streamtool setbootproperty -i myinstance -p myproperty -v myvalue`

## Start/Stop Domain

- `streamtool startdomain -d <domain_name>`: Start a domain. Example: `streamtool startdomain -d mydomain`
- `streamtool stopdomain -d <domain_name>`: Stop a domain. Example: `streamtool stopdomain -d mydomain`

## Update Certificate

- `streamtool updatecertificate -i <instance_name> -a <alias> -p <password>`: Update a certificate. Example: `streamtool updatecertificate -i myinstance -a mycert -p mypassword`

## Upgrade Domain/Instance

- `streamtool upgradedomain -d <domain_name>`: Upgrade a domain. Example: `streamtool upgradedomain -d mydomain`
- `streamtool upgradeinstance -i <instance_name>`: Upgrade an instance. Example: `streamtool upgradeinstance -i myinstance`

## View Log

- `streamtool viewlog -i <instance_name> -j <job_id>`: View the log for a specific job. Example: `streamtool viewlog -i myinstance -j 12345`

## Version

- `streamtool version`: Display the Streamtool version.

For detailed information and options for each command, refer to the [IBM Streamtool](https://www.ibm.com/docs/en/streams/5.5?topic=reference-streamtool-commands) documentation or use `streamtool help <command>` to get specific command help.
