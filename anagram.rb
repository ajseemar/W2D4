def first_anagrams?(str1, str2)
    str1_anagrams = permutations(str1.chars)
    str1_anagrams.include?(str2.chars)

end

def permutations(arr)
    return [arr] if arr.length < 1
    last = arr.pop
    perms = []
    prev_perms = permutations(arr)
    prev_perms.each do |perm|
        (0..perm.length).each do |insert_loc|
            perms << perm[0...insert_loc] + [last] + perm[insert_loc..-1]
        end
    end
    perms
end

def second_anagram?(str1, str2)
    str1.each_char do |char| 
        found_index = str2.index(char)
        return false if found_index.nil?
        str2.slice!(found_index)
    end
    return false unless str2.empty?
    return true
end

def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
    hashify(str1) == hashify(str2)
end

def hashify(str)
    counter = Hash.new(0)
    str.each_char { |char| counter[char] += 1 }
    counter
end