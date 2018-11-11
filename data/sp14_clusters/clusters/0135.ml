LetG NonRec [IteG EmptyG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)
let sum =
  if carry = 1
  then getTail (getSum a)
  else getSum a in
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
