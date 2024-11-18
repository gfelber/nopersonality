SECTIONS
{
    /* Place .text at the requested address */
    .text 0x400b0 : {
        KEEP(*(.text))  /* Keep the .text section */
    }

    /* Discard unwanted sections */
    /DISCARD/ : {
        *(.note.gnu.property)     /* Discard */
        *(.note.gnu.build-id)     /* Discard */
    }
}
