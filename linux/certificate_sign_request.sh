#!/usr/bin/env bash

# Set the password for the keystore
STOREPASS=changeme

# Get the fully qualified domain name of the host
SUBJECT="$(hostname -f)"

# Get the current date in YYYYMMDD format
DATE="$(date +%Y%m%d)"

# Directory where backup will be stored
BACKUP="/tmp/cert_backup_$DATE"

# Create necessary directories if they don't exist
mkdir -p "$BACKUP"

# Change directory to where certificates are stored
cd /apps/certs

# Create backup of existing files with subject name
mv $SUBJECT* "$BACKUP"

# Generate keystore, public key, and certificate signing request (CSR)

# Generate keystore with RSA key algorithm, validity of 3 years (1095 days),
# and distinguished name including subject details
keytool -genkey -keyalg RSA -keystore ${SUBJECT}.jks -alias ${SUBJECT} \
-validity 1095 -dname "CN=${SUBJECT},OU=Organizational Unit,O=Organization,L=Locality,S=State,C=Country" \
-keypass $STOREPASS -storepass $STOREPASS

# Export public key in PEM format
keytool -export -alias ${SUBJECT} -keystore ${SUBJECT}.jks -rfc \
-file ${SUBJECT}.pem -storepass $STOREPASS

# Generate certificate signing request (CSR) for the keystore
keytool -certreq -keystore ${SUBJECT}.jks -alias ${SUBJECT} \
-file ${SUBJECT}.csr -storepass $STOREPASS -keypass $STOREPASS

# Output the generated CSR
cat "${SUBJECT}.csr"