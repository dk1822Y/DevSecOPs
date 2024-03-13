# Apache Ambari Management Packs

Apache Ambari Management Packs offer a solution to the problem of tightly coupling stack definitions with Ambari core releases. By decoupling core functionality (cluster management and monitoring) from stack management and definition, Mpacks allow for more flexibility in releasing and updating stack definitions, stack add-on service definitions, and other related artifacts.

The use of Mpacks allows these artifacts to be released independently of the main Apache Ambari releases, providing a separate release vehicle. This enables a more modular and flexible approach to managing services and stacks within the Ambari ecosystem. The inclusion of a metadata file (mpack.json) in the tarballs helps specify the contents of the management pack and provides instructions for the installation process. Below we can see resource extension being used to create custom management packages.

## Extending Ambari Resource Management

```py
from resource_management.core.logger import Logger
from resource_management.libraries.functions.check_process_status import check_process_status
from resource_management.libraries.functions.format import format
from resource_management.libraries.script.script import Script
from resource_management.core.resources.system import Directory, File, Execute
from resource_management.core.source import Template, InlineTemplate, DownloadSource

class ServiceControl(Script):
    def install(self, env):
        pass

    def configure(self, env):
        import params
        env.set_params(params)

    def start(self, env):
        import params
        env.set_params(params)
        Execute(
            format("path/to/service/bin/start_service_command"),
            user=params.service_user
        )

    def stop(self, env):
        import params
        env.set_params(params)
        Execute(
            format("path/to/service/bin/stop_service_command"),
            user=params.service_user
        )

    def status(self, env):
        # Replace the path below with the path to your service's PID file
        check_process_status("/path/to/service/pid_file.pid")


if __name__ == "__main__":
    ServiceControl().execute()
```

Custom alerts can be created in Ambari which perform a health check by querying the server's status via its management API and returns the health status. The script is intended for integration into monitoring frameworks to enable automated health checks and alerts.

## Custom Alerting

```py
#!/usr/bin/env python

import sys
from datetime import datetime

def handle_alert(definition_name, definition_label, service_name, alert_state, alert_text, alert_timestamp='N/A', hostname='N/A'):
    """
    Handles an alert triggered by Ambari.

    :param definition_name: The unique ID of the alert definition.
    :param definition_label: The human-readable label for the alert definition.
    :param service_name: The name of the service to which the alert definition belongs.
    :param alert_state: The state of the alert (e.g., OK, WARNING).
    :param alert_text: The descriptive text of the alert.
    :param alert_timestamp: The timestamp when the alert was triggered. Defaults to 'N/A' if not provided.
    :param hostname: The hostname for which the alert was triggered. Defaults to 'N/A' if not provided.
    """

    # Generate a timestamp for when this script was called
    script_timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # Add your custom logic here to handle the alert, such as logging or sending a notification

    # Example of logging the alert details
    print(f"Timestamp: {script_timestamp}, Alert: {definition_label} ({definition_name}), Service: {service_name}, State: {alert_state}, Details: {alert_text}, Alert Timestamp: {alert_timestamp}, Hostname: {hostname}")

def main():
    if len(sys.argv) not in [6, 8]:
        print("Incorrect number of arguments. Expected either 6 or 8 arguments.")
        sys.exit(1)

    # Unpack the command-line arguments
    definition_name, definition_label, service_name, alert_state, alert_text = sys.argv[1:6]

    # Additional arguments for AMBARI-20291
    if len(sys.argv) == 8:
        alert_timestamp, hostname = sys.argv[6:8]
    else:
        alert_timestamp = hostname = 'N/A'

    handle_alert(definition_name, definition_label, service_name, alert_state, alert_text, alert_timestamp, hostname)

if __name__ == '__main__':
    main()
```

## Setup and Create Ambari Alert Target

- `vi /etc/ambari-server/conf/ambari.properties`
  - my.custom.alert.dispatcher.script=PATH_TO/ambari_custom_alert_dispatcher.py
- `ambari-server restart`

```shell
curl -i \
  -u $(whoami) \
  -H 'X-Requested-By: ambari' \
  -XPOST \
  "https://AMBARI_SERVER_HOST:8443/api/v1/alert_targets" \
  -d '
  {
    "AlertTarget":
      {
        "name": "my_custom_dispatcher",
        "description": "My Custom Dispatcher",
        "notification_type": "ALERT_SCRIPT",
        "global": true,
        "alert_states": ["CRITICAL"],
        "properties": {
          "ambari.dispatch-property.script": "my.custom.alert.dispatcher.script"
        }
      }
  }
'
```
