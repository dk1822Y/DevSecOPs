# IBM WebSphere Liberty

WebSphere Liberty is a lightweight, modular application server that is designed for cloud-native and microservices-based applications. It is part of the IBM WebSphere family of products and is built on open standards and technologies such as Java EE, Eclipse MicroProfile, and OSGi.

In WebSphere Liberty you can administer the server through CLI or GUI (if avaliable). Below you can find some linux commands for administration.

## Configuration

- `server.xml`: This file contains the configuration data for a Liberty server. It includes information such as the server name, HTTP and HTTPS ports, SSL configuration, and application deployment settings.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<server description="myServer">
  <featureManager>
    <!-- Add features here -->
  </featureManager>
  <httpEndpoint id="defaultHttpEndpoint"
                host="*"
                httpPort="9080"
                httpsPort="9443" />
  <applicationManager autoExpand="true"/>
  <!-- Add application deployment settings here -->
</server>
```

- `bootstrap.properties`: This file contains the configuration data for the Liberty bootstrap process, which is responsible for starting the server. It includes information such as the server name, JVM options, and classpath settings.

```properties
# Bootstrap properties for Liberty
server.name=myServer
# Set the JVM options
jvm.options=-Xmx512m -XX:+UseParallelGC
# Set the classpath
server.config.dir=/opt/myserver/config
server.config.file=myserver.xml
```

- `jvm.options`: This file contains the configuration data for the Java Virtual Machine (JVM) that runs the Liberty server. It includes information such as the heap size, garbage collection settings, and debug options.

```
# JVM options for Liberty
-Xmx512m
-XX:+UseParallelGC
# Add other JVM options here
```

- `server.env`: This file contains environment variables that are set for the Liberty server. It can be used to set variables such as `JAVA_HOME` and `PATH`.

```
# Environment variables for Liberty
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
PATH=$PATH:/opt/myapp/bin
# Add other environment variables here
```

## Commands

- `server start serverName`: This command can be used to start a Liberty server as a background process. You can also specify options such as `--clean` to start the server without persistent cached data.
- `server stop serverName`: This command can be used to stop a running Liberty server.
- `server create serverName`: This command can be used to create a new Liberty server with the specified name.
- `server package serverName --archive=archiveName.zip`: This command can be used to package a Liberty server into a zip archive with the specified name.
- `server dump serverName`: This command can be used to generate a diagnostic dump of a running Liberty server.
- `server status serverName`: This command can be used to check the status of a Liberty server.
- `server version`: This command can be used to display the version of the Liberty runtime that is currently installed.
- `server env`: This command can be used to display the environment variables that are set for the Liberty runtime.
