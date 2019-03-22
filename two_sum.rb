def bad_two_sum?(arr, target_sum)
    (0...arr.length-1).each do |idx1|
        (idx1+1...arr.length).each do |idx2|
            return true if arr[idx1] + arr[idx2] == target_sum
        end
    end
    return false
end

def okay_two_sum?(arr, target_sum)
    arr.sort!
end