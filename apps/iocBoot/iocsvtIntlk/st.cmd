#!../../bin/linux-x86_64/svtIntlk

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/svtIntlk.dbd"
svtIntlk_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/iocAdminSoft.db","IOC=${IOC}")
dbLoadRecords("db/save_restoreStatus.db", "P=${IOC}:")

# Simple record for HPS's halo-counter FSD (via mbbi->bi):
dbLoadRecords("db/hpsFsd.db")

## SVT Chiller, FE Chiller, Detector Vacuum
dbLoadTemplate("db/svtIntlk.substitutions")

cd ${TOP}/iocBoot/${IOC}

## autosave setup
< save_restore.cmd

iocInit

## autosave startup
create_monitor_set("svtIntlk_settings.req", 30)

# Handle autosave 'commands' contained in loaded databases.
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "P=${IOC}:")
create_monitor_set("info_settings.req", 30, "P=${IOC}:")
