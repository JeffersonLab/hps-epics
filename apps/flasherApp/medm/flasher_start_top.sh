#!/bin/sh


caput B_HPS_ECAL_FLASHER_TOP:GET_LEDS.SCAN ".5 second"
caput B_HPS_ECAL_FLASHER_TOP:GET_SEQUENCE.SCAN "1 second"
caput B_HPS_ECAL_FLASHER_TOP:SEQ_START START

exit
