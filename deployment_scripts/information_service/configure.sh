#!/bin/bash
source `dirname $0`/../utils.sh

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

info "Go to Information Service dir: $SCALARM_ROOT/scalarm_information_service"
execute cd $SCALARM_ROOT/scalarm_information_service

create_secrets_yml
create_thin_yml

info "Generating self-signed SSL certificate"
execute $SCRIPT_PATH/../generate_ssl_certificate.sh config/

info "Migrating database"
execute rake db:migrate
