#!../../bin/linux-x86_64/svtDaqDpm

## You may have to change svtDaqDpm to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/svtDaqDpm.dbd"
svtDaqDpm_registerRecordDeviceDriver pdbbase



## Load record instances
dbLoadRecords("db/iocAdminSoft.db", "IOC=iocsvtDaqDpm10")

## Load record instances
#dbLoadRecords("db/xxx.db","user=trackerHost")
dbLoadRecords("db/dbDataDpmStatus.db","DPM=10")
dbLoadRecords("db/dbDataDpmEventState.db","DPM=10")
dbLoadRecords("db/dbDataDpmBlockCount.db","DPM=10")
dbLoadRecords("db/dbDataDpmSystemState.db","DPM=10")
dbLoadRecords("db/dbDataDpmBurnCount.db","DPM=10")
dbLoadRecords("db/dbDataDpmInsertedFrames.db","DPM=10")
dbLoadRecords("db/dbDataDpmEBEventErrorCount.db","DPM=10")
dbLoadRecords("db/dbDataDpmEventCount.db","DPM=10")
dbLoadRecords("db/dbDataDpmTrigCount.db","DPM=10")
dbLoadRecords("db/dbDataDpm.db","DPM=10")
dbLoadRecords("db/dbHybSyncDataDpmAll.db","DPM=10,HYB=0")
dbLoadRecords("db/dbHybSyncDataDpmAll.db","DPM=10,HYB=1")
dbLoadRecords("db/dbHybSyncDataDpmAll.db","DPM=10,HYB=2")
dbLoadRecords("db/dbHybSyncDataDpmAll.db","DPM=10,HYB=3")
dbLoadRecords("db/dbHybSyncDataDpm.db","DPM=10,HYB=0")
dbLoadRecords("db/dbHybSyncDataDpm.db","DPM=10,HYB=1")
dbLoadRecords("db/dbHybSyncDataDpm.db","DPM=10,HYB=2")
dbLoadRecords("db/dbHybSyncDataDpm.db","DPM=10,HYB=3")
dbLoadRecords("db/dbDataDpmLink.db","DPM=10,DP=0")
dbLoadRecords("db/dbDataDpmLink.db","DPM=10,DP=1")
dbLoadRecords("db/dbDataDpmLink.db","DPM=10,DP=2")
dbLoadRecords("db/dbDataDpmLink.db","DPM=10,DP=3")
dbLoadRecords("db/dbDataDpmHybNum.db","DPM=10,DP=0")
dbLoadRecords("db/dbDataDpmHybNum.db","DPM=10,DP=1")
dbLoadRecords("db/dbDataDpmHybNum.db","DPM=10,DP=2")
dbLoadRecords("db/dbDataDpmHybNum.db","DPM=10,DP=3")
dbLoadRecords("db/dbDataDpmFebNum.db","DPM=10,DP=0")
dbLoadRecords("db/dbDataDpmFebNum.db","DPM=10,DP=1")
dbLoadRecords("db/dbDataDpmFebNum.db","DPM=10,DP=2")
dbLoadRecords("db/dbDataDpmFebNum.db","DPM=10,DP=3")

var mySubDebug 0
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=trackerHost"
