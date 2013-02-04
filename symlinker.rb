#!/usr/bin/env ruby

SOURCE = '/Users/mlambie/symlinker/source'
DESTINATION = '/tmp/destination'
GLOB = '*{ufc,UFC}*'

Dir.mkdir DESTINATION unless Dir.exists? DESTINATION

# remove any dangling symlinks
system "find -L #{DESTINATION} -type l -exec rm -rf {} \\;"

Dir.glob(File.join(SOURCE, GLOB)).each do |match|
  destination = File.join(DESTINATION, File.split(match)[1])
  `ln -s #{match} #{destination}` unless File.exists? destination
end