#!/bin/bash
source `dirname $0`/../utils.sh

create_secrets_yml() {
  cat >config/secrets.yml <<EOS
production:
  service_crt: ./config/server.crt
  service_key: ./config/server.key
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
  information_service_url: "<%= ENV["INFORMATION_SERVICE_URL"] %>"
  information_service_user: "<%= ENV["INFORMATION_SERVICE_LOGIN"] %>"
  information_service_pass: "<%= ENV["INFORMATION_SERVICE_PASSWORD"] %>"
  database:
    db_name: 'scalarm_db'
    db_secret_key: "<%= ENV["DB_SECRET_KEY"] %>"
EOS
}

create_thin_yml() {
  cat >config/thin.yml <<EOS
pid: tmp/pids/thin.pid
log: log/thin.log
port: 20000
EOS
}

# constants
export RAILS_ENV=production

info "Entering scalarm_storage_manager dir"
execute cd $SCALARM_ROOT/scalarm_storage_manager

info "Creating SSL key"
execute openssl genrsa -out config/server.key 2048

info "Crearting SSL CSR"
execute openssl req -new -key config/server.key -out config/server.csr -nodes -subj '/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com'

info "Creating SSL certificate"
execute openssl x509 -req -days 365 -in config/server.csr -signkey config/server.key -out config/server.crt

info "Copying sample configuration files"
execute rake service:ensure_config

info "Overriding sample Thin configuration"
execute create_thin_yml

info "Overriding sample secrets configuration"
execute create_secrets_yml