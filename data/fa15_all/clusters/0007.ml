LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)
let (carry , currentSum) =
  a in
let (toSum1 , toSum2) = x in
let intermediateValue =
  (toSum1 + toSum2) + carry in
let valueToAddToArray =
  intermediateValue mod 10 in
let carry =
  intermediateValue / 10 in
(carry , valueToAddToArray :: currentSum)
let (m , n) = x in
let (y , z) = a in
(addition (m , n) / 10 , [addition (m , n) mod 10])
let (x1 , x2) = x in
let (carry , sum) = a in
((x1 + x2) / 10 , (((x1 + x2) + carry) mod 10) :: sum)
let (a1 , a2) = a in
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
let (x1 , x2) = x in
let (a1 , a2) = a in
(if ((a1 + x1) + x2) >= 10
 then 1
 else 0 , ((a1 + x1) + x2) :: a2)
let (fst , sec) = x in
let (fst' , sec') =
  if (fst + sec) > 9
  then ((fst + sec) - 10 , 1)
  else (fst + sec , 0) in
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
let (y , z) = a in
let (r , s) = x in
let m = (r + s) + y in
(m / 10 , (m mod 10) :: z)
let (x1 , x2) = x in
let (carry , temp) = a in
let s = (x1 + x2) + carry in
let carry' = s / 10 in
let rem = s mod 10 in
let acc = rem :: temp in
if List.length acc = List.length l1
then (0 , carry' :: acc)
else (carry' , acc)
let (carry , ans) = a in
let (y , z) = x in
((y + z) + carry) > 9
let (x1 , x2) = x in
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
let (x1 , x2) = x in
let (carry , res) = a in
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
let (l1x , l2x) = x in
let (a1 , a2) = a in
(a1 , (l1x + l2x) :: a2)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
let (x1 , x2) = x in
let (a1 , a2) = a in
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
let (m , n) = a in
let (o , p) = x in
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
let (lh1 , lh2) = x in
let (carry , res) = a in
let num =
  (lh1 + lh2) + carry in
(num / 10 , (num mod 10) :: res)
let (j , k) = x in
let (l , m) = a in
if ((j + k) + l) > 9
then (1 , (((j + k) + l) - 10) :: m)
else (0 , ((j + k) + l) :: m)
