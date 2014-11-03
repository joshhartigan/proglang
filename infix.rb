# infix.rb: parse infix-operated math expressions

def is_number?(str)
  true if Float(str) rescue false
end

class InfixParser
  @operations = [ '/', '*', '+', '-' ]

  testString = '(24 + 6) / 10 * 3'
  shouldEqual = 9

  def eval_expression(expr) #TODO: implement parsing of entire expressions

  end

  def self.eval_binary_expression(chunk)
    chunk = chunk.gsub ' ', ''

    if not (chunk.include?('/') or chunk.include?('*') \
        or chunk.include?('+') or chunk.include?('-'))
        puts "error: no operations in chunk: #{chunk}"
        exit
    end

    firstNumber = ''
    secondNumber = ''

    i = 0
    currentChar = ''
    while not @operations.include? currentChar
      currentChar = chunk[i]
      if not is_number? currentChar and not @operations.include? currentChar \
         and currentChar != '.'
        puts "error: non-numerical digit in chunk: #{currentChar}"
        exit
      end
      firstNumber += currentChar
      i += 1
    end
    firstNumber = firstNumber[0 .. -2]

    for c in i-1 .. chunk.length-1
      if not is_number? chunk[c] and not @operations.include? currentChar \
         and currentChar != '.'
        puts "error: non-numerical digit in chunk: #{currentChar}"
        exit
      end
      secondNumber += chunk[c]
    end
    secondNumber = secondNumber[1 .. secondNumber.length - 1]

    case chunk[i - 1]
      when '/' then Float(firstNumber) / Float(secondNumber)
      when '*' then Float(firstNumber) * Float(secondNumber)
      when '+' then Float(firstNumber) + Float(secondNumber)
      when '-' then Float(firstNumber) - Float(secondNumber)
    end

  end

end

puts InfixParser.eval_binary_expression('433.45 * 2')
puts InfixParser.eval_binary_expression('65*224.5')
puts InfixParser.eval_binary_expression('4* 25')
puts InfixParser.eval_binary_expression('489.67 *35')

