LetG Rec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])
let rec generatePadding =
  fun numZeros ->
    if numZeros <= 0
    then []
    else 0 :: (generatePadding (numZeros - 1)) in
let toSum =
  intermediateSum @ generatePadding padCount in
(padCount + 1 , bigAdd currList
                       toSum)
EMPTY
let rec g =
  fun x ->
    if f x = b
    then x
    else g (x + 1) in
g 0
let rec helper =
  fun curList ->
    fun lt1 ->
      fun lt2 ->
        match lt1 with
        | [] -> curList
        | h :: t -> helper ((h , List.hd lt2) :: curList)
                           t (List.tl lt2) in
helper [] l1 l2
