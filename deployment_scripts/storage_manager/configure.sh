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

info "Overriding sample secrets configuration"
execute create_secrets_yml