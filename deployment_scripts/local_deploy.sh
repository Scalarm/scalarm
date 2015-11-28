#!/bin/bash
source `dirname $0`/utils.sh

cd `dirname $0`

execute information_service/install.sh
execute storage_manager/install.sh
execute experiment_manager/install.sh

execute information_service/configure.sh
execute storage_manager/configure.sh
execute experiment_manager/configure.sh

execute information_service/start.sh
execute storage_manager/start.sh
execute experiment_manager/start.sh
