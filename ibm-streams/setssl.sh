#!/usr/bin/env bash
set -e

# Define variables
PROTOCOL=TLSv1.3
DOMAIN_PROPERTIES=("sws.sslProtocol" "domain.sslOption" "aas.sslOption" "jmx.sslOption")
INSTANCE_PROPERTIES=("instance.transportSecurityType" "app.sslOption" "sam.sslOption" "srm.sslOption" "view.sslOption")

# Functions
set_domain_properties() {
    for property in "${DOMAIN_PROPERTIES[@]}"; do
        streamtool setdomainproperty "$property"="$PROTOCOL"
    done
}

set_instance_properties_and_stop() {
    for instance in "${INSTANCE_LIST[@]}"; do
        for property in "${INSTANCE_PROPERTIES[@]}"; do
            streamtool setproperty "$property"="$PROTOCOL" -i "$instance"
        done
        streamtool stopinstance -i "$instance"
    done
}

# Get list of instances
INSTANCE_LIST=( $(streamtool lsinstance) )

# Set domain properties
set_domain_properties

# Set instance properties and stop instances
set_instance_properties_and_stop

# Stop the domain
streamtool stopdomain

# Start the domain
streamtool startdomain

# Start instances
for instance in "${INSTANCE_LIST[@]}"; do
    streamtool startinstance -i "$instance"
done