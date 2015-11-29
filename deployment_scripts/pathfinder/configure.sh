#!/bin/bash
source `dirname $0`/../utils.sh

create_secrets_yml() {
  cat >config/secrets.yml <<EOS
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
  information_service_url: "<%= ENV["INFORMATION_SERVICE_URL"] %>"
  information_service_user: "<%= ENV["INFORMATION_SERVICE_LOGIN"] %>"
  information_service_pass: "<%= ENV["INFORMATION_SERVICE_PASSWORD"] %>"
  
  base_url: 'https://$PUBLIC_PATHFINDER_ADDRESS'
  
  cors:
    allow_all_origins: false
    allowed_origins:
      - 'https://$PUBLIC_PATHFINDER_ADDRESS'
      - 'https://$PUBLIC_EXPERIMENT_MANAGER_ADDRESS'
      
  supervisor_script_watcher:
    sleep_duration_in_seconds: 20
EOS
}

create_puma_rb() {
  cat >config/puma.rb <<EOS
environment 'production'
daemonize
bind 'ssl://0.0.0.0:21000?key=./config/server.key&cert=./config/server.crt'
stdout_redirect 'log/puma.log', 'log/puma.log.err', true
pidfile 'puma.pid'
threads 1,5
workers 1
EOS
}

# constants
export RAILS_ENV=production

info "Entering scalarm_experiment_supervisor dir"
execute cd $SCALARM_ROOT/scalarm_experiment_supervisor

info "Generating self-signed SSL certificate"
execute $SCRIPT_PATH/../generate_ssl_certificate.sh config/

info "Copying sample configuration files"
execute rake service:ensure_config

info "Overriding sample Puma configuration"
execute create_puma_rb

info "Overriding sample secrets configuration"
execute create_secrets_yml
