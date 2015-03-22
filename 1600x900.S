/*
   1600x900.S: EDID data set for standard 1600x900 60 Hz monitor

   Copied from 1600x1200.S in the Linux kernel source originally:
   Copyright (C) 2013 Carsten Emde <C.Emde@osadl.org>

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2
   of the License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
*/

/* EDID */
#define VERSION 1
#define REVISION 3

/* Display */
#define CLOCK 118250 /* kHz */
#define XPIX 1600
#define YPIX 900
#define XY_RATIO XY_RATIO_16_9
#define XBLANK 512
#define YBLANK 34
#define XOFFSET 96
#define XPULSE 160
#define YOFFSET (63+3)
#define YPULSE (63+5)
#define DPI 72
#define VFREQ 60 /* Hz */
#define TIMING_NAME "Linux 16x9"
#define ESTABLISHED_TIMINGS_BITS 0x00 /* none */
#define HSYNC_POL 0
#define VSYNC_POL 1
#define CRC 0x5d

#include "edid.S"
