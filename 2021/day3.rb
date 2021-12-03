#!/usr/bin/env ruby
require 'pp'
# f = File.read 'day1.txt'

ones = Array.new(12, 0)
zeroes = Array.new(12, 0)
elements = []

File.readlines('day3.txt').each do |line|
  line.each_char.with_index do |char, index|
    case char
    when "1"
      ones[index] += 1
    when "0"
      zeroes[index] += 1
    end
  end
  elements << line
end

# puts ones
# puts zeroes

gamma = ""
epsilon = ""

ones.each_with_index do |value, index|
  if value > zeroes[index]
    gamma << "1"
    epsilon << "0"
  else
    gamma << "0"
    epsilon << "1"
  end
end

# puts gamma, epsilon

# puts gamma.to_i(2) * epsilon.to_i(2)

def get_ones_and_zeroes(arr)
  inner_ones = Array.new(12, 0)
  inner_zeroes = Array.new(12, 0)
  arr.each do |line|
    line.each_char.with_index do |char, index|
      case char
      when '1'
        inner_ones[index] += 1
      when '0'
        inner_zeroes[index] += 1
      end
    end
  end

  return [inner_ones, inner_zeroes]
end

def filter_include(arr, index, value)
  ret = []

  arr.each do |line|
    if line[index] == value
      ret << line
    end
  end

  return ret
end

# Start with the oxygen generator rating
start = elements
12.times do |index|
  ones, zeroes = get_ones_and_zeroes(start)
  pp ones, zeroes

  if ones[index] >= zeroes[index]
    start = filter_include(start, index, '1')
  else 
    start = filter_include(start, index, '0')
  end

end