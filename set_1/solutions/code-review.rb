#-----PROUD CODE-----

def longest_palindrome(string)
  (1..string.length).reverse_each do |i|
    (0..(string.length - i)).each do |j|
      if palindrome?(pal = string.slice(j, i))
        return pal
      end
    end
  end
end
#----------------------------------------------------

def greatest_common_factor(number1, number2)
  pointer = [number1, number2].min
  while pointer > 0
    if number1 % pointer == 0 && number2 % pointer == 0
      return pointer
    else
      pointer -= 1
    end
  end
end
#-----------------------------------------------------

class Restaurant
  def initialize(menu)
    @menu = menu
    @insults = ["How did you manage to open the door and get into this place?",
                "GET OUT!",
                "Let's stick with the menu, shall we?"]
  end

  def cost(*order)
    sum = 0
    messages = ""
    order.each do |food|
      food.each do |item, no|
        if @menu[item]
          sum += @menu[item] * no
        else
          messages << "\n#{@insults[rand(@insults.length)]} We don't sell #{item}."
        end
      end
    end
    return "Hello! Thank you for ordering. Your bill is £#{sum}.#{messages}"
  end

end
#---------------------------------------------------------------------------------

def caesar_cipher(offset, string)
  (0...string.length).each do |i|
    val = string[i].ord
    if val >= 97 && val <= 122
      coded_val = ((val + offset - 97) % 26) + 97
      string[i] = coded_val.chr
    elsif val >= 65 && val <= 90 # Improvement to include capital letters
      coded_val = ((val + offset - 65) % 26) + 65
      string[i] = coded_val.chr
    end
  end

  return string
end

#-----NOT SO PROUD CODE-----

def dasherize_number(num)
  digits = []
  while num > 0
    digits.unshift(num % 10)
    num = num / 10
  end

  return_string = ""

  last_odd = false

  (0...digits.length).each do |i|
    if digits[i] % 2 == 1
      if i == 0
        return_string = digits[i].to_s + "-"
      elsif i == digits.length - 1 && return_string[-1] != "-"
        return_string = return_string + "-" + digits[i].to_s
      elsif i == digits.length - 1 && return_string[-1] == "-"
        return_string = return_string + digits[i].to_s
      elsif return_string[-1] == "-"
        return_string = return_string + digits[i].to_s + "-"
      else
        return_string = return_string + "-" + digits[i].to_s + "-"
      end
    else
      return_string += digits[i].to_s
    end
  end

return return_string

end
#------------------------------------------------------------------
def number_shuffle(num)
  num.to_s.chars.permutation(num.to_s.length).to_a.map{ |comb| comb.join('').to_i}
end