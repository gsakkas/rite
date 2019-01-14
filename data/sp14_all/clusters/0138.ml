LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)
let b = n / 10 in
if b = 0 then [n] else [a]
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
