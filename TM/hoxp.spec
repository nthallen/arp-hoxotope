tmcbase = types.tmc hox.tmc hoxpcts.tmc idx.tmc hoxl.tmc
tmcbase = h2o.tmc h2ogrp.tmc

cmdbase = $(LIBSRC)/root.cmd hoxp.cmd
cmdbase = idx64.cmd idxdrv.cmd
cmdbase = hox.cmd hox.slp no.cmd
cmdbase = h2o.cmd

SCRIPT = Experiment.config interact runfile.1111 idx.idx64 hoxp.dccc
NONRCS = hox.cfg hox1.cfg
SRC = ohf.h CmdData.h

# These are new sources that may not have been used.
TOOL = hoxp.idx

# These are old sources which we haven't resolved yet:
SRC = hox2.fld hoxlcts.tmc hox.tma ohf.c
SRC = bellows.tmc
SRC = dither.tmc
SRC = fast.edf
SRC = fastext.tmc
SRC = getscan.tmc
SRC = peak.oui
SRC = peakalgo.c
SRC = peakext.c
SRC = scan.tmg
SRC = scan_ss.tmc

MNC = hoxp
DISTRIB = hox.cfg hox1.cfg h2o.cfg
TGTDIR = $(TGTNODE)/home/hoxp
OBJ = hox2.cfg

hoxpcol : hoxcol.tmc h2ocol.tmc nav.tmc navcol.tmc idxcol.tmc handler.c
hoxdisp : BGcts.tmc hox.cfg hox.fld hox1.fld
# hoxalgo : hox.tma
laser.sft : hox.slp laser.sol
hoxrtgext : rtgcorr.tmc hox.tmg
h2oext : h2o.edf
hox1ext : hox1.edf
hox2ext : hox2.edf
hox3ext : hox3.edf
hox4ext : hox4.edf
hox5ext : hox5.edf
hox6ext : hox6.edf
lwext : lw.edf
# fastext : fast.edf
scanext : idxflag.tmc scanning.tmc scanext.tmc
# peakalgo : ohf.c idxflag.tmc scanning.tmc getscan.tmc dither.tmc bellows.tmc peak.oui
# peakext : ohf.c idxflag.tmc scanning.tmc getscan.tmc scan_ss.tmc dither.tmc bellows.tmc peak.oui
# prtgext : ohf.c idxflag.tmc scanning.tmc getscan.tmc scan.tmg dither.tmc bellows.tmc peak.oui
pdoit : hox.doit
padoit : hoxa.doit
pwdoit : hoxw.doit
pwadoit : hoxwa.doit

h2odisp : h2octr.tmc h2o.fld h2o.cfg
h2o.sft : h2o.sol
h2odoit : h2o.doit

%%
TMCALGO=tmcalgoR1 -o $@
ohf.o : ohf.h
peakalgo.o : ohf.h /usr/local/include/idx64.h
peakext.o : ohf.h /usr/local/include/idx64.h
pdoit : hox.fld hox1.fld hox2.fld
padoit : hox.fld hox1.fld hox2.fld
pwdoit : hox.fld hox1.fld hox2.fld
pwadoit : hox.fld hox1.fld hox2.fld
h2odoit : h2o.fld
handler.o : handler.c
	$(COMPILE.c) -Wc,-s -zu handler.c
