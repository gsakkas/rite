LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (IteG EmptyG EmptyG EmptyG)
let int =
  fun list ->
    fun digInt -> n mod 10 in
if n > 0
then digitsOfInt (n / 10)
else []
