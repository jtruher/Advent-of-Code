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
  elements << line.strip
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
oxygen = elements.map(&:clone)
12.times do |index|
  puts "start length #{oxygen.count}"
  ones, zeroes = get_ones_and_zeroes(oxygen)
  pp ones, zeroes

  if ones[index] >= zeroes[index]
    oxygen = filter_include(oxygen, index, '1')
  else 
    oxygen = filter_include(oxygen, index, '0')
  end
end

co2 = elements.map(&:clone)
12.times do |index|
  if co2.count == 1
    puts "oh snap"
    break
  end
  puts "start length #{co2.count}"
  ones, zeroes = get_ones_and_zeroes(co2)
  pp ones, zeroes

  if zeroes[index] <= ones[index]
    co2 = filter_include(co2, index, '0')
  elsif ones[index] <= zeroes[index]
    co2 = filter_include(co2, index, '1')
  end
  # if ones[index] >= zeroes[index]
  #   co2 = filter_include(co2, index, '1')
  # else 
  #   co2 = filter_include(co2, index, '0')
  # end
end

pp co2.first.to_i(2) * oxygen.first.to_i(2)
