# When done, submit this entire file to the autograder.

# Part 1

def sum arr # sums elements in array
  s = 0
  arr.each do |x|
    s += x
  end
  return s
end
# Run associated tests via: $ rspec -e '#sum ' spec/part1_spec.rb

def max_2_sum arr # sums max 2 elements in array
  if arr.length > 1
    max = arr[0]
  elsif arr.length == 1
    return arr[0]
  else
    return 0
  end
  arr.each do |x| # find first max
    if x > max
      max = x
    end
  end
  arr.delete_at(arr.find_index(max)) # delete the max element from the array
  max2 = arr[0]
  arr.each do |x| # find second max
    if x > max2
      max2 = x
    end
  end
  return max + max2
end
# Run associated tests via: $ rspec -e '#max_2_sum' spec/part1_spec.rb

def sum_to_n? arr, n # return true if any 2 numbers in array sum to n
  if arr.length == 0
    return false
  end
  for i in 0...arr.length
    for j in 0...arr.length
      if i != j && (arr[i] + arr[j]) == n # true if the indices aren't the same and the sum is n
        return true
      end
    end
  end
  return false
end
# Run associated tests via: $ rspec -e '#sum_to_n' spec/part1_spec.rb
# Check part 1: $ rspec spec/part1_spec.rb

# Part 2

def hello(name) # print "Hello, [name]"
  output = "Hello, " + name
  return output
end
# Run associated tests via: $ rspec -e '#hello' spec/part2_spec.rb

def starts_with_consonant? s # return true if s starts with a consonant
  s = s.downcase() # make string lowercase
  if s.length == 0 # check if empty string
    return false
  elsif /\Aa/.match(s) || /\Ae/.match(s) || /\Ai/.match(s) || /\Ao/.match(s) || /\Au/.match(s) # check if starts with vowel
    return false
  elsif /\W/.match(s) # check if non-letter
    return false
  else
    return true
  end
end
# Run associated tests via: $ rspec -e '#starts_with_consonant?' spec/part2_spec.rb

def binary_multiple_of_4? s # return true if s is a binary number that is a multiple of 4
  if /[^01]/.match(s) || s.length == 0 # check whether s has chars other than 0 or 1
    return false
  elsif /0{2}\Z/.match(s) || s == "0" # check whether s is a multiple of 4 (ends in "00" / is 0)
    return true
  else
    return false
  end
end
# Run associated tests via: $ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb
# Check part 2: $ rspec spec/part2_spec.rb

# Part 3

class BookInStock
  def initialize isbn, price # constructor
    begin
      if (isbn == "") # check if isbn is blank
        raise ArgumentError
      end
      @isbn = isbn
      if (price <= 0) # check if price is less than or equal to 0
        raise ArgumentError
      end
      @price = price
    end
  end
  # Run associated tests via: $ rspec -e 'constructor' spec/part3_spec.rb

  # getters
  def isbn
    @isbn
  end
  def price
    @price
  end
  # setters
  def isbn=(isbn)
    @isbn = isbn
  end
  def price=(price)
    @price = price
  end
  # Run associated tests via: $ rspec -e 'getters and setters' spec/part3_spec.rb
  
  def price_as_string
    priceS = "$" + @price.to_s
    if /\.\d\Z/.match(priceS) # check if only 1 digit after the decimal
      priceS = priceS + "0"
    elsif /\.\d\d\Z/.match(priceS) # check if 2 digits after the decimal (do nothing)
    else
      priceS = priceS + ".00"
    end
    return priceS
  end
  # Run associated tests via: $ rspec -e '#price_as_string' spec/part3_spec.rb
end
# Check part 3: $ rspec spec/part3_spec.rb