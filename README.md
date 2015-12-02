# Scalarm
Read wiki at: https://github.com/Scalarm/scalarm/wiki

# Quick installation

*Warning:* this will need sudo permissions (preferably password-less sudo) and will install new system packages

Localhost-only installation on Ubuntu 14.04+ in HOME dir:
```
\curl -sSL https://raw.githubusercontent.com/Scalarm/scalarm/master/quick_install/local_nginx_paths.sh | bash
```

If you want to use the Scalarm outside localhost, set a ``PUBLIC_NGINX_ADDRESS`` env before installation:

```
export PUBLIC_NGINX_ADDRESS=public_hostname
```

If you want to use Scalarm git branch other than default ``master``, set a ``GIT_BRANCH`` env before installation:

```
export GIT_BRANCH=development
```

Handy oneliner to install development version of Scalarm for use in local network:

```
PUBLIC_NGINX_ADDRESS=192.168.0.1 GIT_BRANCH=development bash -c '\curl -sSL https://raw.githubusercontent.com/Scalarm/scalarm/master/quick_install/local_nginx_paths.sh | bash'
```
