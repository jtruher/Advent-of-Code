#!/usr/bin/env ruby

# f = File.read 'day1.txt'

horiz = 0
depth = 0
aim = 0

# Step 1
File.readlines('day2.txt').each do |line|
  heading, adjustment = line.split
  adjustment = adjustment.to_i

  case heading
  when "up"
    depth -= adjustment
  when "down"
    depth += adjustment
  when "forward"
    horiz += adjustment
  end
end

puts "Step 1: horiz #{horiz}, depth #{depth}, combined #{horiz * depth}"

horiz = 0
depth = 0
aim = 0
# Step 2
File.readlines('day2.txt').each do |line|
  heading, adjustment = line.split
  adjustment = adjustment.to_i

  case heading
  when "up"
    aim -= adjustment
  when "down"
    aim += adjustment
  when "forward"
    horiz += adjustment
    depth += aim * adjustment
  end
end

puts "Step 2: horiz #{horiz}, depth #{depth}, combined #{horiz * depth}"