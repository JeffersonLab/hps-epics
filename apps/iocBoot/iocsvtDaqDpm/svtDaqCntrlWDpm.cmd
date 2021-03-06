#!../../bin/linux-x86_64/svtDaqDpm

#< envPaths
< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/svtDaqDpm.dbd"
svtDaqDpm_registerRecordDeviceDriver pdbbase



## Load record instances
dbLoadRecords("db/iocAdminSoft.db", "IOC=iocsvtDaqCntrlWDpm")

## Load record instances
dbLoadRecords "db/dbHybridSwitch.db"

var mySubDebug 0
##traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=trackerHost"
