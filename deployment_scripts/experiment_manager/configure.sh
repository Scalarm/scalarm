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

create_puma_rb() {
  cat >config/puma.rb <<EOS
environment 'production'
daemonize
bind 'ssl://0.0.0.0:3001?key=./config/server.key&cert=./config/server.crt'
stdout_redirect 'log/puma.log', 'log/puma.log.err', true
pidfile 'puma.pid'
threads 1,5
workers 2
EOS
}

# constants
export RAILS_ENV=production

info "Entering scalarm_experiment_manager dir"
execute cd $SCALARM_ROOT/scalarm_experiment_manager

# TODO: key generation in separate .sh script

info "Creating SSL key"
execute openssl genrsa -out config/server.key 2048

info "Crearting SSL CSR"
execute openssl req -new -key config/server.key -out config/server.csr -nodes -subj '/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com'

info "Creating SSL certificate"
execute openssl x509 -req -days 365 -in config/server.csr -signkey config/server.key -out config/server.crt

info "Copying sample configuration files"
execute rake service:ensure_config

info "Overriding sample Puma configuration"
execute create_puma_rb

info "Overriding sample secrets configuration"
execute create_secrets_yml
