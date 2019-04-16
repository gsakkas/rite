LetG NonRec (fromList [(ConsPatG VarPatG (ConPatG Nothing),AppG (fromList [EmptyG]))]) (ListG (fromList [EmptyG]))
let d :: [] =
  digitsOfInt (n / 10) in
[d ; n mod 10]
