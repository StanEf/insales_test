module Task2
  class << self
    def k_unique_characters(str)
      result_length = str[0].to_i
      chars = str.slice(1, str.length - 1).split('')

      substrings = unique_substrings(chars, result_length)
      max_substring(substrings)
    end

    private

    def unique_substrings(chars, result_length)
      substrings = []
      while chars.size.positive?
        unique_chars = unique_chars(chars, result_length)
        substring = substring_from_unique_chars(chars, unique_chars)
        substrings.push(substring) if substring.length >= result_length

        chars.shift
      end

      substrings
    end

    def unique_chars(chars, result_length)
      chars.each_with_object({}) do |char, unique_chars|
        unique_chars[char] = true if unique_chars.length < result_length
      end
    end

    def substring_from_unique_chars(chars, unique_chars)
      chars.each_with_object('') do |char, substring|
        break substring unless unique_chars[char]

        substring << char
      end
    end

    def max_substring(substrings)
      max_length = 0
      substrings.each do |substring|
        length = substring.length
        max_length = length if length > max_length
      end

      substrings.detect { |i| i.length == max_length }
    end
  end
end

p Task2.k_unique_characters('2aabacba') == 'aaba'
p Task2.k_unique_characters('3aabacba') == 'aabacba'
p Task2.k_unique_characters('3abcccaabbdqweqweqweqweqwe') == 'qweqweqweqweqwe'
