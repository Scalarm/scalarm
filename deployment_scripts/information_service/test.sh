#!/bin/bash

source `dirname $0`/../utils.sh

req "wrong" "false"


exit 0

create_secrets_yml() {
  cat >config/secrets.yml <<EOS
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
  service_login: <%= ENV["INFORMATION_SERVICE_LOGIN"] %>
  service_password: <%= ENV["INFORMATION_SERVICE_PASSWORD"] %>
  service_crt: ./config/server.crt
  service_key: ./config/server.key
EOS
}

create_thin_yml() {
  cat >config/thin.yml <<EOS
pid: tmp/pids/thin.pid
log: log/thin.log
port: 11300
tag: ScalarmInformationService
EOS
}

# constants
export REPO_BASE_URL='http://scalarm.com/repository/'
export RAILS_ENV=production

cd scalarm_information_service

create_secrets_yml
create_thin_yml

req "Creating SSL key" \
  "openssl genrsa -out config/server.key 2048"
req "Crearting SSL CSR" \
  "openssl req -new -key config/server.key -out config/server.csr -nodes -subj '/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com'"
req "Creating SSL certificate" \
  "openssl x509 -req -days 365 -in config/server.csr -signkey config/server.key -out config/server.crt"

req "Migrating database" \
  "rake db:migrate"
