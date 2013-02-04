#!/usr/bin/env ruby

SOURCE = '/home/mlambie/Downloads'
DESTINATION = '/media/storage/ufc'
GLOB = '*{ufc,UFC}*'

Dir.mkdir DESTINATION unless Dir.exists? DESTINATION

# remove any dangling symlinks
system "find -L #{DESTINATION} -type l -exec rm -rf {} \\;"

Dir.glob(File.join(SOURCE, GLOB)).each do |match|
  destination = File.join(DESTINATION, File.split(match)[1])
  puts match
  `ln -s '#{match}' '#{destination}'` unless File.exists? destination
end
