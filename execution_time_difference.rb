require 'benchmark'

def my_min(arr)
    arr.each do |el|
        is_min = true
        arr.each do |el2|
            is_min = false if el2 > el
        end
        return el if is_min
    end
end

def my_min_v2(arr)
    arr.inject { |acc, el| acc > el ? el : acc }
end

def largest_contiguous_subsum(list)
    subs = []
    (0...list.length).each do |i|
        (i...list.length).each do |j|
            subs << list[i..j]
        end
    end
    subs.inject(subs.first.sum) { |acc, el| acc > el.sum ? acc : el.sum }
end

def largest_contiguous_subsum_v2(list)
    running_sum = 0
    current_min = 0
    largest_gap = nil
    while !list.empty?
        running_sum += list.shift
        if largest_gap.nil?
            largest_gap = running_sum - current_min
        end
        if running_sum - current_min > largest_gap
            largest_gap = running_sum - current_min
        end
        if running_sum < current_min
            current_min = running_sum
        end
    end
    return largest_gap
end

