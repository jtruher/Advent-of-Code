#!/usr/bin/env ruby
require 'pp'

# 2*l*w + 2*w*h + 2*h*l
def surface_area(w, h, l)
  fields = [w, h, l].sort

  return 2 * l * w + 2 * w * h + 2 * h * l + fields[0] * fields[1]
end

def feet_for_dimensions(dim)
  w, h, l = dim.split("x").map(&:to_i)
end

def ribbon_length(w, h, l)
  fields = [w, h, l].sort

  return fields[0] * 2 + fields[1] * 2
end

def ribbon_wrap(w, h, l)
  return w * h * l
end

total = 0
ribbon = 0

File.readlines('day2.txt').each do |line|
  dimensions = feet_for_dimensions(line)
  total += surface_area(*dimensions)
  ribbon += ribbon_length(*dimensions)
  ribbon += ribbon_wrap(*dimensions)
end

puts total
puts ribbon
