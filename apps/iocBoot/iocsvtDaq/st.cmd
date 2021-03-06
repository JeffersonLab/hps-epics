#!../../bin/linux-x86_64/svtDaq

#< envPaths_x86
< envPaths

cd ${TOP}


## Register all support components
dbLoadDatabase "dbd/svtDaq.dbd"
svtDaq_registerRecordDeviceDriver(pdbbase)

## Load record instances
dbLoadRecords("db/iocAdminSoft.db", "IOC=${IOC}")


## Set this to see messages from mySub
var mySubDebug 0

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=rootHost"
#seq sncExample, "user=trackerHost"



