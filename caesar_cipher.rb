def caesar_cipher(str, num) 
  result = '';

  if num == 0
    return str
  end

  # converts num to range (0, 25); keeps sign
  num = (num.abs % 26) * num/num.abs

  str.each_char.with_index do |char, index|
      
    #filter out word char only
    if /^[a-zA-Z]+$/.match?(char)

      #transform char to ASCII
      charcode = char.ord + num

      #set wraparound condition for A-Za-z
      if char == char.downcase

        if charcode > 122
          charcode = 96 + (charcode - 122) 
        elsif charcode < 97
          charcode = 123 - (97 - charcode)
        end

      elsif char == char.upcase 

        if charcode > 90
          charcode = 64 + (charcode - 90)        
        elsif charcode < 65
          charcode = 91 - (65 - charcode)
        end
      end

      #push ciphered char to result string
      result += charcode.chr

    else
      #return non-word char as is
      result += char
    end
  end

  return result
end

puts caesar_cipher("What a string!", 5)
# returns "Bmfy f xywnsl!"