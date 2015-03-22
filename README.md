Lenovo Yoga 2 Pro
=================

These are notes for getting Linux Mint running well on a Lenovo Yoga 2 Pro.

Wireless
--------

The `ideapad_laptop` kernel module blocks the Intel 7260 wireless card. I know the Fedora folks fixed this with a patch,
but that's not made it into the kernel Linux Mint is using. So, in the meantime, you can blacklist that module by adding
the following line to `/etc/modprobe.d/blacklist.conf`:

```
blacklist ideapad_laptop
```

Display
-------

The Lenovo Yoga 2 Pro has a display with a ridiculous resolution of 3200x1800. It looks great on Linux with applications
that support it well, but many applications just aren't ready for HighDPI displays yet (Chromium, Dropbox, Virtualbox).
The internal display doesn't make a 1600x900 mode available via its EDID, so you can't easily choose a lower DPI
resolution to use. Kernel Mode Setting (KMS) (which Linux Mint uses) makes this even harder.

So, what I've got here are an EDID binary file and instructions on how to run a Yoga 2 Pro (or, possibly, similar
display) at 1600x900.

### Display Setup

These instructions work on Linux Mint. Your distribution may vary.

1. Create the `/lib/firmware/edid` directory if it doesn't already exist. It didn't on my Linux Mint installation.
2. Copy the `1600x900.bin` file into that directory.
3. You'll need to get these two lines into your kernel options. On Linux Mint, you can edit `/etc/default/grub` and make
   sure you have updated `GRUB_CMDLINE_LINUX` to look like this:

```
GRUB_CMDLINE_LINUX="drm_kms_helper.edid_firmware=edid/1600x900.bin video=eDP-1:1600x900-24@60"
```

### Recompiling the EDID File

If you feel the need to change the `1600x900.S` file, you can do that by placing it into the `Documentation/EDID`
directory of your Linux kernel source and running `make`.

Powertop
--------

Install the `powertop` package and add `powertop --auto-tune` to `/etc/rc.local`. I find `powertop` to do a nice job
of enabling a lot of power saving features.
