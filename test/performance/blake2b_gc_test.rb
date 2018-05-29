require 'test_helper'

class Blake2bGCTest < MiniTest::Test
  def test_a_million_iteration
    1_000_000.times do |i|
      Blake2b.new(32, Blake2b::Key.none).digest('abc', :to_hex)
    end
  end
end
