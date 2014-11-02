# infix.rb: parse infix-operated math expressions

class String
  def is_number?
    true if Float(self) rescue false
  end
end

class InfixParser
  @operations = [ '/', '*', '+', '-' ]

  testString = '(24 + 6) / 10 * 3'
  shouldEqual = 9

  def solveExpression(expr) #TODO: implement parsing of entire expressions

  end

  def self.solveChunk(chunk)
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
      if not currentChar.is_number? and not @operations.include? currentChar \
         and currentChar != '.'
        puts "error: non-numerical digit in chunk: #{currentChar}"
        exit
      end
      firstNumber += currentChar
      i += 1
    end
    firstNumber = firstNumber[0 .. -2]

    for c in i-1 .. chunk.length-1
      if not chunk[c].is_number? and not @operations.include? currentChar \
         and currentChar != '.'
        puts "error: non-numerical digit in chunk: #{currentChar}"
        exit
      end
      secondNumber += chunk[c]
    end
    secondNumber = secondNumber[1 .. secondNumber.length - 1]

    if chunk[i - 1] == '/'
      return Float(firstNumber) / Float(secondNumber)
    elsif chunk[i - 1] == '*'
      return Float(firstNumber) * Float(secondNumber)
    elsif chunk[i - 1] == '+'
      return Float(firstNumber) + Float(secondNumber)
    elsif chunk[i - 1] == '-'
      return Float(firstNumber) - Float(secondNumber)
    else
      puts "error: invalid operator in chunk: #{chunk}"
    end

  end

end

puts InfixParser.solveChunk('433.45 * 2')
puts InfixParser.solveChunk('65*224.5')
puts InfixParser.solveChunk('4* 25')
puts InfixParser.solveChunk('489.67 *35')

