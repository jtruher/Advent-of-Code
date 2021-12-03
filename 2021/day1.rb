#!/usr/bin/env ruby

f = File.read 'day1.txt'

arr = f.split("\n").collect(&:to_i)

count = 0

for index in 0...(arr.size - 1)
  if arr[index] < arr[index + 1] 
    puts "#{arr[index]} < #{arr[index + 1]}"
    count += 1
  end
end

threeArr = []
threeCount = 0

for index in 0...(arr.size - 2)
  threeArr << arr[index] + arr[index + 1] + arr[index + 2]
end

for index in 0...(threeArr.size - 1)
  if threeArr[index] < threeArr[index + 1] 
    puts "#{threeArr[index]} < #{threeArr[index + 1]}"
    threeCount += 1
  end
end

puts threeCount