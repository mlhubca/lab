_plan_=s
_home_=/gpfs/fs01/user/sa7b-75f82ff136775c-a0d2bab01af5


SPARK_HOME=${SPARK_HOME:-/usr/local/src/spark20master/spark}
SPARK_EGO_STAGING_DIR=${SPARK_EGO_STAGING_DIR:-/tmp/spark-20-ego-master/staging}
SPARK_EGO_NATIVE_LIBRARY=$SPARK_HOME/ego/libSparkVEMApi.so
SPARK_EGO_DRIVER_CONSUMER=${SPARK_EGO_DRIVER_CONSUMER:-/SparkDrivers}
SPARK_EGO_EXECUTOR_CONSUMER=${SPARK_EGO_EXECUTOR_CONSUMER:-/SparkOnBluemix/Spark20MasterLow/*}
SPARK_EGO_DRIVER_PLAN=${SPARK_EGO_DRIVER_PLAN:-ComputeHosts}
SPARK_EGO_EXECUTOR_PLAN=${SPARK_EGO_EXECUTOR_PLAN:-ComputeHosts}
SPARK_LOCAL_DIRS=${SPARK_WORKER_DIR:-/tmp/spark-20-ego-master/work}
SPARK_WORK_DIR=${SPARK_WORKER_DIR:-/tmp/spark-20-ego-master/work}
SPARK_EGO_APP_SCHEDULE_POLICY=hierarchy
SPARK_DEPLOY_RESOURCE_SCHEDULER=ego
SPARK_MASTER_IP=$HOSTNAME
SPARK_MASTER_PORT=${SPARK_MASTER_PORT:-7085}
SPARK_MASTER_WEBUI_PORT=${SPARK_WEBUI_PORT:-12026}
SPARK_EXECUTOR_OPTS="-Dspark.shuffle.service.port=7341"
SPARK_EXECUTOR_MEMORY=6G
SPARK_EGO_EXECUTOR_SLOTS_MAX=3
SPARK_EGO_EXECUTOR_IDLE_TIMEOUT=300
SPARK_EGO_CACHED_EXECUTOR_IDLE_TIMEOUT=1200
SPARK_DRIVER_MEMORY=1512M

case ${_plan_,,} in
    ( l | x )
    SPARK_DRIVER_MEMORY=16384M
    ;;

    (*)
    ;;
esac


export SPARK_EGO_IMPERSONATION=true
export SPARK_EGO_AUTHORIZATION_ENABLED=true
export SPARK_EGO_RUN_AS_SERVICE=true
export SPARK_EGO_CLIENT_TIMEOUT=1200
export SPARK_EGO_IPYTHON=true

export JAVA_HOME=/usr/local/src/spark20master/ibm-java-x86_64-80

_ext_OC_=/usr/local/src/dataconnector-stocator/spark-2.0.0
_ext_CL_=/usr/local/src/dataconnector-cloudant-2.0/spark-2.0.0
_ext_AL_=/usr/local/src/analytic-libs-2.0/spark-2.0.0
_ext_DW_=/usr/local/src/dataconnector-dw-2.0/spark-2.0.0
_ext_S3_=/usr/local/src/dataconnector-s3-2.0/spark-2.0.0
_ext_ES_=/usr/local/src/event-stream-2.0/spark-2.0.0

export  PATH=$JAVA_HOME/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/lib:${_ext_DW_}/Server/connectivity/lib:${_ext_DW_}/Server/connectivity/lib/daapi-sca:${_ext_DW_}/Server/connectivity/lib/C/icc/icclib:${_ext_DW_}/Server/connectivity/lib/C/icc/osslib:${_ext_DW_}/Server/connectivity/lib/N/icc/icclib:${_ext_DW_}/Server/connectivity/lib/N/icc/osslib:${_ext_DW_}/Server/connectivity/lib/daapi-xml:${JAVA_HOME}/jre/lib/amd64/compressedrefs:$LD_LIBRARY_PATH


export SPARK_SUBMIT_CLASSPATH=${_ext_DW_}/Server/connectivity/thirdparty/avro-1.8.0.jar:$SPARK_SUBMIT_CLASSPATH
export SPARK_DIST_CLASSPATH=${_home_}/data/libs:${_home_}/data/libs/*:${_ext_OC_}/libs/*:${_ext_S3_}/libs/*:${_ext_CL_}/libs/*:$HOME/data/analytic-libs-2.0/spark-2.0.0/*:${_ext_DW_}/Server/connectivity/jars/*:${_ext_DW_}/Server/connectivity/jdbc/lib/*:${_ext_DW_}/Server/connectivity/thirdparty/*:${_ext_DW_}/libs/*:${_ext_DW_}/Server/connectivity/thirdparty/aws/*:${_ext_DW_}/Server/connectivity/config:${_ext_DW_}/Server/connectivity/FaspStreamSDK/lib/*:${_ext_DW_}/Server/connectivity/jars/JISPlugins/*:${_ext_DW_}/Server/connectivity/branded_jdbc/lib/*:${_ext_DW_}/ASBServer/apps/lib/iis/*/*:${_ext_DW_}/Server/connectivity/connectors/*/*:${_ext_ES_}/libs/*:/usr/local/src/dataconnector-db2/*

export SPARK_EGO_CLASSPATH=$SPARK_SUBMIT_CLASSPATH
export SPARK_EGO_JARS=$SPARK_HOME/ego/spark-launcher_2.11-2.0.2.jar:$SPARK_HOME/ego/spark-network-shuffle_2.11-2.0.2.jar:$SPARK_HOME/ego/gson-2.2.4.jar:$SPARK_HOME/ego/guava-14.0.1.jar:$SPARK_HOME/ego/Java-WebSocket-1.3.0.jar:$SPARK_HOME/ego/spark-ego_2.11-2.0.2.jar


export SPARK_EGO_HIERARCHY_CONF_FILE=$SPARK_HOME/profile/notebook/tag.json

SPARK_HISTORY_LOG=${SPARK_EVENTS_DIR:-/gpfs/fs01/spark-ego-master}
export SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS -Dspark.eventLog.enabled=true -Dspark.eventLog.dir=$SPARK_HISTORY_LOG -Dspark.history.fs.logDirectory=$SPARK_HISTORY_LOG"

export DW_CONN_HOME=${_ext_DW_}/Server

export CC_DISABLE_BIG_BUFFER_API=true

export NGWB_TAM_FILE_LOCATION=${_ext_AL_}/tam
export SPARK_SUBMIT_LIBRARY_PATH=$LD_LIBRARY_PATH

export LANG=en_US.UTF-8


# Redirect spark executor logs to tenant home directory in GPFS
SPARK_EGO_LOG_DIR=~/logs/spark/executor

export NOTEBOOK_HOME=/usr/local/src/bluemix_jupyter_bundle.v37/notebook
export PYSPARK_PYTHON=$NOTEBOOK_HOME/bin/python

_old_options=${-}
set -a
# source package profiles
. $NOTEBOOK_HOME/notebook-env.sh

if [[ $_old_options != *a* ]]; then
  set +a
fi
unset _old_options

export DEPLOY_HOME=/usr/local/src/bluemix_jupyter_bundle.v37
export R_LIBS_USER=~/R/libs
export R_HOME_PREFIX=/usr/local/src/bluemix_jupyter_bundle.v37



_py_version_=2.7
_py_dir_=/usr/local/src/analytic-libs/python
_py_spark_dir_=/usr/local/src/analytic-libs/spark-2.0/python
_py_cads_dir=/usr/local/src/cognitive-assistant/cads_packages
PYTHONPATH="$PYTHONPATH:$_py_dir_-$_py_version_:$_py_dir_:$_py_cads_dir"
if [ -n "/usr/local/src/analytic-libs/spark-2.0/python" ]; then
  PYTHONPATH="$PYTHONPATH:$_py_spark_dir_-$_py_version_:$_py_spark_dir_"
fi


export SPARK_SCALA_VERSION=2.11
export SPARK_DIST_CLASSPATH=${_home_}/data/libs/scala-2.11/*:$SPARK_DIST_CLASSPATH

export SCALA_HOME=/usr/local/src/scala/2.11
export PATH=$SCALA_HOME/bin:$PATH
