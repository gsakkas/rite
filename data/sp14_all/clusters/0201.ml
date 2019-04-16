LetG NonRec (fromList [(ConsPatG VarPatG (ConPatG Nothing),AppG (fromList [EmptyG]))]) (ListG (fromList [EmptyG]))
let y :: [] =
  loop (input / 10) in
[y ; input mod 10]
