LetG NonRec (fromList [AppG (fromList [EmptyG])]) (ListG EmptyG Nothing)
let y :: [] =
  loop (input / 10) in
[y ; input mod 10]
