#!/usr/bin/env ruby

def infix_to_prefix(expr)
  operators = []
  results = []

  for token in tokenise(expr)
    if operator? token

  end
end

puts infix_to_prefix( ARGV.join ' ' ).join ' '

