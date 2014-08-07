cmsis-svd-fth
=============

Create FORTH code for register definitions of ARM Cortex-M devices based on its CMSIS SVD XML description.

Every ARM Cortex-M Device has plenty of integrated devices like Timers, CRC Units, GPIO portzs and so on. These devices are configured through up to hundred or more registers, each possible split up into a set og bitfields. Even worse, names and meaning differ from one vendor through the other. Even if we have a datasheet, bit-mangling code is not really readable if we don't have the names of the registers as defined by the vendor.

One may define them by hand as needed, but there is a better way: CMSIS SVD.

The "Cortex® Microcontroller Software Interface Standard - System View Description" is a XML specification for Cortex-M devices and their register layout. 

This repo provides a XSL stylesheet to translate a SVD file into some FORTH code to acces the registers by name.

A later addition will even provide ways to access the various bitfields inside the registers by name in FORTH code.

ATTENTION: the code here is bleeding edge - it has worked exactly once for exactly one SVD file.
