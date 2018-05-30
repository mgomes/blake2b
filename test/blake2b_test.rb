require 'test_helper'

class Blake2bTest < MiniTest::Test
  def setup
    out_len = 64
    key     = Blake2b::Key.from_string('foo bar baz')

    @digestor = Blake2b.new(out_len, key)

    @input    = 'The quick brown fox jumps over the lazy dog'
    @expected = '2c2d3abee08b19d67e4de4e953bbe0dba2f9e878f61e087191d00cf459a173281d93b0e28ea5303fe488312178dd7603d45b8d09311affe4aaa9a467cae3c9ef'
  end

  def test_to_hex
    res = @digestor.digest(@input, :to_hex)
    assert_kind_of String, res
    assert_equal @expected, res
  end

  def test_to_bytes
    res = @digestor.digest(@input, :to_bytes)
    assert_kind_of Array, res
    assert_equal [@expected].pack('H*').bytes, res
  end
end
