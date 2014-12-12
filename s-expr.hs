isParenthesised :: [Char] -> Bool
isParenthesised str = str !! 0 == '(' && str !! ((length str) - 1) == ')'

slice :: Int -> Int -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

parseExpr :: [Char] -> [[Char]]
parseExpr expr
  | not (isParenthesised expr) = error "s-expr.hs: expression isn't parenthesised"
  | otherwise = words noParens
  where noParens = slice 1 ((length expr) - 2) expr

-- e.g. parseExpr "(+ (- 4 2) 5)" gives:
-- ["+","(-","4","2)","5"]

