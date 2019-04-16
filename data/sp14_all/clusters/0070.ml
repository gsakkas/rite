LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let (l1' , l2') = x in
let addit =
  (l1' + l2') + carry in
(if addit > 10
 then addit mod 10
 else 0 , (addit / 10) :: num)
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
let (upper_mult , total) =
  a in
let newTotal =
  mulByDigit x upper_mult in
let updateTotal =
  bigAdd newTotal total in
(upper_mult @ [0] , updateTotal)
let (l2digit2 , templ12) =
  a in
let multres =
  mulByDigit l2digit templ1 in
(0 , bigAdd (templ12 @ [0])
            multres)
let (i , acc) = a in
let digmul =
  mulByDigit (i * x) l2 in
(i * 10 , bigAdd digmul acc)
