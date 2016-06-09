![Scalarm Logo](http://scalarm.com/images/scalarmNiebieskiemale.png)

Scalarm is a platform supporting scientific experiments which follow parameter studies and data farming methodologies - meaning they are based on execution of the same application multiple times with different input parameters to explore how it behaves in different conditions.

The following steps of such experiments are supported:
  - input parameter space specification with design of experiment methods,
  - application/simulation model execution on different computing resources like clouds, grids, computer clusters and remotely accessible servers,
  - data collection and analysis.

# Quick start
Tested on Ubuntu 14.04 and Ubuntu 16.04

**Notice:** sudo permissions are required, since some system packages will be installed and port 443 is used.

If you prefer a video tutorial it is available at - https://youtu.be/g84QlUK_Z0s

Handy oneliner to install Scalarm with graphical user interface (GUI) exposed on 192.168.0.1 :

```
PUBLIC_NGINX_ADDRESS=192.168.0.1 bash -c '\curl -sSL https://raw.githubusercontent.com/Scalarm/scalarm/master/quick_install/local_nginx_paths.sh | bash'
```

If you want to use Scalarm git branch other than default ``master``, set a ``GIT_BRANCH`` env before installation:

```
export GIT_BRANCH=development
```

# Data farming process
The data farming methodology focuses on data generation and analysis with computer simulation and high performance computing (HPC) systems. The whole process is as follows:

![Data farming](http://scalarm.com/images/data-farming-experiment-diagram-vertical.png)

# Architecture
The Scalarm platform consits of several loosely coupled services. It's architecture follows the master-worker design pattern, where the master part is responsible for experiment coordination, while the worker part handles actual computations. In addition, Scalarm services can be run on different infrastructures, hence its actual runtime deployment can be divided vertically and horizontally as depicted below, where the amount of resources for each part can be dynamically adjusted to the actual load.

![Scalarm architecture](http://scalarm.com/images/scalarm-architecture.png)

# More information
Scalarm is a fully open source platform developed at AGH University of Science and Technology, Krakow, Poland by people from Department of Computer Science and Academic Computer Center Cyfronet. 

More information about the platform can be found on:
  - [GitHub repository collection about Scalarm](https://github.com/Scalarm)
  - [Scalarm website](http://www.scalarm.com)
  - [Scalarm GitHub wiki](https://github.com/Scalarm/scalarm/wiki)
  - [Experiment manager GitHub repository](https://github.com/Scalarm/scalarm_experiment_manager)
  - [Storage manager GitHub repository](https://github.com/Scalarm/scalarm_storage_manager)
  - [Information service GitHub repository](https://github.com/Scalarm/scalarm_information_service)
  - [Simulation manager GitHub repository](https://github.com/Scalarm/scalarm_simulation_manager_go)
  - [Data explorer GitHub repository](https://github.com/Scalarm/scalarm_data_explorer)
  - [Pathfinder GitHub repository](https://github.com/Scalarm/scalarm_experiment_supervisor)

We are always looking for collaborators and users :)
  
# License
MIT
