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
    expr.split('').each do |char|
      puts char
    end
  end

  def self.solveChunk(chunk)
    if not (chunk.include?('/') or chunk.include?('*') \
        or chunk.include?('+') or chunk.include?('-'))
        puts "error: no operations in chunk: #{chunk}"
        exit
    end

    firstNumber = ''
    secondNumber = ''

    operandIndex = nil

    (0 .. (chunk.length - 1)).each do |i|
      if chunk[i].is_number? or chunk[i] == '.'
        firstNumber += chunk[i]
      elsif chunk[i] != ' '
        operandIndex = i
        break
      end
    end

    (operandIndex + 1 .. (chunk.length - 1)).each do |i|
      if chunk[i].is_number? or chunk[i] == '.'
        secondNumber += chunk[i]
      elsif chunk[i] != ' '
        puts "error: invalid character in second chunk operand: #{chunk[i]}"
        exit
      end
    end

    if chunk[operandIndex] == '/'
      return Float(firstNumber) / Float(secondNumber)
    elsif chunk[operandIndex] == '*'
      return Float(firstNumber) * Float(secondNumber)
    elsif chunk[operandIndex] == '+'
      return Float(firstNumber) + Float(secondNumber)
    elsif chunk[operandIndex] == '-'
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

