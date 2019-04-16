LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (ConAppG (Just EmptyG))
let d =
  digitsOfInt (n / 10) in
(n mod 10) :: d
