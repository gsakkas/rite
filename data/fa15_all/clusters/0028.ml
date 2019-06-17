LetG NonRec [(VarPatG,BopG EmptyG EmptyG)] (AppG [EmptyG,EmptyG])
let b = fst x + snd x in
match a with
| h :: t -> ((h + b) / 10) :: (((h + b) mod 10) :: t)
| _ -> [b / 10 ; b mod 10]
EMPTY
let sum = fst x + snd x in
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
let comb =
  eval (e1 , x , y) +. eval (e2 , x , y) in
mod_float comb
          (eval (e3 , x , y))
