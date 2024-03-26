#!/usr/bin/env bash

# Set the keystore password
STOREPASS=changeme

# Get the fully qualified domain name of the host
SUBJECT="$(hostname -f)"

# Import CA certificate and signed certificate into keystore
keytool -keystore ${SUBJECT}.jks -storepass $STOREPASS -alias cert -import -file cert.crt -noprompt
keytool -keystore ${SUBJECT}.jks -storepass $STOREPASS -alias ${SUBJECT} -import -file ${SUBJECT}.crt -keypass $STOREPASS -noprompt

# Generate private key from keystore
keytool -v -importkeystore -srckeystore ${SUBJECT}.jks -srcalias ${SUBJECT} -srcstorepass $STOREPASS -destkeystore ${SUBJECT}.p12 -deststoretype PKCS12 -deststorepass $STOREPASS
openssl pkcs12 -in ${SUBJECT}.p12 -out ${SUBJECT}_private.pem -passin pass:$STOREPASS -passout pass:$STOREPASS
openssl rsa -in ${SUBJECT}_private.pem -out ${SUBJECT}_private_nopw.pem -passin pass:$STOREPASS
keytool -export -alias ${SUBJECT} -file ${SUBJECT}.cer -keystore ${SUBJECT}.jks -storepass $STOREPASS && openssl x509 -in ${SUBJECT}.cer -inform der -outform pem -out ${SUBJECT}_no_root.crt && rm ${SUBJECT}.cer