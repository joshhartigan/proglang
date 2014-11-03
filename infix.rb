# infix.rb: parse infix-operated math expressions
require 'scanf'

class InfixParser
  @operations = [ '/', '*', '+', '-' ]

  def eval_expression(expr) #TODO: implement parsing of entire expressions

  end

  def self.eval_binary_expression(expr)
    first_operand, oper, second_operand = expr.scanf('%f %c %f')
    if first_operand.nil?
      raise ArgumentError, 'missing or invalid left number'
    end

    begin
      case oper
        when '/' then first_operand / second_operand
        when '*' then first_operand * second_operand
        when '-' then first_operand - second_operand
        when '+' then first_operand + second_operand
        else raise ArgumentError, 'missing or invalid right number'
      end
    rescue TypeError
      raise ArgumentError, 'missing or invalid operation'
    end
  end
end

puts InfixParser.eval_binary_expression('433.45 * 2')
puts InfixParser.eval_binary_expression('-65*224.5')
puts InfixParser.eval_binary_expression('4* -25')
puts InfixParser.eval_binary_expression('489.67 *35')

