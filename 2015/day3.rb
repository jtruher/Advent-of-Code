#!/usr/bin/env ruby
require 'pp'

santa = {x: 0, y: 0}
robot = {x: 0, y: 0}

x = 0
y = 0

deliveries = [[x, y]]

File.readlines('day3.txt').each do |line|
  line.each_char.with_index do |char, index|
    case char
    when '<'
      x -= 1
    when '>'
      x += 1
    when '^'
      y += 1
    when 'v'
      y -= 1
    end

    deliveries << [x, y]
  end
end

puts deliveries.count, deliveries.uniq.count
