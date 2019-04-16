LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let rec generatePadding =
  fun numZeros ->
    if numZeros <= 0
    then []
    else 0 :: (generatePadding (numZeros - 1)) in
let toSum =
  intermediateSum @ generatePadding padCount in
(padCount + 1 , bigAdd currList
                       toSum)
