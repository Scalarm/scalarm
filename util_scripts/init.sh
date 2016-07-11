# Start the Scalarm platform

# 1. stop iptables
/etc/init.d/iptables stop

# 2. add dev.scalarm.com to hostname
if [ `cat /etc/hosts | grep dev.scalarm.com | wc -l` == "0" ]; then
  echo "127.0.0.1  dev.scalarm.com" >> /etc/hosts
fi

# 3. start scalarm if available
SCALARM_DIR=/home/tutorial/.scalarm/scalarm-master
if [ -f $SCALARM_DIR/start.sh ]; then
  echo "Starting Scalarm..."
  PUBLIC_NGINX_ADDRESS=dev.scalarm.com
  HOME=/home/tutorial sh $SCALARM_DIR/deployment_scripts/nginx/start.sh
  su tutorial -l -c "sh $SCALARM_DIR/start.sh"
else
  echo "Scalarm not found"
fi
