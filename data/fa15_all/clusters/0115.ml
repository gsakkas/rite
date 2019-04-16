LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (IteG EmptyG EmptyG EmptyG)
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
