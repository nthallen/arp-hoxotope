Procedure for configuring a new flight flash card

The following is a somewhat sketchy outline of what it takes to
configure a flash disk for use in a flight computer running QNX4.
There are all sorts of unstated assumptions about the knowledge of the
sys admin performing this task.

If the stars are aligned correctly, you should be able to configure a
new flash disk on a GSE computer. This requires that the GSE computer
be running the appropriate PCMCIA driver (see pcmciatrap) and that
pcmcia.cards and pcmcia.cfg are properly configured in /etc/config. If
the card's manufacturer is new to the group, you will probably need to
add information to pcmcia.cards. 'pin config' should produce
appropriately formatted text, but in some cases, you may actually have
to edit this a bit. You may also need to edit pcin and pcout to
recognize the new card. pcmcia.cfg depends on details of the GSE's
architecture, so it cannot necessarily be copied between computers
without care.

Assuming your PCMCIA configuration is working, running pcin on a new
flash card should start the driver and mount any existing partitions
(usually a DOS FAT partition). You should:

  umount /dev/pc0

to unmount any partitions, then run

  fdisk /dev/pc0

to create one type 77 partition for the entire disk. Save and quit.
Then:

  mount -p /dev/pc0
  dinit -hq /dev/pc0t77
  mount /dev/pc0t77 /pc
  chmod g-w /pc
  dcheck -m /pc
  # Node 35 is a system with a fairly complete QNX 4.25 installation,
  # and has been used as the source for 4.25 installations. Node 1
  # remains the reference node for all in-house software.
  osupdate -I //$NODE/pc -f OSU.425 35 $tgtnode
  osupdate -I //$NODE/pc 1 $tgtnode
  license /etc/licenses /pc/etc/licenses
  
  # Copy in sysinit.$tgtnode (or create one)
  # Check to make sure any drivers referenced have been copied
  # on the flash disk. Net.etherXXXX, for example.
    
  cp hard.$tgtnode /pc/boot/build # or make on
  cd /pc/boot
  make b=hard.$tgtnode
  cp images/hard.$tgtnode /pc/.boot

  cp /usr/local/bin/idler /pc/usr/local/bin # and any other
  # app-specific files such as qclid or qclisd

  cd /pc/home
  mkdir flight $Exp
  chown flight:flight flight $Exp
  chmod g+w flight $Exp
  
  fdisk /dev/pc0 loader
  fdisk /dev/pc0 boot QNX

Now cd to the GSE's source directory and:

  make distribution TGTDIR=/pc/home/$Exp
  cd /pc/home
  cp $Exp/Experiment.config flight/

And finally:

  cd /
  pcout

And the card should be ready to go. You may need to change BIOS
settings on the flight computer to reflect the H/S/C configuration
that the QNX driver used.
