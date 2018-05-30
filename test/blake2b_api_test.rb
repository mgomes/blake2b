require 'test_helper'

class Blake2bTest < MiniTest::Test
  def test_hex_with_input_only
    res = Blake2b.hex('abc')
    assert_kind_of String, res
    assert_equal 'bddd813c634239723171ef3fee98579b94964e3bb1cb3e427262c8c068d52319', res
  end

  def test_hex_with_input_and_key
    res = Blake2b.hex('abc', Blake2b::Key.none)
    assert_kind_of String, res
    assert_equal 'bddd813c634239723171ef3fee98579b94964e3bb1cb3e427262c8c068d52319', res
  end

  # From the computation in the RFC
  # https://tools.ietf.org/html/rfc7693#appendix-A
  def test_hex_with_input_key_and_length
    res = Blake2b.hex('abc', Blake2b::Key.none, 64)
    assert_kind_of String, res
    assert_equal 'ba80a53f981c4d0d6a2797b69f12f6e94c212f14685ac4b74b12bb6fdbffa2d17d87c5392aab792dc252d5de4533cc9518d38aa8dbf1925ab92386edd4009923', res
  end

  def test_hex_with_blank_input_key_and_length
    res = Blake2b.hex('', Blake2b::Key.none, 64)
    assert_kind_of String, res
    assert_equal '786a02f742015903c6c6fd852552d272912f4740e15847618a86e217f71f5419d25e1031afee585313896444934eb04b903a685b1448b755d56f701afe9be2ce', res
  end

  def test_hex_with_known_input_key_and_length
    res = Blake2b.hex('The quick brown fox jumps over the lazy dog', Blake2b::Key.none, 64)
    assert_kind_of String, res
    assert_equal 'a8add4bdddfd93e4877d2746e62817b116364a1fa7bc148d95090bc7333b3673f82401cf7aa2e4cb1ecd90296e3f14cb5413f8ed77be73045b13914cdcd6a918', res
  end

  def test_bytes_with_input_only
    res = Blake2b.bytes('abc')
    assert_kind_of Array, res
    assert_equal [189, 221, 129, 60, 99, 66, 57, 114, 49, 113, 239, 63, 238, 152, 87, 155, 148, 150, 78, 59, 177, 203, 62, 66, 114, 98, 200, 192, 104, 213, 35, 25], res
  end

  def test_bytes_with_input_and_key
    res = Blake2b.bytes('abc', Blake2b::Key.none)
    assert_kind_of Array, res
    assert_equal [189, 221, 129, 60, 99, 66, 57, 114, 49, 113, 239, 63, 238, 152, 87, 155, 148, 150, 78, 59, 177, 203, 62, 66, 114, 98, 200, 192, 104, 213, 35, 25], res
  end

  def test_bytes_with_input_key_and_length
    res = Blake2b.bytes('abc', Blake2b::Key.none, 32)
    assert_kind_of Array, res
    assert_equal [189, 221, 129, 60, 99, 66, 57, 114, 49, 113, 239, 63, 238, 152, 87, 155, 148, 150, 78, 59, 177, 203, 62, 66, 114, 98, 200, 192, 104, 213, 35, 25], res
  end

  def test_input_raises_on_non_string
    assert_raises(ArgumentError) { Blake2b.hex(nil) }
    assert_raises(ArgumentError) { Blake2b.bytes(nil) }
  end

  def test_key_raises_on_non_key
    assert_raises(ArgumentError) { Blake2b.hex('abc', []) }
    assert_raises(ArgumentError) { Blake2b.bytes('abc', []) }
  end

  def test_length_raises_on_invalid
    assert_raises(ArgumentError) { Blake2b.hex('abc', Blake2b::Key.none, -1) }
    assert_raises(ArgumentError) { Blake2b.hex('abc', Blake2b::Key.none, 0) }
    assert_raises(ArgumentError) { Blake2b.hex('abc', Blake2b::Key.none, 65) }
    assert_raises(ArgumentError) { Blake2b.hex('abc', Blake2b::Key.none, '32') }
    assert_raises(ArgumentError) { Blake2b.bytes('abc', Blake2b::Key.none, -1) }
    assert_raises(ArgumentError) { Blake2b.bytes('abc', Blake2b::Key.none, 0) }
    assert_raises(ArgumentError) { Blake2b.bytes('abc', Blake2b::Key.none, 65) }
    assert_raises(ArgumentError) { Blake2b.bytes('abc', Blake2b::Key.none, '32') }
  end
end
