# BLAKE2b for Ruby

BLAKE2 is a cryptographic hash function faster than MD5, SHA-1, SHA-2, and SHA-3, yet is at least as secure as the latest standard SHA-3. BLAKE2 has been adopted by many projects due to its high speed, security, and simplicity.

More info at: [https://blake2.net](https://blake2.net).

## Summary

This gem is a C-extension to enable using BLAKE2b in Ruby. This BLAKE2b implementation (or just BLAKE2) is optimized for 64-bit platforms with SSE support (excluding NEON-enabled ARMs). It produces digests of any size between 1 and 64 bytes.

The C code for this gem is taken from the [official reference C implementation](https://github.com/BLAKE2/BLAKE2) as of commit [ca4c89314abff54e3806b44e4a08164f8204f09a](https://github.com/BLAKE2/BLAKE2/tree/ca4c89314abff54e3806b44e4a08164f8204f09a).

## Install

```
gem install blake2b
```

## Usage

``` ruby
require 'blake2b'

# The UTF-8 String (Required) that you want to digest.
input   = 'abc'

# The main application of keyed BLAKE2 is as a message authentication code (MAC)
# By default `Blake2b::Key.none` is used.
key = Blake2b::Key.none
# key = Blake2b::Key.from_string("foo bar baz")
# key = Blake2b::Key.from_hex('DEADBEAF')
# key = Blake2b::Key.from_bytes([222, 173, 190, 175])

# The output length in Bytes of the Hash, Max and Default is 32.
out_len = 32

# HEX OUTPUT
############

Blake2b.hex(input)
=> "508c5e8c327c14e2e1a72ba34eeb452f37458b209ed63a294d999b4c86675982"

Blake2b.hex(input, key)
=> "508c5e8c327c14e2e1a72ba34eeb452f37458b209ed63a294d999b4c86675982"

Blake2b.hex(input, key, out_len)
=> "508c5e8c327c14e2e1a72ba34eeb452f37458b209ed63a294d999b4c86675982"

# BYTES OUTPUT
##############

Blake2b.bytes(input)
=> [80, 140, 94, ...]

Blake2b.bytes(input, key)
=> [80, 140, 94, ...]

Blake2b.bytes(input, key, out_len)
=> [80, 140, 94, ...]

```

## Performance

`Blake2b` really shines on larger inputs. Here are some benchmarks on various input sizes. You can find the performance suite used for these benchmarks at `performance/performance_suite.rb`. All tests were run on an iMac 27" Late 2014, 4GHz Core i7 CPU (4790K) w/ SSE4.1 + SSE4.2, 32GB DDR3 RAM.

### 1KB (1M digests)

```
MD5 result: 2.694545999998809 seconds.
SHA2 result: 4.037195000011707 seconds.
SHA512 result: 3.213850000000093 seconds.
BLAKE2s result: 5.6867979999951785 seconds.
BLAKE2b result: 4.375018999999156 seconds.
```

### 50KB (500k digests)

```
MD5 result: 34.33997299999464 seconds.
SHA2 result: 50.161426999999094 seconds.
SHA512 result: 35.24845699999423 seconds.
BLAKE2s result: 64.8592859999917 seconds.
BLAKE2b result: 30.783814999987953 seconds.
```

### 250KB (500k digests)

```
MD5 result: 67.89016799999808 seconds.
SHA2 result: 103.09026799999992 seconds.
SHA512 result: 72.46762200001103 seconds.
BLAKE2s result: 133.5229810000019 seconds.
BLAKE2b result: 64.30263599999307 seconds.
```

## Development

After checking out the repo, run `bundle` to install dependencies. Then,
run `rake full` to build and test, or `rake test` to only run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Future

Hopefully this gem will not be required once Ruby [issue #12802](https://bugs.ruby-lang.org/issues/12802) is resolved. Blake2 will either be included natively into MRI or available through the OpenSSL library.

## License

Blake2b is based heavily on [Blake2](https://github.com/franckverrot/blake2) by Franck Verrot, Copyright 2014.

Blake2b is copyright 2018, Mauricio Gomes.

The original work (Blake2) and the modified work (Blake2b) are licensed GPL v3.0. See LICENSE.txt for details.
