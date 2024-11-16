SECTIONS
{
    /* Place .text at the requested address */
    .text 0x400b0 : {
        KEEP(*(.text))  /* Keep the .text section */
    }

    /* Discard unwanted sections */
    /DISCARD/ : {
        *(.data)        /* Discard .data */
        *(.bss)         /* Discard .bss */
        *(.rodata*)     /* Discard any read-only data */
        *(.note.gnu.property)     /* Discard */
        *(.note.gnu.build-id)     /* Discard */
    }
}
