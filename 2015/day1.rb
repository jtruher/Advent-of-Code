#!/usr/bin/env ruby
require 'pp'

level = 0
File.readlines('day1.txt').each do |line|
  line.each_char.with_index do |char, index|
    case char
    when "("
      level += 1
    when ")"
      level -= 1
    end
  end
end

puts level