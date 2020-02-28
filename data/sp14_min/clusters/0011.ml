LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (TupleG [EmptyG,EmptyG])
let (carry , num) = a in
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
let (carry , num) = a in
let (l1 , l2) = x in
(0 , l1 :: num)
let (el1 , el2) = x in
let new_sum =
  (rem + el1) + el2 in
let new_rem =
  if new_sum > 9
  then 1
  else 0 in
let norm_sum =
  if new_sum > 9
  then new_sum - 10
  else new_sum in
(new_rem , norm_sum :: acc)
let (x1 , x2) = x in
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
let (x' , x'') = x in
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
let (upper_mult , total) =
  a in
let newTotal =
  mulByDigit x upper_mult in
let updateTotal =
  bigAdd newTotal total in
(upper_mult @ [0] , updateTotal)
let (pos , total) = a in
(pos , l2)
let (l2digit2 , templ12) =
  a in
let multres =
  mulByDigit l2digit templ1 in
(0 , bigAdd (templ12 @ [0])
            multres)
let (i , j) = x in
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
let (s , t) = a in
(((i + j) + s) / 10 , (((i + j) + s) mod 10) :: t)
let (h :: t , _) = a in
([] , [])
let (one , two) = a in
(x :: one , y :: two)
let (b1 , b2) = a in
match x with
| (fir , sec) -> if (fir + sec) < 10
                 then ([] , (fir + sec) :: b2)
                 else ([] , (fir + sec) :: b2)
let (i , acc) = a in
let digmul =
  mulByDigit (i * x) l2 in
(i * 10 , bigAdd digmul acc)
