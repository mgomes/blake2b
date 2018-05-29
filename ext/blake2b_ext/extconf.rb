require 'mkmf'
$CFLAGS += ' -std=c99'
create_makefile 'blake2b_ext'
