def substrings(word, dict)
  word = word.downcase
  result = {}

  dict.each do |substring|
     counter = word.scan(/(?=#{substring})/).count

     result[substring] = counter if counter > 0
  end
  
  puts result
end

#unit test
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)

