tmcbase = types.tmc hox.tmc hoxpcts.tmc idx.tmc hoxl.tmc topaz.tmc
tmcbase = h2o.tmc h2ogrp.tmc

cmdbase = $(LIBSRC)/root.cmd hoxp.cmd
cmdbase = idx64.cmd idxdrv.cmd
cmdbase = hox.cmd hox.slp no.cmd
cmdbase = h2o.cmd topaz.cmd

SCRIPT = Experiment.config interact runfile.1111 idx.idx64 hoxp.dccc
SCRIPT = VERSION get_lifetimes
NONRCS = hox.cfg hox1.cfg h2o.cfg fields.cfg
SRC = ohf.h CmdData.h laserlab.sol

TOOL = hoxp.idx rcs2html.dat

MNC = hoxpcrnt
DISTRIB = hox.cfg hox1.cfg h2o.cfg
TGTDIR = $(TGTNODE)/home/hoxp
OBJ = hox2.cfg index.html

hoxpcol : hoxcol.tmc h2ocol.tmc nav.tmc navcol.tmc idxcol.tmc handler.c topaz.c topazcol.tmc
hoxdisp : BGcts.tmc hox.cfg idxflag.tmc hoxpbits.tmc PSD.tmc flttime.tmc hox.tbl hox1.tbl topaztxt.c hox2.tbl
hoxalgo : hoxpbits.tmc idxflag.tmc PSD.tmc hox.tma laser.tma
valvealgo : valve.tma
laser.sft : hox.slp laser.sol
hoxrtgext : rtgcorr.tmc PSD.tmc hox.tmg
h2oext : h2o.edf
hox1ext : hox1.edf
hox2ext : hox2.edf
hox3ext : hox3.edf
hox4ext : PSD.tmc hox4.edf
hox5ext : PSD.tmc hox5.edf
hox6ext : hox6.edf
nortext : PSD.tmc nort.edf
lifeext : time.tmc rtgcorr.tmc life.cyc lifeavg.tmc lifeext.tmc
# fastext : fast.edf
scanext : idxflag.tmc scanning.tma scanext.tmc
peakalgo : ohf.c idxflag.tmc chop.tmc PSD.tmc scanning.tma getscan.tmc dither.tmc bellows.tmc peak.oui grnpw.tma
peakext : ohf.c idxflag.tmc chop.tmc PSD.tmc scanning.tma getscan.tmc scan_ss.tmc dither.tmc bellows.tmc peak.oui grnpw.tma
prtgext : ohf.c idxflag.tmc scanning.tma getscan.tmc scan.tmg chop.tmc dither.tmc bellows.tmc peak.oui
pdoit : hox.doit
padoit : hoxa.doit
pbdoit : pb.doit
inetdoit : inet.doit
valvedoit : valve.doit

h2odisp : h2octr.tmc h2o.fld h2o.cfg h2o.tmg
h2o.sft : h2o.sol
h2odoit : h2o.doit
h2opbdoit : h2opb.doit

%%
MODEL=l
CFG=VERSION Experiment.config rcs2html.dat hoxp.spec
FRAME=hoxp.pcm $(TMCBASE)
CMD=hoxp.cmd idx64.cmd idxdrv.cmd hox.cmd hox.slp no.cmd
CMD+=h2o.cmd topaz.cmd
TMA=*.tma laser.sol h2o.sol laserlab.sol
TBL=*.tbl h2o.fld *.cfg
EDF=*.edf

CYCLE=cycle > $@
ohf.o : ohf.h
peakalgo.o : ohf.h /usr/local/include/idx64.h
peakext.o : ohf.h /usr/local/include/idx64.h
pdoit : hox.fld hox1.fld hox2.fld
padoit : hox.fld hox1.fld hox2.fld
pbdoit : hox.fld hox1.fld hox2.fld
h2odoit : h2o.fld
h2opbdoit : h2o.fld
handler.o : handler.c
	$(COMPILE.c) -Wc,-s -zu handler.c
hoxattr.tmc : hox.fld
h2oattr.tmc : h2o.fld
index.html : $(SOURCE)
	rcs2html "HOx v1.3"
	mv -f source.html index.html
