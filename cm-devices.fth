\ cm-devices.fs

\ [IFDEF] cm-devices
\    cm-devices
\ [ENDIF]

\ marker cm-devices





: device: (  compile: "name" , addr -- ; runtime: -- addr )
    create ,
  does> @
;



\ take value and position it in a bitfield at bitpos. Make sure the created
\ field does not take more than bitsize digits (cut it at the MSBs)

: make-bitfield ( bitpos bitsize value -- value' )
    over                         ( bitpos bitsize value bitsize -- )
    \ swap                         ( bitpos value bitsize  -- )
    $FFFFFFFF swap lshift invert \ create a mask of bitsize bits set
                                   ( bitpos bitsize value mask -- )
    and                          \ clear higher bits of value ( bitpos bitsize v' -- )
    rot rot                      ( v' bitpos bitsize )
    -                             
    lshift                  \ and shift it...
;


\ define a Device register.  baseaddr is the base addr of the cortex
\ device, offset is the offset of the register.

\ at compile time create a new word "name", at runtime place baseaddr+offset
\ onto the stack
: register: ( c: "name" baseaddr offset -- ; run: -- baseaddr+offset )
    create + ,
  does>
    @
;


\ define a named bitfield at device register found at baseaddr.
: register-bits: ( c: "name" baseaddr bitpos bitsize -- )
                ( r: -- baseaddr bitpos bitsize )
                  
    create , , ,
  does>
    dup @
    swap dup @
    swap @
;

