tmcbase = types.tmc hox.tmc HOX_1M.tmc hoxpcts.tmc idx.tmc hoxl.tmc topaz.tmc

cmdbase = $(LIBSRC)/root.cmd hoxp.cmd
cmdbase = idx64.cmd idxdrv.cmd
cmdbase = hox.cmd
cmdbase = topaz.cmd

SCRIPT = Experiment.config interact runfile.1111 idx.idx64 hoxp.dccc
SCRIPT = VERSION get_lifetimes
NONRCS = hox.cfg hox1.cfg fields.cfg
SRC = ohf.h CmdData.h laserlab.sol

TOOL = hoxp.idx rcs2html.dat

CLEANDIST
MNC = hoxpcrnt
DISTRIB = hox.cfg hox1.cfg
TGTDIR = $(TGTNODE)/home/hoxp
OBJ = hox2.cfg index.html

hoxpcol : hoxcol.tmc nav.tmc navcol.tmc idxcol.tmc topaz.c topazcol.tmc
hoxdisp : BGcts.tmc hox.cfg idxflag.tmc hoxpbits.tmc PSD.tmc flttime.tmc hox.tbl hox1.tbl topaztxt.c hox2.tbl
hoxalgo : hoxpbits.tmc idxflag.tmc PSD.tmc hox.tma laser.tma valve.tma
valvealgo : idxflag.tmc valve_only.tma valve.tma
# laser.sft : hox.slp laser.sol
hoxrtgext : rtgcorr.tmc PSD.tmc hox.tmg
hox1ext : hox1.edf
hox2ext : hox2.edf
hox3ext : hox3.edf
hox4ext : PSD.tmc hox4.edf
hox5ext : PSD.tmc hox5.edf
hox6ext : idxflag.tmc hox6.edf
hxengext : idxflag.tmc PSD.tmc hxeng.edf
nortext : idxflag.tmc nort.edf
lifeext : time.tmc rtgcorr.tmc life.cyc lifeavg.tmc lifeext.tmc
# fastext : fast.edf
scanext : ohf.c idxflag.tmc scanning2.tma scanext.tmc
peakalgo : ohf.c idxflag.tmc chop.tmc PSD.tmc scanning.tma getscan.tmc dither.tmc bellows.tmc peak.oui grnpw.tma
peak2algo : ohf.c idxflag.tmc PSD.tmc scanning2.tma bellows.tmc peak.oui grnpw.tma
peakext : ohf.c idxflag.tmc chop.tmc PSD.tmc scanning.tma getscan.tmc scan_ss.tmc dither.tmc bellows.tmc peak.oui grnpw.tma
prtgext : ohf.c idxflag.tmc scanning.tma getscan.tmc scan.tmg chop.tmc dither.tmc bellows.tmc peak.oui
p2rtgext : ohf.c idxflag.tmc scanning2.tma scan2.tmg peak.oui
pdoit : hox.doit
padoit : hoxa.doit
pbdoit : pb.doit
inetdoit : inet.doit
valvedoit : valve.doit

%%
MODEL=l
CFG=VERSION Experiment.config rcs2html.dat hoxp.spec
FRAME=hoxp.pcm $(TMCBASE)
CMD=hoxp.cmd idx64.cmd idxdrv.cmd hox.cmd hox.slp no.cmd
CMD+=topaz.cmd
TMA=*.tma laser.sol laserlab.sol
TBL=*.tbl *.cfg
EDF=*.edf

CYCLE=cycle > $@
ohf.o : ohf.h
peakalgo.o : ohf.h /usr/local/include/idx64.h
peakext.o : ohf.h /usr/local/include/idx64.h
pdoit : hox.fld hox1.fld hox2.fld
padoit : hox.fld hox1.fld hox2.fld
pbdoit : hox.fld hox1.fld hox2.fld
hoxattr.tmc : hox.fld
index.html : $(SOURCE)
	rcs2html "HOxotope v2.0"
	mv -f source.html index.html
