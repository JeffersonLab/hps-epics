#!../../bin/linux-x86/tempSens

## You may have to change tempSens to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

epicsEnvSet("STREAM_PROTOCOL_PATH", "${TOP}/proto")

## Register all support components
dbLoadDatabase("dbd/tempSens.dbd")
tempSens_registerRecordDeviceDriver(pdbbase)

## Setup port
drvAsynIPPortConfigure("SER1", "hallb-moxa1:4001")

## Debugging
#asynSetTraceMask("SER1",-1,0x09)
#asynSetTraceIOMask("SER1",-1,0x2)

## Load record instances
dbLoadTemplate("db/iocAdminSoft.db", "IOC=${IOC}")
dbLoadRecords("db/save_restoreStatus.db", "P=${IOC}:")
dbLoadTemplate("db/tempSens.substitutions")

cd ${TOP}/iocBoot/${IOC}

< save_restore.cmd

dbl > tempSens_pv.list
iocInit

## Autosave startup
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "P=${IOC}:")
create_monitor_set("info_settings.req", 30, "P=${IOC}:")
create_monitor_set("tempSens_settings", 30)
