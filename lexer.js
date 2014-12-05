var a = 'if(a>2){\nconsole.log(\'hiya\')\n}'

function lex(string) {
  var PUNCTUATION = '(){}\'\"[]?:<>'
  var tokens = ''

  for (var i = 0; i < string.length; i++) {
    var char = string[i]
    var nextChar = string[i + 1]

    if ( PUNCTUATION.indexOf(char) >= 0 ) {
      tokens += ' ' + char + ' '
    } else {
      tokens += char
    }

  }

  return tokens.split(' ')
}

console.log(lex(a))
// this gives:
var _ = [ 'if', '(', 'a', '>', '2', ')', '', '{', '\nconsole.log', '(', '', '\'', 'hiya', '\'', '', ')', '\n', '}', '' ]
