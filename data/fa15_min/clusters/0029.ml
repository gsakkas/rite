LetG NonRec [(VarPatG,AppG [EmptyG])] (AppG [EmptyG])
let absNumZeros =
  abs numZeros in
if numZeros = 0
then (l1 , l2)
else (let listZeros =
        clone 0 absNumZeros in
      if numZeros > 0
      then (l1 , listZeros @ l2)
      else (listZeros @ l1 , l2))
let digits = digitsOfInt n in
sumList digits
let d = digits n in
let s = sumList d in
if (n / 10) <> 0
then digitalRoot s
else s
let ff = f b in (ff , b = ff)
let wList = explode w in
let revList =
  listReverse wList in
match revList with
| wList -> true
let r =
  bigAdd (mulByDigit x
                     (List.rev l2)) [b] in
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
EMPTY
let res =
  List.fold_left f base args in
res
let x = myHelper n in
1 + additivePersistence x
let seen' = h :: seen in
let rest' = t in
helper (seen' , rest')
let separated = explode w in
let reversed =
  listReverse separated in
if separated = reversed
then true
else false
let result = f b in
(result , result = b)
let l' = bigAdd l l in
mulByDigit (i - 1) l'
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
let fb = f b in
if fb = b
then (true , fb)
else (false , fb)
