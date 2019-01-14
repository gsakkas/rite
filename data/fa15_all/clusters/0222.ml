LetG Rec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let rec generatePadding =
  fun numZeros ->
    if numZeros <= 0
    then []
    else 0 :: (generatePadding (numZeros - 1)) in
let toSum =
  intermediateSum @ generatePadding padCount in
(padCount + 1 , bigAdd currList
                       toSum)
