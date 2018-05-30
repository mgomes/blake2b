require 'digest'
require 'blake2'
require 'blake2b'

sample_string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis fermentum mauris, laoreet ultricies ipsum. Phasellus iaculis lacinia bibendum. Aenean eu lectus vitae nisi pellentesque condimentum. Cras imperdiet risus ut interdum dignissim. Nam ultricies vulputate varius. Morbi vehicula mi sit amet velit cursus, eu blandit dolor venenatis. Nunc vitae varius leo. Mauris metus nibh, ultrices nec odio in, viverra luctus purus. Duis luctus, dolor vel sodales semper, enim mauris sagittis dolor, at vehicula ligula ante eu lorem. Morbi porttitor lorem id turpis facilisis volutpat. Sed elementum porttitor sem, a ornare ligula. Integer tincidunt aliquam suscipit. Sed aliquam ligula id enim fringilla, vel ornare ante bibendum. Integer tincidunt, augue id condimentum fermentum, dolor urna molestie massa, sed congue enim quam eget arcu. Quisque feugiat purus sit amet porttitor tincidunt.

Fusce odio libero, lobortis quis ornare sit amet, dignissim sed erat. Praesent a iaculis ex. Ut libero amet."

run_count = 500_000

### MD5
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
run_count.times do |i|
  Digest::MD5.hexdigest("#{i}#{sample_string}")
end
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

puts "MD5 result: #{ending - starting} seconds."


### SHA2
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
run_count.times do |i|
  Digest::SHA2.hexdigest("#{i}#{sample_string}")
end
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

puts "SHA2 result: #{ending - starting} seconds."


### SHA512
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
run_count.times do |i|
  Digest::SHA512.hexdigest("#{i}#{sample_string}")
end
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

puts "SHA512 result: #{ending - starting} seconds."



### BLAKE2s
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
unkeyed = Blake2::Key.none
run_count.times do |i|
  Blake2.new(32, unkeyed).digest("#{i}#{sample_string}", :to_hex)
end
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

puts "BLAKE2s result: #{ending - starting} seconds."


### BLAKE2b
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
unkeyed = Blake2b::Key.none
run_count.times do |i|
  Blake2b.new(32, unkeyed).digest("#{i}#{sample_string}", :to_hex)
end
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

puts "BLAKE2b result: #{ending - starting} seconds."
