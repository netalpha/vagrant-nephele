#!/usr/bin/env bash

SEEP_EXAMPLES_HOME=$HOME/Research/seep-examples
NETALPHA_SEEP_HOME=$HOME/Research/seep-netalpha
VAGRANT_SEEP_HOME=$HOME/Research/seep-vagrant


echo "-----------clear the workspace.-------------"
yes | rm -rf ./masterdata
yes | rm -rf ./slavedata
mkdir masterdata
mkdir slavedata

echo "-----------compile the seep-------------"
cd $NETALPHA_SEEP_HOME
mvn clean package -DskipTests
cp seep-system/target/seep-system-0.0.1-SNAPSHOT.jar $VAGRANT_SEEP_HOME/masterdata/
cp seep-system/target/seep-system-0.0.1-SNAPSHOT.jar $VAGRANT_SEEP_HOME/slavedata/

echo "-----------compile the seep examples-------------"
cd $SEEP_EXAMPLES_HOME
mvn clean package
cp target/seep-examples-0.0.1-SNAPSHOT.jar $VAGRANT_SEEP_HOME/masterdata

echo "-----------upload to servers---------------"
cd $VAGRANT_SEEP_HOME
scp masterdata/* sg474@129.12.5.40:~/netalpha-seep/masterdata

if [ "$1" = "data" ] 
then
  echo "upload the data first!"
  scp $SEEP_EXAMPLES_HOME/cardatapoints.txt sg474@129.12.5.40:~/netalpha-seep/
  scp config.properties sg474@129.12.5.40:~/netalpha-seep
fi

if [ "$1" = "multi" ]
then 
  ssh sg474@129.12.5.40 'bash -s' < multiOp.sh
fi

exit
echo "DONE!"




