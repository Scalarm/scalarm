#!/bin/bash
source `dirname $0`/../utils.sh

create_secrets_yml() {
  cat >config/secrets.yml <<EOS
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
  information_service_url: "<%= ENV["INFORMATION_SERVICE_URL"] %>"
  information_service_user: "<%= ENV["INFORMATION_SERVICE_LOGIN"] %>"
  information_service_pass: "<%= ENV["INFORMATION_SERVICE_PASSWORD"] %>"
EOS
}

create_thin_yml() {
  cat >config/thin.yml <<EOS
pid: tmp/pids/thin.pid
log: log/thin.log
socket: /tmp/scalarm_storage_manager.sock
tag: ScalarmStorageManager
EOS
}

create_thin_yml() {
  cat >config/scalarm.yml <<EOS
db_name: 'scalarm_db'
## key for symmetric encryption of secret database data - please change it in production installations!
## NOTICE: this key should be set ONLY ONCE BEFORE first run - if you change or lost it, you will be UNABLE to read encrypted data!
db_secret_key: "QjqjFK}7|Xw8DDMUP-O$yp"

## where log bank should store content
mongo_host: 'localhost'
mongo_port: 27017
binaries_collection_name: 'simulation_files'

## MongoDB settings
## host is optional - the service will take local ip address if host is not provided
host: ${CLOUD_HOST}

## Password based authentication - supported only by single instance
## To enable stop database, uncomment below settings, run rake db_instance:create_auth and start instance
#auth_username: scalarm
#auth_password: hidden

## MongoDB instance settings
db_instance_port: 30000
db_instance_dbpath: ./../../scalarm_db_data
db_instance_logpath: ./../../log/scalarm_db.log

## MongoDB configsrv settings
db_config_port: 28000
db_config_dbpath: ./../../scalarm_db_config_data
db_config_logpath: ./../../log/scalarm_db_config.log

## MongoDB router settings
db_router_host: localhost
db_router_port: 27017
db_router_logpath: ./../../log/scalarm_db_router.log
EOS
}

# constants
export RAILS_ENV=production

info "Entering scalarm_storage_manager dir"
execute cd $SCALARM_ROOT/scalarm_storage_manager

# info "Generating self-signed SSL certificate"
# execute $SCRIPT_PATH/../generate_ssl_certificate.sh config/

info "Copying sample configuration files"
execute rake service:ensure_config

info "Overriding sample Thin configuration"
execute create_thin_yml

info "Overriding sample scalarm.yml (database) configuration"
execute create_scalarm_yml

info "Overriding sample secrets configuration"
execute create_secrets_yml
