export PUBLIC_NGINX_ADDRESS=`bash -c "ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"`
export GIT_BRANCH=development

# fake Paasage

export PUBLIC_IP=$PUBLIC_NGINX_ADDRESS
export CLOUD_HOST=$PUBLIC_IP
