#!/bin/bash
source `dirname $0`/utils.sh

# $1 - output directory, defaults to "."
# key will be created as: server.key
# cert will be created as: server.crt
# also server.csr will be produced

OUTPUT_DIR=$1
[ -n $OUTPUT_DIR ] || OUTPUT_DIR="."

info "Creating SSL key"
execute openssl genrsa -out $OUTPUT_DIR/server.key 2048

info "Crearting SSL CSR"
execute openssl req -new -key $OUTPUT_DIR/server.key -out $OUTPUT_DIR/server.csr -nodes -subj '/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com'

info "Creating SSL certificate"
execute openssl x509 -req -days 365 -in $OUTPUT_DIR/server.csr -signkey $OUTPUT_DIR/server.key -out $OUTPUT_DIR/server.crt