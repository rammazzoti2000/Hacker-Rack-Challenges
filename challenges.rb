# 1. FizzzBuzz
100.times do |i|
  i+=1
  if i%15==0
      puts "FizzBuzz"
  elsif i%5==0
      puts "Buzz"
  elsif i%3==0
      puts "Fizz"
  else
      puts i
  end
end

# 2. RepeatedString
def repeatedString(s, n)
    
  return n if s.size == 1 && s == 'a'

  total = (s.count('a') * (n/s.size)) + s[0, n % s.size].count('a')
  total
end

# 3. Anagram
def anagram(s)
  s_left = s[0...s.length/2.0].split('')
  s_right = s[s.length/2.0..s.length-1].split('')

  return -1 if s_left.size != s_right.size
  return 0 if counting(s_left.join('')) == counting(s_right.join(''))

  s.split('').each do |elem|
    if s_left.include?(elem) && s_right.include?(elem)
      s_left.delete_at(s_left.index(elem))
      s_right.delete_at(s_right.index(elem))
    end
  end
  (s_left + s_right).size / 2
end

def counting(word)
  count = Hash.new(0)
  word.each_char { |char| count[char] += 1}
  return count
end

# 4. Palindrome Index
def palindromeIndex(str)
  return -1 if palindrome?(str)

  (str.length/2).times do |i|
    if str[i] != str[-(i+1)]      
      s_left = str[0...i]
      s_right = str[i+1...str.length]
      
      return i if palindrome?(s_left + s_right)      
      s_left = str[0...-(i+1)]
      s_right = str[(str.length-i)...str.length]
      
      return str.length-i-1 if palindrome?(s_left + s_right)
    end
  end
end


# 5. Project Euler #2: Even Fibonacci numbers
# Every third term of this series is even.... and the series of even terms goes like 0,2,8,34,... so any even term E(n) can be expressed as E(n)= 4*E(n-1) + E(n-2)....
t = gets.strip.to_i
for a0 in (0..t-1)
  n = gets.strip.to_i
  prev = 0
  curr = 2
  sum = 0

  while curr <= n
    sum += curr
    prev, curr = curr, prev + (4 * curr)
  end
  p sum 
end