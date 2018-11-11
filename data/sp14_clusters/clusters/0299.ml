LetG NonRec [AppG [EmptyG]] (LetG NonRec [EmptyG] EmptyG)
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
let ll1 = List.length l1 in
let ll2 = List.length l2 in
(clone 0
       (ll2 - ll1) @ l1 , clone 0
                                (ll1 - ll2) @ l2)
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let prev = prevN a in
let sumlist =
  fun (p1 , p2) -> p2 in
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let sum = sumlist a in
let add =
  fun (m , n) -> m + n in
let digit = add x + prev in
if digit > 10
then (1 , (digit - 10) :: sum)
else (0 , digit :: sum)
let seed =
  Array.of_list [seed1 ; seed2] in
let s =
  Random.State.make seed in
fun (x , y) ->
  x + Random.State.int s (y - x)
let carry = getCarry a in
let getSum =
  fun (c , l) -> l in
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
