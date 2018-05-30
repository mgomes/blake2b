require 'mkmf'
$CFLAGS += ' -Wall -Wextra -std=c99 -pedantic -Wno-long-long'
create_makefile 'blake2b_ext'
